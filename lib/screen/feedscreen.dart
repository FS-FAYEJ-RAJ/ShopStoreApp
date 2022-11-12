import 'package:flutter/material.dart';
import 'package:storeapprestapi/controllar/productcontrollar.dart';
import 'package:storeapprestapi/widget/feeds_widget.dart';
import 'package:get/get.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  ProductControllar productControllar=Get.put(ProductControllar());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:const Text("All Products",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),),
      ),
      body: Obx((){
        if(productControllar.loder.value){
          return  Center(child: CircularProgressIndicator(color: Colors.blue,),);
        }else{
          return SingleChildScrollView(
            child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: productControllar.productListdata.value.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 0.6),
                itemBuilder: (context, index) {
                  print("Length___${productControllar.productListdata.value.length}");
                  return  FeedWidget(
                      title: productControllar.productListdata.value[index].title.toString(),
                      price: productControllar.productListdata.value[index].price!.toInt(),
                      image:productControllar.productListdata.value[index].images![0].toString(),
                  );
                }),
          );

      }
      }),
    );
  }
}
