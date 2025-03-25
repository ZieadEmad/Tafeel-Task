import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tafeeltask/core_layer/extensions/context_extensions.dart';

class HomeSuccessItemWidget extends StatelessWidget {
  const HomeSuccessItemWidget({super.key,required this.firstName,required this.lastName,required this.email,required this.userImageLink});
  final String firstName;
  final String lastName;
  final String email;
  final String userImageLink;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 8,),
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.hardEdge, // this clips the image into the circle
            child: CachedNetworkImage(imageUrl: userImageLink),
          ),
          const SizedBox(width: 16,),
           Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              Text('$firstName $lastName',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
              Text(email,style: const TextStyle(color: Colors.grey,fontSize: 16)),
              const SizedBox(height: 30,),
            ],
          )
        ],
      ),
    );
  }
}
