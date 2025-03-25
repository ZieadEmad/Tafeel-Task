import 'package:tafeeltask/data_layer/data_models/user_model/user_model.dart';

class UsersMainModel {
  late final int page;
  late final int totalPages;
  late final List<UsersDataModel> usersDataList;
  UsersMainModel.fromJson(Map<String, dynamic> json){
    page = json['page'];
    totalPages = json['total_pages'];
    usersDataList = List.from(json['data']).map((e)=>UsersDataModel.fromJson(e)).toList();
  }
}
