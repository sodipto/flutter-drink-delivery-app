import 'package:flutter/material.dart';

class Product {
  String name;
  String color;
  String imgfUrl;


  Product(this.name, this.color, this.imgfUrl);

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    color = json['Color'];
    imgfUrl = json['imgfUrl'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['Color'] = this.color;
    data['imgfUrl'] = this.imgfUrl;
    return data;
  }
}