import 'package:flutter/material.dart';

getSnackBar(context, textToShowInSnackbar) {
  final snackBar = SnackBar(
    content: Text(textToShowInSnackbar),
  );
  return Scaffold.of(context).showSnackBar(snackBar);
}


validationForNull(context, value) {
  if (value != null&&value!='') {
    return true;
  } else {
    return false;
  }
}
