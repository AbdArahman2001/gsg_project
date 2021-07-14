import 'package:flutter/material.dart';

class Student {
  final int id;
  final String name;
  final String schoolName;
  final String className;
  final double arabicGrade;
  final double englishGrade;
  final double mathGrade;

  Student(
      {
        @required this.name,
        @required this.id,
      @required this.schoolName,
      @required this.className,
      @required this.arabicGrade,
      @required this.englishGrade,
      @required this.mathGrade});

}
class StudentInfo extends StatelessWidget {
  final String name;
  final String schoolName;
  final String className;
  final double arabicGrade;
  final double englishGrade;
  final double mathGrade;
  final Color color;

  StudentInfo(this.name, this.schoolName, this.className, this.arabicGrade,
      this.englishGrade, this.mathGrade,this.color);

  @override
  Widget build(BuildContext context) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.only(top: 12, left: 12, right: 12),
        color: color.withOpacity(0.3),
        elevation: 12,
        child: Column(
          children: [
            singleRow('Name', name),
            singleRow('schoolName', schoolName),
            singleRow('className', className),
            singleRow('arabicGrade', '$arabicGrade'),
            singleRow('englishGrade', '$englishGrade'),
            singleRow('mathGrade', '$mathGrade'),
          ],
        ),
      );
    }
  Row singleRow(String label, String value) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 18,horizontal: 8),
            margin: EdgeInsets.all(8),
            child: Text('$label:'),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 18,horizontal: 8),
            margin: EdgeInsets.all(8),
            child: Text(value),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

}

