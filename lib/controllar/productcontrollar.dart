
import 'package:get/get.dart';
import 'package:storeapprestapi/servis/api_services.dart';

import '../models/allproductsmodel.dart';
import '../models/allusermodel.dart';
import '../models/catagoricmodel.dart';

class ProductControllar extends GetxController{

  RxBool loder= false.obs;

  var productListdata=RxList<AllProductsModel>().obs;
  var catagoriclist= RxList<CatagoricModel?>().obs;
  var alluserlist=RxList<AllUserModel?>().obs;

  final ApiServices apiServices=ApiServices();

  @override
  void onInit() {
    getProductControllar();
    getCatagoricControllar();
    getAllUserControllar();
    super.onInit();
  }

   void getProductControllar()async{
    loder.value=true;

     var networkdata=await apiServices.getProductce();

     if(networkdata !=null)

       {
         print("Data__${networkdata
         }");
         productListdata.value.addAll(networkdata);
         loder.value=false;
          // productListdata.value=await networkdata;
       }

   }

   void getCatagoricControllar() async{

    var networkcatagori= await apiServices.getCatagoric();

    if(networkcatagori!=null){

      catagoriclist.value.addAll(networkcatagori);
    }


   }

   void getAllUserControllar() async {
    loder.value =true;
    var networkuser= await apiServices.getAllUser();

    if(networkuser !=null){

      print("Data__${networkuser}");

      alluserlist.value.addAll(networkuser);

      loder.value=false;
    }


   }
}