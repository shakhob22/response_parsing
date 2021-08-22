import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static final String id = "detail_page";
  final String? empName;
  final int? empAge;
  final int? empSalary;

  const DetailPage({Key? key, this.empName, this.empAge, this.empSalary}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.empName!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.empName! + "(" + widget.empAge.toString() + ")",
              style: TextStyle(color: Colors.black, fontSize: 18),),
            SizedBox(height: 10,),
            Text(widget.empSalary.toString() + "\$",
              style: TextStyle(color: Colors.black, fontSize: 18),)
          ],
        ),
      ),
    );
  }
}
