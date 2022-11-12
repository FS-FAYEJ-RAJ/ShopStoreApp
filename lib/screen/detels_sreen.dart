import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storeapprestapi/contens/golobals_colors.dart';
import 'package:storeapprestapi/controllar/productcontrollar.dart';

class DetelScreen extends StatefulWidget {

   DetelScreen({Key? key}) : super(key: key);


  @override
  State<DetelScreen> createState() => _DetelScreenState();
}

class _DetelScreenState extends State<DetelScreen> {

  final ProductControllar productControllar=Get.put(ProductControllar());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButton(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Text(
                    "",
                     style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                   ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lorem Ipsum",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "\$",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(35, 150, 243, 1)),
                            children: [
                              TextSpan(
                                  text: "168.00",
                                  style: TextStyle(
                                      color: lightTextColor, fontSize: 20))
                            ]),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: size.height * 0.3,
                      child: Swiper(
                        itemBuilder: (context, index) {
                          return FancyShimmerImage(
                            imageUrl: "https://i.ibb.co/vwB46Yq/shoes.png",
                            width: double.infinity,
                            boxFit: BoxFit.fill,
                          );
                        },
                        autoplay: true,
                        pagination: const SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                                activeColor: Colors.deepOrange,
                                color: Colors.white)),
                        itemCount: 3,
                        controller: SwiperController(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Discreption",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "cultural influences have helped spawn variant interpretatioements of historical investigation. History is often taught as a part of primary and secondary education, and the academic study of history is a major discipline in university studies.",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
                    color: lightTextColor),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
