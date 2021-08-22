
class User {

  int id;
  String name;
  int salary;
  int age;

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        salary = json['salary'],
        age = json['age'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'salary': salary,
    'age': age
  };
}