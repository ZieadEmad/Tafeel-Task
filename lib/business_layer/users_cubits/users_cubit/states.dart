import 'package:tafeeltask/data_layer/data_models/user_model/user_model.dart';

abstract class UsersStates {}

class UsersStateInitial extends UsersStates{}
class UsersStateLoading extends UsersStates{}

class UsersStateSuccess extends UsersStates{
  late List<UsersDataModel> usersList;
  UsersStateSuccess({required this.usersList});
}
class UsersStateLoadingPagination extends UsersStates{}

class UsersStateError extends UsersStates{
  String e;
  UsersStateError({required this.e});
}
class UsersStateNetworkError extends UsersStates{
  String e;
  UsersStateNetworkError({required this.e});
}
