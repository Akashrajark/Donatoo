part of 'manage_organizations_bloc.dart';

@immutable
abstract class ManageOrganizationsState {}

class ManageOrganizationsInitialState extends ManageOrganizationsState {}

class ManageOrganizationsLoadingState extends ManageOrganizationsState {}

class ManageOrganizationsSuccessState extends ManageOrganizationsState {
  final List<Map<String, dynamic>> organizations;

  ManageOrganizationsSuccessState({required this.organizations});
}

class ManageOrganizationsFailureState extends ManageOrganizationsState {
  final String message;

  ManageOrganizationsFailureState({this.message = errorMessage});
}
