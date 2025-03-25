import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafeeltask/business_layer/users_cubits/users_cubit/states.dart';
import 'package:tafeeltask/core_layer/constants/apis_fail_constants.dart';
import 'package:tafeeltask/data_layer/data_models/user_model/user_model.dart';
import 'package:tafeeltask/data_layer/data_models/user_model/users_main_model.dart';
import 'package:tafeeltask/domain_layer/end_points/end_points.dart';
import 'package:tafeeltask/domain_layer/remote_source/dio_helper.dart';

class UsersCubit extends Cubit<UsersStates> {
  UsersCubit() : super(UsersStateInitial());

  static UsersCubit get(context) => BlocProvider.of(context);

  late List<UsersDataModel> usersList;
  late UsersMainModel usersMainModel;
  int currentPage = 1;
  int totalPages = 1;

//this function to get Users data in home screen from api
  getUsers(){
    emit(UsersStateLoading());
    DioHelper.getData(
        path: getUsersEndPoint,
        query: {
          "page":currentPage,
        }
    ).then((value)async{
      usersMainModel = UsersMainModel.fromJson(value.data);
      totalPages = usersMainModel.totalPages;
      usersList = usersMainModel.usersDataList;
      emit(UsersStateSuccess(usersList: usersList));
    }).catchError((e){
      if (e is DioException) {
        if (e.error is SocketException|| e.type == DioExceptionType.receiveTimeout) {
          emit(UsersStateNetworkError(e: networkConnectionMessage));
        }
        else {
          emit(UsersStateError(e:  e.toString()));
        }
      } else {
        emit(UsersStateError(e:  e.toString()));
      }
    });
  }


// this function to handle user scrolling to use pagination lazy scrolling screen controller
  listener(ScrollController pagingController) async{
    if (pagingController.position.atEdge) {
      bool isInBottom = pagingController.position.pixels != 0;
      if (isInBottom) {
        getUsersPaginated();
      }
    }
  }


//this function to get Users data in home screen from api with pagination
  getUsersPaginated(){
    if(state is UsersStateLoadingPagination){return;}
    else if(currentPage < totalPages){
      currentPage = currentPage+1;
      emit(UsersStateLoadingPagination());
      DioHelper.getData(
          path: getUsersEndPoint,
          query: {
            "page":currentPage,
          }
      ).then((value)async{
        usersMainModel = UsersMainModel.fromJson(value.data);
        totalPages = usersMainModel.totalPages;
        usersList.addAll(usersMainModel.usersDataList);
        emit(UsersStateSuccess(usersList: usersList));
      }).catchError((e){
        totalPages-1;
      });
    }
    else{return;}
  }






}