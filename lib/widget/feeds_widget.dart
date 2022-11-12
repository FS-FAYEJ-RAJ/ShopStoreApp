import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:storeapprestapi/screen/detels_sreen.dart';
import '../contens/golobals_colors.dart';
import '../controllar/productcontrollar.dart';

class FeedWidget extends StatelessWidget {
  String ? title;
  int ? price;
  String ?image;
  FeedWidget({Key? key,required this.title,required this.price,required this.image}) : super(key: key);
  final ProductControllar productControllar=Get.put(ProductControllar());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(0.8),
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: DetelScreen(), type: PageTransitionType.fade));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: RichText(
                          text: TextSpan(
                              text: '\$',
                              style: const TextStyle(
                                  color: Color.fromRGBO(35, 150, 243, 1)),
                              children: [
                            TextSpan(
                                text: price.toString(),
                                style: TextStyle(
                                  color: lightTextColor,
                                ))
                          ])),
                    ),
                    Icon(IconlyBold.heart)
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                  imageUrl:image.toString() ,
                  boxFit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 15,
              ),
               Padding(
                padding:  EdgeInsets.all(8.0),
                child: Text(
                   title.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              )
            ],
          ),
        ),
      ),
    );
  }
}
