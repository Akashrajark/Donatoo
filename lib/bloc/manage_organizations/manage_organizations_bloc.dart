import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../values/strings.dart';

part 'manage_organizations_event.dart';
part 'manage_organizations_state.dart';

class ManageOrganizationsBloc
    extends Bloc<ManageOrganizationsEvent, ManageOrganizationsState> {
  ManageOrganizationsBloc() : super(ManageOrganizationsInitialState()) {
    on<ManageOrganizationsEvent>((event, emit) async {
      emit(ManageOrganizationsLoadingState());

      try {
        SupabaseClient supabaseClient = Supabase.instance.client;
        SupabaseQueryBuilder queryTable = supabaseClient.from('organizations');
        SupabaseQueryBuilder paymentsTable =
            supabaseClient.from('organization_payments');
        SupabaseQueryBuilder reportOrganisationTable =
            supabaseClient.from('organization_report');

        if (event is GetAllOrganizationEvent) {
          List<dynamic> tempOrgs = [];

          if (event.query != null) {
            tempOrgs = await queryTable
                .select('*')
                .eq('status', 'active')
                .ilike('name', '%${event.query}%')
                .order('name', ascending: true);
          } else {
            tempOrgs = await queryTable
                .select('*')
                .eq('status', 'active')
                .order('name', ascending: true);
          }

          List<Map<String, dynamic>> organizations =
              tempOrgs.map((e) => e as Map<String, dynamic>).toList();

          for (int i = 0; i < organizations.length; i++) {
            organizations[i]['payments'] = await paymentsTable
                .select('*')
                .eq('organization_id', organizations[i]['id'])
                .order('created_at');
            organizations[i]['total_payment'] = 0;
            for (int j = 0; j < organizations[i]['payments'].length; j++) {
              organizations[i]['total_payment'] +=
                  organizations[i]['payments'][j]['amount'];
            }
          }

          Logger().w(organizations);
          emit(ManageOrganizationsSuccessState(organizations: organizations));
        } else if (event is PayOrganizationEvent) {
          await paymentsTable.insert({
            'user_id': supabaseClient.auth.currentUser!.id,
            'amount': event.amount,
            'organization_id': event.id,
          });
          add(GetAllOrganizationEvent());
        } else if (event is ReportOrganizationEvent) {
          await reportOrganisationTable.insert({
            'user_id': supabaseClient.auth.currentUser!.id,
            'reason': event.reason,
            'organization_id': event.id,
          });
          add(GetAllOrganizationEvent());
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(ManageOrganizationsFailureState(message: e.toString()));
      }
    });
  }
}
