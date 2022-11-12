import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:storeapprestapi/contens/golobals_colors.dart';


class UserWidget extends StatefulWidget {
  String? name;
  String? email;
  String? image;
  String? role;
   UserWidget({Key? key,required this.name,required this.email,required this.image,required this.role}) : super(key: key);
  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return ListTile(
      leading:  FancyShimmerImage(
        height: size.width*0.15,
        width: size.width*0.15,
        imageUrl:widget.image.toString(),
        boxFit: BoxFit.fill,
      ),
      title: Text(widget.name.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: lightTextColor),),
      subtitle:  Text(widget.email.toString(),style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: lightTextColor),),
      trailing:Text(widget.role.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: lightTextColor),),
    );
  }
}
