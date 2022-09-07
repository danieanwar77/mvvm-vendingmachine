import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:vendingmachine/model/snacks_model.dart';
import 'package:vendingmachine/view_model/vending_machine_viewmodel.dart';

class VendingMachineView extends StatelessWidget {
  const VendingMachineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VendingMachineViewModel>.reactive(
      viewModelBuilder: () => VendingMachineViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            viewModel.updateChange();
          },
          child: const Icon(
            Icons.calculate,
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                    borderRadius: BorderRadius.circular(15)),
                                child: ElevatedButton(
                                    onPressed: () {
                                      viewModel.jumlahUang += 5000;
                                      viewModel.uangController.text =
                                          viewModel.jumlahUang.toString();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: Text(
                                        '5.000',
                                      ),
                                    )),
                              ),
                              Spacer(),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                    borderRadius: BorderRadius.circular(15)),
                                child: ElevatedButton(
                                    onPressed: () {
                                      viewModel.jumlahUang += 10000;
                                      viewModel.uangController.text =
                                          viewModel.jumlahUang.toString();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: Text(
                                        '10.000',
                                      ),
                                    )),
                              ),
                              Spacer(),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                    borderRadius: BorderRadius.circular(15)),
                                child: ElevatedButton(
                                    onPressed: () {
                                      viewModel.jumlahUang += 50000;
                                      viewModel.uangController.text =
                                          viewModel.jumlahUang.toString();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: Text(
                                        '50.000',
                                      ),
                                    )),
                              ),
                              Spacer(),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                    borderRadius: BorderRadius.circular(15)),
                                child: ElevatedButton(
                                    onPressed: () {
                                      viewModel.jumlahUang += 100000;
                                      viewModel.uangController.text =
                                          viewModel.jumlahUang.toString();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: Text(
                                        '100.000',
                                      ),
                                    )),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  viewModel.jumlahUang = 0;
                                  viewModel.uangController.text =
                                      viewModel.jumlahUang.toString();
                                },
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 1),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.blue[600]),
                                  child: const Icon(
                                    Icons.restart_alt,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextField(
                            enabled: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Jumlah Uang',
                            ),
                            controller: viewModel.uangController,
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                      children: viewModel.listSnacks
                          .map((model) => card(viewModel, model))
                          .toList())
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget card(VendingMachineViewModel viewModel, SnacksModel model) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              // ignore: use_full_hex_values_for_flutter_colors
              color: Color.fromARGB(255, 189, 189, 189),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                model.getImageUrl,
                width: 100,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Text(model.getNamaBarang),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Text(model.getHargaBarang.toString()),
                ),
              ],
            ),
            const Spacer(),
            Row(children: [
              GestureDetector(
                onTap: () {
                  if (model.getQtyBarang > 0) {
                    model.setQtyBarang = model.getQtyBarang - 1;
                    model.textController.text = model.getQtyBarang.toString();
                  }
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue[900]),
                  child: const Icon(
                    Icons.remove,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  width: 46,
                  child: TextField(
                    enabled: false,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: model.getTextController,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  model.setQtyBarang = model.getQtyBarang + 1;
                  model.textController.text = model.getQtyBarang.toString();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue[900]),
                  child: const Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
