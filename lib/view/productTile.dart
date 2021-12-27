import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_calling/controller/productcontroller.dart';
import 'package:getx_api_calling/webview/webview.dart';
// import 'package:getx_api_calling/model/product.dart';

class ProductTile extends StatefulWidget {
  final int imgurlindex;
  const ProductTile(this.imgurlindex);

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  //final ProductController productController = Get.put(ProductController());
  // Controller controller = Get.find();
  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(productController.productList[widget.imgurlindex].title
                .toString())),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300,
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          Colors.black, //                   <--- border color
                      width: 5.0,
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(productController
                          .productList[widget.imgurlindex].imageUrl
                          .toString()),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Text(
                    productController.productList[widget.imgurlindex].synopsis
                        .toString(),
                    // "${widget.results.synopsis}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyWeb(productController
                              .productList[widget.imgurlindex].url
                              .toString());
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: Text(
                      "1:-${productController.productList[widget.imgurlindex].url.toString()}}",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyWeb(productController
                              .productList[widget.imgurlindex].imageUrl
                              .toString());
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: Text(
                      "2:-${productController.productList[widget.imgurlindex].imageUrl.toString()}}",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
