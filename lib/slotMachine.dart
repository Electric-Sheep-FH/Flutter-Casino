import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class SlotMachine extends StatefulWidget {
  const SlotMachine({super.key});

  @override
  State<SlotMachine> createState() => _SlotMachineState(); 
  
}

class _SlotMachineState extends State<SlotMachine> {

  Map<int, String> imageDico = { 0 : 'images/bar.png', 1 : 'images/cerise.png', 2 : 'images/cloche.png', 3 : 'images/diamant.png', 4 : 'images/fer-a-cheval.png', 5 : 'images/pasteque.png', 6 : 'images/sept.png'};

  late int _randomValue1 = 1;
  late int _randomValue2 = 2;
  late int _randomValue3 = 3;
  String _resultText = '';
  Color _scaffoldBackground = Colors.white;
  FontWeight _fontWeight = FontWeight.w400;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text('Casino'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: launchSlotMachine,
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.casino),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width/3.5,
                height: 200,
                color: Colors.blue,
                child: Image(image: AssetImage('${imageDico[_randomValue1]}'),),
              ),
              Container(
                width: MediaQuery.of(context).size.width/3.5,
                height: 200,
                color: Colors.blue,
                child: Image(image: AssetImage('${imageDico[_randomValue2]}'),),
              ),
              Container(
                width: MediaQuery.of(context).size.width/3.5,
                height: 200,
                color: Colors.blue,
                child: Image(image: AssetImage('${imageDico[_randomValue3]}'),),
              ),
            ],
          ),
          Text(_resultText,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 40,
                fontWeight: _fontWeight,
              )
            ),
          ),
        ]
      ),
    );
  }

  int returnRandomNumber(int maxValue) {
    int toReturn = 0;

    toReturn = Random().nextInt(maxValue);

    return toReturn;
  }

  bool isSuperJackpot(int value1, int value2, int value3) {
    if (value1 == value2 && value1 == value3 && value1 == 6) {
      return true;
    } else {
      return false;
    }
  }
  bool isJackpot(int value1, int value2, int value3) {
    if (value1 == value2 && value1 == value3) {
      return true;
    } else {
      return false;
    }
  }

  void launchSlotMachine() {
    setState(() {
      _randomValue1 = returnRandomNumber(7);
      _randomValue2 = returnRandomNumber(7);
      _randomValue3 = returnRandomNumber(7);

      if(isSuperJackpot(_randomValue1, _randomValue2, _randomValue3)) {
        _resultText = 'SUPER JACKPOT !!!';
        _scaffoldBackground = Colors.green;
        _fontWeight = FontWeight.w800;
      } else if (isJackpot(_randomValue1, _randomValue2, _randomValue3)) {
        _resultText = 'JACKPOT !';
        _scaffoldBackground = Colors.green;
        _fontWeight = FontWeight.w700;
      } else {
        _resultText = 'You loose... Try again !';
        _scaffoldBackground = Colors.white;
        _fontWeight = FontWeight.w400;
      }
    });
  }
}