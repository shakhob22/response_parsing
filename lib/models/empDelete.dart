
class EmpDelete {
  String? status;
  String? message;
  String? data;

  EmpDelete.fromjson(Map<String, dynamic> json)
  : status = json["status"],
    message = json["message"],
    data = json["data"];

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data
  };
}