import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_calling/controller/productcontroller.dart';
import 'package:getx_api_calling/view/productTile.dart';
import 'package:http/http.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:
            // Obx(() =>
            GetX<ProductController>(
          init: ProductController(),
          builder: (productController) {
            return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      //                   <--- border color
                      width: 2.0,
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductTile(index),
                        ),
                      );
                    },
                    title: Text(
                        // listsnapshot.data!.results![index].title![index]
                        //     .toString(),
                        productController.productList[index].title.toString()),
                    // listsnapshot.data!.results![index].title!.toString()),
                    subtitle: Text(
                        productController.productList[index].title!.toString()),
                    leading: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            //                   <--- border color
                            width: 5.0,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(productController
                                  .productList[index].imageUrl
                                  .toString()),
                              fit: BoxFit.cover)),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
