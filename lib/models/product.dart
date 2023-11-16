import 'package:e_commerce_app/base_url.dart';
import 'package:e_commerce_app/models/category.dart';

class Product {
  String? id;
  String? name;
  String? image;
  Category? department;
  String? description;
  String? price;
  int? quantity;
  bool? available;

  Product({
    this.id,
    this.name,
    this.image,
    this.department,
    this.description,
    this.price,
    this.quantity,
    this.available,
  });

  Product.fromJson(Map<String, dynamic> json) {
    final imageUrl = '$baseUrl/${json['image']}';
    id = json['_id'];
    name = json['name'];
    image = imageUrl;
    if (json['departmentID'] != null) {
      department = Category.fromJson(json['departmentID']);
    } else {
      department = null;
    }
    description = json['description'];
    price = json['price'].toString();
    quantity = json['quantity'];
    available = json['Available'] == 1;
  }

  static List<Product> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => Product.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['price'] = price;
    data['quantity'] = quantity;
    data['Available'] = available;
    return data;
  }
}
