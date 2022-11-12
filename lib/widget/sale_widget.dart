import 'package:flutter/material.dart';
class SaleWidget extends StatelessWidget {
  const SaleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
              colors: [
                Color(0xFF7A60A5),
                Color(0xFF82C3DF),
              ],
              end: FractionalOffset(0.0, 0.0),
              begin: FractionalOffset(1.0, 0.0),
              tileMode: TileMode.clamp,
              stops: [0.0, 1.0])),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(0xFF9689CE),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Get the special discount",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height:15,
                      ),
                      Flexible(
                          child: SizedBox(
                            width: double.infinity,
                            child: FittedBox(
                                fit: BoxFit.fill,
                                child: Text("50 %\nOFF",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Image.network(
                  "https://i.ibb.co/vwB46Yq/shoes.png",
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ))
        ],
      ),
    );
  }
}
