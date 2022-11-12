
import 'dart:convert';
import 'package:storeapprestapi/models/allproductsmodel.dart';
import 'package:http/http.dart';
import 'package:get/get.dart';
import 'package:storeapprestapi/models/catagoricmodel.dart';

import '../models/allusermodel.dart';

class ApiServices{
  String producApiEnd="https://api.escuelajs.co/api/v1/products";
  String catagoricApiEnd="https://api.escuelajs.co/api/v1/categories";
  String alluseApiEnd="https://api.escuelajs.co/api/v1/users";

  Future<List<AllProductsModel>?> getProductce() async{

    var response=await get(Uri.parse(producApiEnd));

    if(response.statusCode==200){


      return allProductsModelFromJson(response.body);

      }
    else{
      throw Exception(response.reasonPhrase);
    }
    // var data= jsonDecode(response.body);

    // for(var v in data)
    //   {
    //     productList.add(v);
    //     print('.... ${productList}');
    //   }


  }

  Future<List<CatagoricModel>?> getCatagoric()async{

    var responce= await get(Uri.parse(catagoricApiEnd));

    if(responce.statusCode==200)
    {
      print("response__${responce.body}");
      return catagoricModelFromJson(responce.body);
    }
    else
      {
        throw Exception(responce.reasonPhrase);
      }

  }

  Future<List<AllUserModel>?> getAllUser() async{

    var responce= await get(Uri.parse(alluseApiEnd));

    if(responce.statusCode==200)
      {


        return await allUserModelFromJson(responce.body);

      }
    else{
      throw Exception(responce.reasonPhrase);
    }



  }



}
