import 'package:flutter/material.dart';

class myMenuItem extends StatefulWidget {
  const myMenuItem(
      {required this.title, required this.icon, required this.onTap});

  final String title;
  final icon;
  final onTap;

  @override
  State<myMenuItem> createState() => _myMenuItemState();
}

class _myMenuItemState extends State<myMenuItem> {
  @override
  Widget build(BuildContext context) {
    var slideWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: slideWidth * 0.5,
      child: ListTile(
        onTap: widget.onTap,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        trailing: Icon(
          widget.icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
