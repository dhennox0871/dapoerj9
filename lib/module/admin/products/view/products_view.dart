import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bakery/core.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  Widget build(context, ProductsController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("products")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return const Text("Error");
                    if (snapshot.data == null) return Container();
                    if (snapshot.data!.docs.isEmpty) {
                      return const Text("No Data");
                    }
                    final data = snapshot.data!;
                    return ListView.builder(
                      itemCount: data.docs.length,
                      padding: EdgeInsets.zero,
                      clipBehavior: Clip.none,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> item =
                            (data.docs[index].data() as Map<String, dynamic>);
                        item["id"] = data.docs[index].id;
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Get.to(FormproductView(
                                item: item,
                              ));
                            },
                            leading: Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(item['photo']),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    10.0,
                                  ),
                                ),
                              ),
                            ),
                            title: Text(item['itemtitle']),
                            subtitle: Text(NumberFormat(
                              'IDR #,###.##',
                              'id',
                            ).format(item['salesprice'])),
                            trailing: IconButton(
                              onPressed: () {
                                Get.to(FormproductView(
                                  item: item,
                                ));
                              },
                              icon: const Icon(
                                Icons.chevron_right,
                                size: 24.0,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.to(const FormproductView()),
      ),
    );
  }

  @override
  State<ProductsView> createState() => ProductsController();
}
