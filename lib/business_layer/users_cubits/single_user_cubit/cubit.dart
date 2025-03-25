import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafeeltask/business_layer/users_cubits/single_user_cubit/states.dart';
import 'package:tafeeltask/core_layer/constants/apis_fail_constants.dart';
import 'package:tafeeltask/data_layer/data_models/user_model/user_model.dart';
import 'package:tafeeltask/domain_layer/end_points/end_points.dart';
import 'package:tafeeltask/domain_layer/remote_source/dio_helper.dart';

class SingleUserCubit extends Cubit<SingleUserStates> {
  SingleUserCubit() : super(SingleUserStateInitial());
  static SingleUserCubit get(context) => BlocProvider.of(context);

  late UsersDataModel userDataModel;

//this function to get Single User data by user id in user details screen from api
  getSingleUserData(int userId){
    emit(SingleUserStateLoading());
    DioHelper.getData(
      path: getSingleUserEndPoint(userId),
    ).then((value)async{
      userDataModel = UsersDataModel.fromJson(value.data['data']);
      emit(SingleUserStateSuccess(userDataModel: userDataModel));
    }).catchError((e){
      print('$baseUrl${getSingleUserEndPoint(userId)}');
      if (e is DioException) {
        if (e.error is SocketException|| e.type == DioExceptionType.receiveTimeout) {
          emit(SingleUserStateNetworkError(e: networkConnectionMessage));
        }
        else {
          emit(SingleUserStateError(e:  e.toString()));
        }
      } else {
        emit(SingleUserStateError(e:  e.toString()));
      }
    });
  }



}