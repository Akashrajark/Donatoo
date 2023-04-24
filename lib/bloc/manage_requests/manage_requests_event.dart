part of 'manage_requests_bloc.dart';

@immutable
abstract class ManageRequestsEvent {}

class AddRequestEvent extends ManageRequestsEvent {
  final String title,
      description,
      bankAcNumber,
      ifscCode,
      accountHolder,
      patientName,
      patientAddressLine,
      patientPlace,
      patientDistrict,
      patientState,
      patientPinCode,
      hospitalName,
      hospitalAddressLine,
      hospitalPlace,
      hospitalDistrict,
      hospitalState,
      hospitalPinCode,
      branchName,
      hospitalPhone;
  final int amountRequired, amountCollected, patientPhone;
  final DateTime duedate;
  final PlatformFile image;

  AddRequestEvent({
    required this.title,
    required this.description,
    required this.amountRequired,
    required this.amountCollected,
    required this.duedate,
    required this.image,
    required this.bankAcNumber,
    required this.ifscCode,
    required this.accountHolder,
    required this.patientName,
    required this.patientAddressLine,
    required this.patientPlace,
    required this.patientDistrict,
    required this.patientState,
    required this.patientPinCode,
    required this.hospitalName,
    required this.hospitalAddressLine,
    required this.hospitalPlace,
    required this.hospitalDistrict,
    required this.hospitalState,
    required this.hospitalPinCode,
    required this.patientPhone,
    required this.branchName,
    required this.hospitalPhone,
  });
}

class EditRequestEvent extends ManageRequestsEvent {
  final String title,
      description,
      bankAcNumber,
      ifscCode,
      accountHolder,
      patientName,
      patientAddressLine,
      patientPlace,
      patientDistrict,
      patientState,
      patientPinCode,
      hospitalName,
      hospitalAddressLine,
      hospitalPlace,
      hospitalDistrict,
      hospitalState,
      hospitalPinCode,
      branchName,
      hospitalPhone;
  final int amountRequired, amountCollected, patientPhone, requestId;
  final DateTime duedate;
  final PlatformFile? image;

  EditRequestEvent({
    required this.title,
    required this.description,
    required this.amountRequired,
    required this.amountCollected,
    required this.duedate,
    required this.requestId,
    this.image,
    required this.bankAcNumber,
    required this.ifscCode,
    required this.accountHolder,
    required this.patientName,
    required this.patientAddressLine,
    required this.patientPlace,
    required this.patientDistrict,
    required this.patientState,
    required this.patientPinCode,
    required this.hospitalName,
    required this.hospitalAddressLine,
    required this.hospitalPlace,
    required this.hospitalDistrict,
    required this.hospitalState,
    required this.hospitalPinCode,
    required this.patientPhone,
    required this.branchName,
    required this.hospitalPhone,
  });
}

class GetAllRequestsEvent extends ManageRequestsEvent {
  final String? query, status;
  final bool ownRequests;

  GetAllRequestsEvent({this.query, this.status, this.ownRequests = false});
}

class HandleRequestsEvent extends ManageRequestsEvent {
  final String? query, status;

  HandleRequestsEvent({
    this.query,
    this.status,
  });
}

class UpdateRequestStatusEvent extends ManageRequestsEvent {
  final String status;
  final int requestId;

  UpdateRequestStatusEvent({
    required this.status,
    required this.requestId,
  });
}

//TODO: close status with reason
