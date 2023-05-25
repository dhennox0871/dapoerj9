import 'package:bakery/service/product_service/product_service.dart';

class DummyService {
  List<Map<String, dynamic>> productlist = [
    {
      "id": "B01",
      "photo":
          "https://i.ibb.co/jzXwQCj/photo-1530610476181-d83430b64dcd-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "product_name": "Croissant",
      "price": 15000.0,
      "category": "Cake",
      "description": "Freshly baked croissant with buttery and flaky layers."
    },
    {
      "id": "B02",
      "photo":
          "https://i.ibb.co/8KhhNcs/photo-1509722747041-616f39b57569-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "product_name": "Baguette",
      "price": 20000.0,
      "category": "Cake",
      "description": "Classic French bread with crispy crust and soft inside."
    },
    {
      "id": "B03",
      "photo":
          "https://i.ibb.co/3NVsgNM/photo-1483695028939-5bb13f8648b0-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "product_name": "Pain au chocolat",
      "price": 18000.0,
      "category": "Cake",
      "description": "Flaky pastry with a rich chocolate filling."
    },
    {
      "id": "B04",
      "photo":
          "https://i.ibb.co/42PZtG2/photo-1613396874083-2d5fbe59ae79-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "product_name": "Sourdough",
      "price": 25000.0,
      "category": "Cake",
      "description": "Artisan bread made with natural sourdough starter."
    },
    {
      "id": "B05",
      "photo":
          "https://i.ibb.co/hyxtFVH/photo-1583527976767-5399024eeb05-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
      "product_name": "Cinnamon roll",
      "price": 20000.0,
      "category": "Cake",
      "description":
          "Soft and gooey roll with cinnamon sugar filling and cream cheese frosting."
    },
  ];

  generate() async {
    for (var item in productlist) {
      ProductServie().create(
          photo: item['photo'],
          itemcode: item['id'],
          itemtitle: item['product_name'],
          description: item['description'],
          itemcategory: item['category'],
          salesprice: item['price']);
    }
  }
}
