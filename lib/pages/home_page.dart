import 'package:flutter/material.dart';
import 'package:response_parsing/models/empList.dart';
import 'package:response_parsing/models/empOne.dart';
import 'package:response_parsing/models/employee.dart';
import 'package:response_parsing/pages/detail_page.dart';
import 'package:response_parsing/services/http_service.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Employee> items = [];
  String? empName;
  int? empAge;
  int? empSalayr;
  
  void _apiEmpList() {
    Network.GET(Network.API_EMPLOYEES, Network.paramsEmpty())
        .then((value) => {
      print(value),
      _showResponse(value!)
    });
  }
  void _showResponse(String? response) {
    EmpList empList = Network.parseEmpList(response!);
    setState(() {
      items = empList.data;
    });
  }

  void _apiEmpOne(int id) {
    Network.GET(Network.API_EMPLOYEE+id.toString(), Network.paramsEmpty())
        .then((value) => {
      print(value),
      _getEmpOne(value)
    });
  }
  void _getEmpOne(String? response) {
    EmpOne empOne = Network.parseEmpOne(response!);
    setState(() {
      empName = empOne.data!.employee_name;
      empAge = empOne.data!.employee_age;
      empSalayr = empOne.data!.employee_salary;
    });
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (BuildContext context) {
              return DetailPage(
                empName: empName,
                empAge: empAge,
                empSalary: empSalayr,
              );
            }
        )
    );
  }

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee List"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i) {
          return itemOfList(items[i]);
        },
      ),
    );
  }
  
  Widget itemOfList(Employee emp) {
    return GestureDetector(
      onTap: (){
        _apiEmpOne(emp.id);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emp.employee_name + "(" + emp.employee_age.toString() + ")",
              style: TextStyle(color: Colors.black, fontSize: 18),),
            SizedBox(height: 10,),
            Text(emp.employee_salary.toString() + "\$",
              style: TextStyle(color: Colors.black, fontSize: 18),)
          ],
        ),
      ),
    );
  }
  
}
