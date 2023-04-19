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

String? phoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a number';
  }
  final numericRegex = RegExp(r'^[0-9]+$');
  if (!numericRegex.hasMatch(value)) {
    return 'Please enter a valid number';
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
    return 'Please enter a valid place name';
  }
  return null;
}

String? district(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter a district name';
  } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
    return 'Please enter a valid district name';
  }
  return null;
}

String? pincode(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Pincode is required';
  }
  final RegExp regex = RegExp(r'^\d{6}$');
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

String? amount(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter an amount';
  }
  final numericRegex = RegExp(r'^[0-9]+\.?[0-9]*$');
  if (!numericRegex.hasMatch(value)) {
    return 'Please enter a valid number';
  }
  return null;
}

String? accountHolder(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter account holder name';
  }
  if (value.length < 3) {
    return 'Account holder name should be at least 3 characters long';
  }
  if (value.contains(RegExp(r'[0-9]'))) {
    return 'Account holder name should not contain any numbers';
  }
  return null;
}

String? accountNumber(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter account number';
  }
  if (value.length < 10) {
    return 'Account number should be at least 10 digits long';
  }
  final numericRegex = RegExp(r'^[0-9]+$');
  if (!numericRegex.hasMatch(value)) {
    return 'Account number should contain only digits';
  }
  return null;
}

String? branchName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter branch name';
  }
  if (value.length < 3) {
    return 'Branch name should be at least 3 characters long';
  }
  final alphaNumericRegex = RegExp(r'^[a-zA-Z0-9\s]+$');
  if (!alphaNumericRegex.hasMatch(value)) {
    return 'Branch name should contain only alphabets or digits';
  }
  return null;
}

String? ifscCode(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter IFSC code';
  }
  if (value.length != 11) {
    return 'IFSC code should be 11 characters long';
  }

  return null;
}

String? titleValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter a title';
  }
  return null;
}

String? description(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter a description';
  }
  return null;
}

String? password(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter a password';
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}
