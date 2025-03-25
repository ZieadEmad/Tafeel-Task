import 'package:flutter/material.dart';

class LoadingPaginationWidget extends StatelessWidget {
  const LoadingPaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 8,),
        Center(child: CircularProgressIndicator(),),
        SizedBox(height: 16,),
      ],
    );
  }
}
