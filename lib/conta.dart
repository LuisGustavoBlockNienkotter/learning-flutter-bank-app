import 'package:flutter/material.dart';

class Conta extends StatelessWidget {
  Conta({Key? key}) : super(key: key);

  double totalMoney = 100.5;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            'R\$ ' + totalMoney.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 40),
          ),
        )
      ],
    );
    // return Container(
    //   child: Text(
    //     'R\$ ' + totalMoney.toString(),
    //     style: const TextStyle(color: Colors.white, fontSize: 40),
    //   ),
    // );
  }

  void depositar(double deposito) {
    totalMoney += deposito;
  }

  void sacar(double saque) {
    totalMoney -= saque;
  }
}
