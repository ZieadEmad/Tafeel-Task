

class UsersDataModel {
  late final int id;
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String avatar;

  UsersDataModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
}
