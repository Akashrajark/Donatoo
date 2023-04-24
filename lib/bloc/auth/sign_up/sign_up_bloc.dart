import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitialState()) {
    on<SignUpEvent>((event, emit) async {
      emit(SignUpLoadingState());
      try {
        UserResponse user =
            await Supabase.instance.client.auth.admin.createUser(
          AdminUserAttributes(
            email: event.email,
            password: event.password,
            phone: event.phone,
            emailConfirm: true,
            userMetadata: {
              'status': 'active',
            },
          ),
        );

        if (user.user != null) {
          await Supabase.instance.client.from('profile').insert(
            {
              'name': event.name,
              'phone': event.phone,
              'email': event.email,
              'user_id': user.user!.id,
            },
          );

          await Supabase.instance.client.auth.signInWithPassword(
            email: event.email,
            password: event.password,
          );
        }

        emit(SignUpSuccessState());
      } on AuthException catch (e, s) {
        Logger().wtf("$e\n$s");
        if (e.statusCode == '422') {
          emit(SignUpFailureState(
            message: e.message,
          ));
        } else {
          emit(SignUpFailureState());
        }
      }
    });
  }
}
