import 'package:e_lib_admin/Utils/utils.dart';
import 'package:flutter/material.dart';

class AddBookScreen extends StatelessWidget {
  const AddBookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: getText("Harsh Taliwal\nHarsh Taliwal\nHarsh Taliwal\nHarsh Taliwal\nHarsh Taliwal\nHarsh Taliwal\nHarsh Taliwal\nHarsh Taliwal\n"),
    );
  }

  Text getText(
    String content, {
    Color color = Utils.primaryColor,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Text(
      content,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
