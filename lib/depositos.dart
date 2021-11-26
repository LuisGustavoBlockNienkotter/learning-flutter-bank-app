import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bank_app/conta.dart';
import 'package:bank_app/log.dart';

// ignore: must_be_immutable
class Depositos extends StatelessWidget {
  final Conta conta;
  final Log log;
  Depositos({Key? key, required this.conta, required this.log})
      : super(key: key);

  final addController = TextEditingController();
  final removeController = TextEditingController();
  double deposito = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        children: [
          Expanded(
              child: TextField(
                  controller: addController,
                  decoration: InputDecoration(
                    label: const Text('Depósito'),
                    labelStyle: const TextStyle(color: Colors.white),
                    hintText: 'Entre o valor para depósito',
                    hintStyle: const TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed: () {
                        onClearInputAdd(addController.text);
                      },
                      icon: const Icon(Icons.send),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white))),
          Expanded(
              child: TextField(
                  controller: removeController,
                  decoration: InputDecoration(
                    label: const Text('Sacar'),
                    labelStyle: const TextStyle(color: Colors.white),
                    hintText: 'Entre o valor para saque',
                    hintStyle: const TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      onPressed: () {
                        onClearInputRemove(removeController.text);
                      },
                      icon: const Icon(Icons.send),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white)))
        ],
      ),
    );
  }

  void onClearInputAdd(text) {
    if (isNumeric(text)) {
      deposito = double.parse(text);

      conta.depositar(deposito);
      log.addToLogAdd(deposito);

      addController.clear();
    }
  }

  void onClearInputRemove(text) {
    if (isNumeric(text)) {
      deposito = double.parse(text);

      conta.sacar(deposito);
      log.addToLogRemove(deposito);

      removeController.clear();
    }
  }

  bool isNumeric(String s) {
    // ignore: deprecated_member_use, unnecessary_null_comparison
    bool value = double.parse(s) != null;

    return value;
  }
}
