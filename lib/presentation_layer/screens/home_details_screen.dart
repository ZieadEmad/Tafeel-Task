import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafeeltask/business_layer/users_cubits/single_user_cubit/cubit.dart';
import 'package:tafeeltask/business_layer/users_cubits/single_user_cubit/states.dart';
import 'package:tafeeltask/core_layer/extensions/context_extensions.dart';
import 'package:tafeeltask/presentation_layer/widgets/screens_widgets/home_screen_widgets/error_widget.dart';
import 'package:tafeeltask/presentation_layer/widgets/screens_widgets/home_screen_widgets/success_item_widget.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key,required this.userId});
  final int userId ;
  @override
  Widget build(BuildContext context) {
    return   BlocProvider(
      create: (context)=> SingleUserCubit()..getSingleUserData(userId),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,),
        body: BlocBuilder<SingleUserCubit,SingleUserStates>(
          builder: (context,state) {
            if(state is SingleUserStateLoading){
              return const Center(child: CircularProgressIndicator());
            }
            else if (state is SingleUserStateError){
              return HomeScreenErrorWidget(error: state.e,function: (){SingleUserCubit.get(context).getSingleUserData(userId);},);
            }
            else if (state is SingleUserStateNetworkError){
              return HomeScreenErrorWidget(error: state.e,function: (){SingleUserCubit.get(context).getSingleUserData(userId);},);
            }
            else if (state is SingleUserStateSuccess){
              return Padding(
                padding:  const EdgeInsets.only(left: 16.0, right: 16.0 ),
                child: Column(
                  children: [
                    SizedBox(height: context.notchPadding+16,),
                    HomeSuccessItemWidget(
                      firstName: state.userDataModel.firstName,
                      lastName:  state.userDataModel.lastName,
                      email:  state.userDataModel.email,
                      userImageLink: state.userDataModel.avatar,
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
