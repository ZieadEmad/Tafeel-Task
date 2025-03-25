import 'package:tafeeltask/data_layer/data_models/user_model/user_model.dart';

abstract class SingleUserStates {}

class SingleUserStateInitial extends SingleUserStates{}
class SingleUserStateLoading extends SingleUserStates{}

class SingleUserStateSuccess extends SingleUserStates{
  late UsersDataModel userDataModel;
  SingleUserStateSuccess({required this.userDataModel});
}

class SingleUserStateError extends SingleUserStates{
  String e;
  SingleUserStateError({required this.e});
}
class SingleUserStateNetworkError extends SingleUserStates{
  String e;
  SingleUserStateNetworkError({required this.e});
}
