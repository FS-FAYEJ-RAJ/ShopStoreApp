import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storeapprestapi/controllar/productcontrollar.dart';
import '../widget/categoric_widget.dart';
class CetagoricScreen extends StatefulWidget {
  const CetagoricScreen({Key? key}) : super(key: key);

  @override
  State<CetagoricScreen> createState() => _CetagoricScreenState();
}

class _CetagoricScreenState extends State<CetagoricScreen> {
  ProductControllar catagoricControllar=Get.put(ProductControllar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cetagoric Page'),
      ),
      body:   GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: catagoricControllar.catagoriclist.value.length,
          gridDelegate:
         const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 1.2),
          itemBuilder: (context, index) {
            return CatagoricWidget(
              title: catagoricControllar.catagoriclist.value[index]!.name.toString(),
              image: catagoricControllar.catagoriclist.value[index]!.image.toString(),
            );
          }),
    );
  }
}
