import 'dart:io';

import 'package:flutter/material.dart';

class ImageModel extends ChangeNotifier {
  File? image;
  ImageModel({required this.image});

  void getImage(File image) {
    this.image = image;
    notifyListeners();
  }

  void setImage(File? image) {
    this.image = image;
    notifyListeners();
  }

  void removeImage() {
    image = null;
    notifyListeners();
  }
}

class FormTextModel extends ChangeNotifier {
  String? title;
  String? content;
  String? region;
  String? category;
  FormTextModel(
      {required this.title,
      required this.content,
      required this.region,
      required this.category});

  void getForm(String title, String content, String region, String category) {
    this.title = title;
    this.content = content;
    this.region = region;
    this.category = category;
    notifyListeners();
  }

  void setTitle(String title) {
    this.title = title;
    notifyListeners();
  }

  void setContent(String content) {
    this.content = content;
    notifyListeners();
  }

  void setRegion(String region) {
    this.region = region;
    notifyListeners();
  }

  void setCategory(String category) {
    this.category = category;
    notifyListeners();
  }

  void removeForm() {
    title = null;
    content = null;
    notifyListeners();
  }
}
