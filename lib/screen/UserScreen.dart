import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storeapprestapi/controllar/productcontrollar.dart';
import 'package:storeapprestapi/widget/users_widged.dart';

class UserScreen extends StatefulWidget {
   UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  ProductControllar allusercontrollar=Get.put(ProductControllar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Users',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        body:Obx((){
          if(allusercontrollar.loder.value){
            return Center(child: CircularProgressIndicator(color: Colors.blue,));
          }
          else{
            return  ListView.builder(
                itemCount: allusercontrollar.alluserlist.value.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: UserWidget(
                      name: allusercontrollar.alluserlist.value[index]!.name.toString(),
                      email:allusercontrollar.alluserlist.value[index]!.email.toString(),
                      image: allusercontrollar.alluserlist.value[index]!.avatar.toString(),
                      role: allusercontrollar.alluserlist.value[index]!.role.toString(),
                    ),
                  ) ;
                });
          }

    })
    );
  }
}
