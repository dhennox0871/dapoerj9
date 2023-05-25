import 'package:flutter/material.dart';
import 'package:bakery/core.dart';

class ProductsOrderView extends StatefulWidget {
  final Map? item;
  const ProductsOrderView({Key? key, this.item}) : super(key: key);

  Widget build(context, ProductsOrderController controller) {
    controller.view = this;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(controller.photo.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.to(const UserdashboardView()),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_back,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      26.0,
                    ),
                    topRight: Radius.circular(
                      26.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.itemtitle.toString(),
                        style: const TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w600),
                      ),
                      const Divider(),
                      Text(
                        controller.description.toString(),
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      const Divider(),
                      Text(
                        controller.salesprice.toString().toIdr(),
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      QTextField(
                        label: "Note",
                        hint: "Note",
                        validator: Validator.required,
                        value: "-",
                        onChanged: (value) {},
                      ),
                      
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<ProductsOrderView> createState() => ProductsOrderController();
}
