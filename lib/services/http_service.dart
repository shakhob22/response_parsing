import 'dart:convert';

import 'package:http/http.dart';
import 'package:response_parsing/models/empList.dart';
import 'package:response_parsing/models/empOne.dart';
import 'package:response_parsing/models/employee.dart';

class Network{

  static String BASE = "dummy.restapiexample.com";
  static Map<String,String> headers = {"Content-Type":"application/json; charset=UTF-8"};

  /* Http Apis */

  static String API_EMPLOYEES = "/api/v1/employees";
  static String API_EMPLOYEE  = "/api/v1/employee/"; //{id}
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/";// {id}
  static String API_DELETE = "/api/v1/delete/";// {id}

  /* Http request */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params); // http or https
    var response = await get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
      return null;
  }

  static Future<String?> GETONE(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params); // http or https
    var response = await get(uri);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  static Future<String?> Post(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api); // http or https
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api); // http or https
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    return Map();
  }

  static Map<String, String> paramsCreate(Employee Employee) {
    Map<String, String> params = new Map();
    params.addAll({
      "employee_name": Employee.employee_name,
      "employee_salary": Employee.employee_salary.toString(),
      "employee_age": Employee.employee_age.toString(),
      "profile_image": Employee.profile_image
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Employee Employee) {
    Map<String, String> params = new Map();
    params.addAll({
      "id": Employee.id.toString(),
      "employee_name": Employee.employee_name,
      "employee_salary": Employee.employee_salary.toString(),
      "employee_age": Employee.employee_age.toString(),
      "profile_image": Employee.profile_image
    });
    return params;
  }

  /*Http parsing*/

  static EmpList parseEmpList(String body) {
    dynamic json = jsonDecode(body);
    var data = EmpList.fromJson(json);
    return data;
  }

  static EmpOne parseEmpOne(String body) {
    dynamic json = jsonDecode(body);
    var data = new EmpOne.fromJson(json!);
    return data;
  }

}















