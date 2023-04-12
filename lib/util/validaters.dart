final RegExp regex = RegExp(r'^\d{6}$');

String? fullName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your name';
  }
  final nameExp = RegExp(r'^[A-Za-z ]+$');
  if (!nameExp.hasMatch(value)) {
    return 'Please enter a valid name';
  }
  return null;
}

String? addressLine(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your address line';
  }
  return null;
}

String? place(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter a place name';
  } else if (value.length < 3) {
    return 'Place name must be at least 3 characters';
  } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
    return 'Please enter a valid district name';
  }
  return null;
}

String? district(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter a place name';
  } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
    return 'Please enter a valid district name';
  }
  return null;
}

String? pincode(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Pincode is required';
  }
  if (!regex.hasMatch(value)) {
    return 'Please enter a valid 6-digit pincode';
  }
  return null;
}

String? state(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'State is required';
  } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
    return 'Please enter a valid state name';
  }
  return null;
}

String? email(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'email is required';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Please enter a valid email ';
  }
  return null;
}
