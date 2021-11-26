// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class Log extends StatelessWidget {
  Log({Key? key}) : super(key: key);

  final List<Widget> log = [];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: log,
    );
  }

  void addToLogAdd(valor) {
    log.add(LogItem(valor: valor, adiciona: true));
  }

  void addToLogRemove(valor) {
    log.add(LogItem(valor: valor, adiciona: false));
  }
}

class LogItem extends StatelessWidget {
  final double valor;
  final bool adiciona;
  const LogItem({Key? key, required this.valor, required this.adiciona})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        valor.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      leading: adiciona ? const Icon(Icons.add) : const Icon(Icons.remove),
    );
  }
}
