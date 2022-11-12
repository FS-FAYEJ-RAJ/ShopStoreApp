import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:storeapprestapi/contens/golobals_colors.dart';
class CatagoricWidget extends StatelessWidget {
  CatagoricWidget({Key? key, required this.title,required this.image}) : super(key: key);
  String? title;
  String? image;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        color: Colors.blueGrey,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                height: size.height *0.45,
                width: size.width*0.45,
                errorWidget:const Icon(
                  IconlyBold.danger,
                  color: Colors.redAccent,
                ),
                imageUrl: image.toString(),
                boxFit: BoxFit.fill,
              ),
            ),
            
            Align(
              alignment: Alignment.center,
              child: Text(title.toString(),style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                backgroundColor: lightTextColor.withOpacity(0.5)
              ),
              textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}
