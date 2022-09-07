import 'package:flutter/material.dart';

class SnacksModel {
  late String imageUrl;
  late String namaBarang;
  late int hargaBarang;
  late int qtyBarang;
  late TextEditingController textController;

  SnacksModel(
      {required this.imageUrl,
      required this.namaBarang,
      required this.hargaBarang,
      required this.qtyBarang,
      required this.textController});

  String get getImageUrl {
    return imageUrl;
  }

  set setImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
  }

  String get getNamaBarang {
    return namaBarang;
  }

  set setNamaBarang(String namaBarang) {
    this.namaBarang = namaBarang;
  }

  int get getHargaBarang {
    return hargaBarang;
  }

  set setHargaBarang(int hargaBarang) {
    this.hargaBarang = hargaBarang;
  }

  int get getQtyBarang {
    return qtyBarang;
  }

  set setQtyBarang(int qtyBarang) {
    this.qtyBarang = qtyBarang;
  }

  TextEditingController get getTextController {
    return textController;
  }

  set setTextController(TextEditingController textController) {
    this.textController = textController;
  }
}
