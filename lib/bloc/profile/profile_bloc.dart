import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../values/strings.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfileEvent>((event, emit) async {
      emit(ProfileLoadingState());
      SupabaseClient supabaseClient = Supabase.instance.client;
      try {
        Map<String, dynamic> profileInfo = await supabaseClient.rpc(
          'get_profile_info',
          params: {
            'search_user_id': supabaseClient.auth.currentUser!.id,
          },
        );
        Logger().w(profileInfo);
        emit(ProfileSuccessState(profileDetails: profileInfo));
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(ProfileFailureState());
      }
    });
  }
}
