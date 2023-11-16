import 'package:e_commerce_app/base_url.dart';

class ProductArrayImage {
  String? id;
  List<ImageClass>? image;
  String? productID;

  ProductArrayImage({this.id, this.image, this.productID});

  ProductArrayImage.fromJson(Map<String, dynamic> json) {
    if (json['image'] != null) {
      image = <ImageClass>[];
      json['image'].forEach((v) {
        image!.add(ImageClass.fromJson(v));
      });
    }
    productID = json['productID'];
  }

  static List<ProductArrayImage> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductArrayImage.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    if (image != null) {
      data['image'] = image!.map((v) => v.toJson()).toList();
    }
    data['productID'] = productID;
    return data;
  }
}

class ImageClass {
  String? filename;

  ImageClass({this.filename});

  ImageClass.fromJson(Map<String, dynamic> json) {
    final imageUrl = '$baseUrl/${json['filename']}';
    filename = imageUrl;
  }

  static List<ImageClass> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => ImageClass.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['filename'] = filename;
    return data;
  }
}
