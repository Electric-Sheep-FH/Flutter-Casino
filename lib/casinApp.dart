import 'package:casino/slotMachine.dart';
import 'package:flutter/material.dart';


class CasinApp extends StatelessWidget {
  const CasinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SlotMachine()
    );
  }
}