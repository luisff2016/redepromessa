// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> verificaEmail(String? email) async {
  // check if a string contains a valid email and return true or false

  if (email == null) {
    return false;
  }

  String emailPattern =
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // Regular expression for email pattern

  RegExp regExp = RegExp(emailPattern);

  if (regExp.hasMatch(email)) {
    return true;
  } else {
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
