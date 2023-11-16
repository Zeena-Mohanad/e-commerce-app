import 'package:e_commerce_app/base_url.dart';

class Category {
  String? id;
  String? name;
  String? image;
  String? category;
  String? description;

  Category({this.id, this.name, this.image, this.category, this.description});

  Category.fromJson(Map<String, dynamic> json) {
    final imageUrl = '$baseUrl/${json['image']}';
    id = json['_id'];
    name = json['name'];
    image = imageUrl;
    category = json['Category'];
    description = json['description'];
  }

  static List<Category> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => Category.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['category'] = category;
    data['description'] = description;
    return data;
  }
}
