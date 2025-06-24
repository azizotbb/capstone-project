import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onTap;
  const ProfileOption({
    super.key,
    required this.icon,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        height: 31,
        width: 31,
        decoration: BoxDecoration(
          color: Color(0xffFF9E80),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }
}
