import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:storeapprestapi/contens/golobals_colors.dart';
import 'package:storeapprestapi/controllar/productcontrollar.dart';
import 'package:storeapprestapi/screen/UserScreen.dart';
import 'package:storeapprestapi/screen/categoric_sreen.dart';
import 'package:storeapprestapi/screen/feedscreen.dart';
import 'package:storeapprestapi/widget/appbaricons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:storeapprestapi/widget/feeds_widget.dart';
import 'package:storeapprestapi/widget/sale_widget.dart';
import 'package:card_swiper/card_swiper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchControllar = TextEditingController();
  ProductControllar productControllar=Get.put(ProductControllar());

  @override
  void dispose() {
    _searchControllar.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          leading: AppBarIcons(function: () {
            Navigator.push(context, PageTransition(child:CetagoricScreen(), type: PageTransitionType.fade));
          }, icon: IconlyBold.category),
          actions: [AppBarIcons(function: () {
            Navigator.push(context, PageTransition(child: UserScreen(), type: PageTransitionType.fade));
          }, icon: IconlyBold.user3)],
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _searchControllar,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                        BorderSide(color: Theme.of(context).cardColor)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Theme.of(context).backgroundColor, width: 1)),
                    suffixIcon: Icon(
                      IconlyLight.search,
                      color: lightIconColor,
                    ),
                  ),
                ),
                SizedBox(height: 15),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                            height: size.height * 0.25,
                            child: Swiper(
                              itemBuilder: (contex, index) {
                                return SaleWidget();
                              },
                              itemCount: 3,
                              pagination: const SwiperPagination(
                                  alignment: Alignment.bottomCenter,
                                  builder: DotSwiperPaginationBuilder(
                                      color: Colors.white,
                                      activeColor: Colors.deepOrange)),
                              controller: SwiperController(),
                            )),
                        Row(
                          children: [
                            const Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:  Text(
                                "Latest Products",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AppBarIcons(function: (){
                                Navigator.push(context, PageTransition(child: FeedsScreen(), type: PageTransitionType.fade));
                              }, icon: IconlyBold.arrowRight2),
                            )
                          ],
                        ),
                         GridView.builder
                           (
                            shrinkWrap: true,
                            physics:const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0.0,
                                mainAxisSpacing: 0.0,
                                childAspectRatio: 0.6),
                            itemBuilder: (context, index) {
                              return FeedWidget(
                                  title: productControllar.productListdata.value[index].title.toString(),
                                  price: productControllar.productListdata.value[index].price!.toInt(),
                                  image:productControllar.productListdata.value[index].images![0].toString()
                              );;
                            })
                      ],
                    ),
                  ),
                )




              ],
            ),
          ));
  }
}
