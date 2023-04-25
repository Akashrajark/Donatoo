import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:donatoo/values/strings.dart';
import 'package:file_picker/file_picker.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'manage_requests_event.dart';
part 'manage_requests_state.dart';

class ManageRequestBloc extends Bloc<ManageRequestsEvent, ManageRequestState> {
  ManageRequestBloc() : super(ManageRequestsInitialState()) {
    on<ManageRequestsEvent>((event, emit) async {
      emit(ManageRequestsLoadingState());

      try {
        SupabaseClient supabaseClient = Supabase.instance.client;
        SupabaseQueryBuilder queryTable = supabaseClient.from('request');
        SupabaseQueryBuilder profileTable = supabaseClient.from('profile');

        if (event is GetAllRequestsEvent) {
          List<dynamic> tempReqs = [];

          if (event.query != null) {
            tempReqs = await queryTable
                .select('*')
                .eq('status', 'active')
                .ilike('title', '%${event.query}%')
                .neq('user_id', supabaseClient.auth.currentUser!.id)
                .order('title', ascending: true);
          } else if (event.ownRequests) {
            tempReqs = await queryTable
                .select('*')
                .eq('user_id', supabaseClient.auth.currentUser!.id)
                .order('title', ascending: true);
          } else {
            tempReqs = await queryTable
                .select('*')
                .eq('status', 'active')
                .neq('user_id', supabaseClient.auth.currentUser!.id)
                .order('title', ascending: true);
          }

          List<Map<String, dynamic>> requests =
              tempReqs.map((e) => e as Map<String, dynamic>).toList();

          for (int i = 0; i < requests.length; i++) {
            requests[i]['user'] = await profileTable
                .select('*')
                .eq('user_id', requests[i]['user_id'])
                .single();
          }
          if (event.ownRequests) {
            emit(ManageOwnRequestsSuccessState(requests: requests));
          } else {
            emit(ManageRequestsSuccessState(requests: requests));
          }
        } else if (event is AddRequestEvent) {
          String path = await supabaseClient.storage.from('docs').upload(
              'req/${DateTime.now().millisecondsSinceEpoch.toString()}${event.image.name}',
              File(event.image.path!));

          path = path.replaceRange(0, 5, '');

          await queryTable.insert({
            'image': supabaseClient.storage.from('docs').getPublicUrl(path),
            'user_id': supabaseClient.auth.currentUser!.id,
            'title': event.title,
            'description': event.description,
            'duedate': event.duedate.toIso8601String(),
            'amount_required': event.amountRequired,
            'amount_collected': event.amountCollected,
            'bank_account_no': event.bankAcNumber,
            'account_holder': event.accountHolder,
            'ifsc_code': event.ifscCode,
            'patient_name': event.patientName,
            'patient_address_line': event.patientAddressLine,
            'patient_place': event.patientPlace,
            'patient_district': event.patientDistrict,
            'patient_state': event.patientState,
            'patient_pincode': event.patientPinCode,
            'hospital_name': event.hospitalName,
            'hospital_address_line': event.hospitalAddressLine,
            'hospital_place': event.hospitalPlace,
            'hospital_district': event.hospitalDistrict,
            'hospital_state': event.hospitalState,
            'hospital_pincode': event.hospitalPinCode,
            'patient_phone': event.patientPhone,
            'hospital_phone': event.hospitalPhone,
            'branch_name': event.branchName,
          });
          add(
            GetAllRequestsEvent(ownRequests: true),
          );
        } else if (event is EditRequestEvent) {
          Map<String, dynamic> updateDetails = {
            'title': event.title,
            'description': event.description,
            'duedate': event.duedate.toIso8601String(),
            'amount_required': event.amountRequired,
            'amount_collected': event.amountCollected,
            'bank_account_no': event.bankAcNumber,
            'account_holder': event.accountHolder,
            'ifsc_code': event.ifscCode,
            'patient_name': event.patientName,
            'patient_address_line': event.patientAddressLine,
            'patient_place': event.patientPlace,
            'patient_district': event.patientDistrict,
            'patient_state': event.patientState,
            'patient_pincode': event.patientPinCode,
            'hospital_name': event.hospitalName,
            'hospital_address_line': event.hospitalAddressLine,
            'hospital_place': event.hospitalPlace,
            'hospital_district': event.hospitalDistrict,
            'hospital_state': event.hospitalState,
            'hospital_pincode': event.hospitalPinCode,
            'patient_phone': event.patientPhone,
            'hospital_phone': event.hospitalPhone,
            'branch_name': event.branchName,
          };

          if (event.image != null) {
            String path = await supabaseClient.storage.from('docs').upload(
                'req/${DateTime.now().millisecondsSinceEpoch.toString()}${event.image!.name}',
                File(event.image!.path!));

            path = path.replaceRange(0, 5, '');

            updateDetails['image'] =
                supabaseClient.storage.from('docs').getPublicUrl(path);
          }

          await queryTable.update(updateDetails).eq('id', event.requestId);
          add(
            GetAllRequestsEvent(ownRequests: true),
          );
        } else if (event is UpdateRequestStatusEvent) {
          await queryTable
              .update({'status': event.status}).eq('id', event.requestId);
          add(GetAllRequestsEvent(ownRequests: true));
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(ManageRequestsFailureState(message: e.toString()));
      }
    });
  }
}
