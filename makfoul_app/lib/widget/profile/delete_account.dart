import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        // for deleteing
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Text("delete_confirmation".tr()),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "cancel".tr(),
                style: TextStyle(color: Color(0xff444444)),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("accept".tr(), style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
