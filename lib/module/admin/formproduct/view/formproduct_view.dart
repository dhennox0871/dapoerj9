import 'package:flutter/material.dart';
import 'package:bakery/core.dart';

class FormproductView extends StatefulWidget {
  final Map? item;
  const FormproductView({Key? key, this.item}) : super(key: key);

  Widget build(context, FormproductController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Input Product"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      QImagePicker(
                        label: "Image Product",
                        hint: "Your image",
                        validator: Validator.required,
                        value: controller.photo,
                        onChanged: (value) {
                          controller.photo = value;
                        },
                      ),
                      QTextField(
                        label: "Kode Barang",
                        hint: "ItemCode",
                        validator: Validator.required,
                        value: controller.itemcode,
                        onChanged: (value) {
                          controller.itemcode = value;
                        },
                      ),
                      QTextField(
                        label: "Nama Barang",
                        hint: "Product Name",
                        validator: Validator.required,
                        value: controller.itemtitle,
                        onChanged: (value) {
                          controller.itemtitle = value;
                        },
                      ),
                      QMemoField(
                        label: "Description",
                        hint: "description",
                        value: controller.description,
                        onChanged: (value) {
                          controller.description = value;
                        },
                      ),
                      QNumberField(
                        label: "Price",
                        hint: "Sales Price (+PPN)",
                        validator: Validator.required,
                        value: controller.salesprice.toString(),
                        pattern: "#,###,###.##",
                        locale: "en_US",
                        onChanged: (value) {
                          print("Product price: $value");
                          controller.salesprice = double.tryParse(value) ?? 0;
                        },
                      ),
                      QDropdownField(
                        label: "Category",
                        hint: "Item Group",
                        value: controller.itemcategory,
                        validator: Validator.required,
                        items: const [
                          {
                            "label": "Cake",
                            "value": "Cake",
                          },
                          {
                            "label": "Beverage",
                            "value": "Beverage",
                          }
                        ],
                        onChanged: (value, label) {
                          controller.itemcategory = value;
                        },
                      ),
                      Container(
                        height: 72,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(12.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                          ),
                          onPressed: () => controller.doSave(),
                          child: const Text("Save"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<FormproductView> createState() => FormproductController();
}
