part of 'manage_requests_bloc.dart';

@immutable
abstract class ManageRequestState {}

class ManageRequestsInitialState extends ManageRequestState {}

class ManageRequestsLoadingState extends ManageRequestState {}

class ManageRequestsSuccessState extends ManageRequestState {
  final List<Map<String, dynamic>> requests;

  ManageRequestsSuccessState({required this.requests});
}

class ManageOwnRequestsSuccessState extends ManageRequestState {
  final List<Map<String, dynamic>> requests;

  ManageOwnRequestsSuccessState({required this.requests});
}

class ManageRequestsFailureState extends ManageRequestState {
  final String message;

  ManageRequestsFailureState({this.message = errorMessage});
}
