import 'package:flutter/material.dart';

class HomeScreenErrorWidget extends StatelessWidget {
  const HomeScreenErrorWidget({super.key,required this.error,required this.function});
  final String error ;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: function,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Text(error)),
            const SizedBox(height: 16,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Retry',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
                SizedBox(width: 4,),
                Icon(Icons.refresh)
              ],
            )
          ],
        ),
      ),
    );
  }
}
