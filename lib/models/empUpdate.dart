
class EmpUpdate {
  String? status;
  String? message;
  List data = [];

  EmpUpdate.fromJson(Map<String, dynamic> json)
  : status = json["status"],
    message = json["message"];

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message
  };
}