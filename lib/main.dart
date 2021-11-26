import 'package:bank_app/depositos.dart';
import 'package:bank_app/log.dart';
import 'package:bank_app/conta.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  final Conta conta = Conta();
  final Log log = Log();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.account_balance),
                  text: 'Conta',
                ),
                Tab(
                  icon: Icon(Icons.add_box),
                  text: 'Depósitos',
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: 'Log',
                ),
              ],
            ),
            title: const Text('Bank App'),
            backgroundColor: const Color.fromRGBO(130, 10, 209, 1),
          ),
          body: TabBarView(
            children: [
              conta,
              Depositos(
                conta: conta,
                log: log,
              ),
              log
            ],
          ),
          backgroundColor: const Color.fromRGBO(130, 10, 209, 0),
        ),
      ),
    );
  }
}
