import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  void showToast(String message, {Toast length = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: length,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: length == Toast.LENGTH_SHORT ? 4 : 8,
        backgroundColor: blackColor,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  void showErrorToast(String message, {Toast length = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: length,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: length == Toast.LENGTH_SHORT ? 4 : 8,
        backgroundColor: error,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  void showCustomToast(BuildContext context, String message,
      {Toast length = Toast.LENGTH_SHORT}) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey[100],
        border: Border.all(color: accentColor, width: 2),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    FToast().init(context).showToast(
          child: toast,
          gravity: ToastGravity.CENTER,
          toastDuration:
              Duration(seconds: length == Toast.LENGTH_SHORT ? 4 : 8),
        );
  }
}

const blackColor = Color.fromARGB(255, 12, 12, 12);
const accentColor = Color.fromARGB(255, 151, 253, 125);
const error = Color.fromARGB(255, 191, 43, 53);
