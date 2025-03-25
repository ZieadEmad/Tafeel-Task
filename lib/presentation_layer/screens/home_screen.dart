import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafeeltask/business_layer/users_cubits/users_cubit/cubit.dart';
import 'package:tafeeltask/business_layer/users_cubits/users_cubit/states.dart';
import 'package:tafeeltask/core_layer/extensions/context_extensions.dart';
import 'package:tafeeltask/core_layer/helpers/navigators.dart';
import 'package:tafeeltask/presentation_layer/screens/home_details_screen.dart';
import 'package:tafeeltask/presentation_layer/widgets/screens_widgets/home_screen_widgets/error_widget.dart';
import 'package:tafeeltask/presentation_layer/widgets/screens_widgets/home_screen_widgets/success_item_widget.dart';
import 'package:tafeeltask/presentation_layer/widgets/shared_widgets/loading_pagination_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController ;
  @override
  void initState() {
    scrollController = ScrollController();

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=> UsersCubit()..getUsers()..listener(scrollController),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<UsersCubit,UsersStates>(
          builder: (context,state) {
            if(state is UsersStateLoading){
              return const Center(child: CircularProgressIndicator());
            }
            else if (state is UsersStateError){
              return HomeScreenErrorWidget(error: state.e,function: (){UsersCubit.get(context).getUsers();},);
            }
            else if (state is UsersStateNetworkError){
              return HomeScreenErrorWidget(error: state.e,function: (){UsersCubit.get(context).getUsers();},);
            }
            else if (state is UsersStateSuccess||state is UsersStateLoadingPagination){
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      controller: scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding:  EdgeInsets.only(left: 16.0, right: 16.0,top: context.notchPadding+16,bottom:context.notchPadding+16 ),
                      itemBuilder: (context,index)=> InkWell(
                        onTap: (){
                          navigateTo(context, HomeDetailsScreen(userId: UsersCubit.get(context).usersList[index].id));
                        },
                        child: HomeSuccessItemWidget(
                            firstName: UsersCubit.get(context).usersList[index].firstName,
                            lastName:  UsersCubit.get(context).usersList[index].lastName,
                            email:  UsersCubit.get(context).usersList[index].email,
                          userImageLink: UsersCubit.get(context).usersList[index].avatar,
                        ),
                      ),
                        separatorBuilder: (context,index)=> const SizedBox(height: 16,),
                        itemCount: UsersCubit.get(context).usersList.length,
                    ),
                  ),
                  if(state is UsersStateLoadingPagination)  const LoadingPaginationWidget(),
                ],
              );
            }
           return const SizedBox();
          },
        ),
      ),
    );
  }
}
