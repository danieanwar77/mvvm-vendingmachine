import 'package:flutter/material.dart';
import 'package:vendingmachine/component/snackbar_global.dart';
import 'package:vendingmachine/model/snacks_model.dart';

class VendingMachineViewModel extends ChangeNotifier {
  late TextEditingController uangController;
  late TextEditingController wafersController;
  late TextEditingController chipsController;
  late TextEditingController chocolatesController;

  List<SnacksModel> listSnacks = [];
  int jumlahUang = 0;

  void initialise() {
    uangController = TextEditingController();
    wafersController = TextEditingController();
    chipsController = TextEditingController();
    chocolatesController = TextEditingController();

    uangController.text = '0';

    listSnacks = [
      SnacksModel(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRIZfzcFxH0G5b4VyHwc4e-REp_EWE04BXpQ&usqp=CAU',
          namaBarang: 'Wafers',
          hargaBarang: 7000,
          qtyBarang: 0,
          textController: wafersController),
      SnacksModel(
          imageUrl:
              'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2020/10/21/264a3069-72da-4050-9937-c20667b9b59b.jpg',
          namaBarang: 'Chips',
          hargaBarang: 8000,
          qtyBarang: 0,
          textController: chipsController),
      SnacksModel(
          imageUrl:
              'https://image1ws.indotrading.com/s3/productimages/webp/co37129/p804984/w425-h425/04fb39fb-4bf2-443d-8e09-b7b349ae33fe.jpg',
          namaBarang: 'Chocolate Bars',
          hargaBarang: 12000,
          qtyBarang: 0,
          textController: chocolatesController),
    ];
    notifyListeners();
  }

  void updateChange() {
    int bayar = 0;
    int jumlah = 0;
    var listHarga = listSnacks
        .map((model) => model.getHargaBarang * model.getQtyBarang)
        .toList();
    for (var e in listHarga) {
      jumlah += e;
    }

    bayar = int.parse(uangController.text) - jumlah;

    if (bayar < 0) {
      final SnackBar snackBar = SnackBar(content: Text("Uangnya Kurang! :("));
      snackbarKey.currentState?.showSnackBar(snackBar);
    } else {
      final SnackBar snackBar = SnackBar(content: Text("Kembaliannya: $bayar"));
      snackbarKey.currentState?.showSnackBar(snackBar);
    }

    // print(jumlahUang);

    notifyListeners();
  }
}
