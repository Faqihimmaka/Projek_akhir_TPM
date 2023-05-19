import 'dart:async';

import 'package:flutter/material.dart';

class TimeConversion extends StatefulWidget {
  const TimeConversion({Key? key}) : super(key: key);

  @override
  _TimeConversionState createState() => _TimeConversionState();
}

class _TimeConversionState extends State<TimeConversion> {
  late String inputTime = 'WIB';
  late String outputTime = 'WIB';
  DateTime resultTime = DateTime.now();
  Timer Timetimer = Timer.periodic(const Duration(seconds: 1), (timer) {});

  @override
  void initState() {
    super.initState();
    inputTime = 'WIB';
    outputTime = 'WIB';
    resultTime = DateTime.now();
    Timetimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resultTime = DateTime.now();
      });
    });
  }

  void _onInputChanged(String? value) {
    setState(() {
      inputTime = value ?? 'WIB';
    });
  }

  void _onOutputChanged(String? value) {
    setState(() {
      outputTime = value ?? 'WIB';
    });
  }

  void _convert() {
    setState(() {
      switch (inputTime) {
        case 'WIB':
          switch (outputTime) {
            case 'WIB':
              resultTime = DateTime.now();
              break;
            case 'WITA':
              resultTime = DateTime.now().add(const Duration(hours: 1));
              break;
            case 'WIT':
              resultTime = DateTime.now().add(const Duration(hours: 2));
              break;
            case 'UTC':
              resultTime = DateTime.now().subtract(const Duration(hours: 7));
              break;
          }
          break;
        case 'WITA':
          switch (outputTime) {
            case 'WIB':
              resultTime = DateTime.now().subtract(const Duration(hours: 1));
              break;
            case 'WITA':
              resultTime = DateTime.now();
              break;
            case 'WIT':
              resultTime = DateTime.now().add(const Duration(hours: 1));
              break;
            case 'UTC':
              resultTime = DateTime.now().subtract(const Duration(hours: 8));
              break;
          }
          break;
        case 'WIT':
          switch (outputTime) {
            case 'WIB':
              resultTime = DateTime.now().subtract(const Duration(hours: 2));
              break;
            case 'WITA':
              resultTime = DateTime.now().subtract(const Duration(hours: 1));
              break;
            case 'WIT':
              resultTime = DateTime.now();
              break;
            case 'UTC':
              resultTime = DateTime.now().subtract(const Duration(hours: 9));
              break;
          }
          break;
      }
    });
  }

  @override
  void dispose() {
    Timetimer.cancel();
    super.dispose();
  }

  Widget _buildInput() {
    return DropdownButtonFormField<String>(
      value: inputTime,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Input',
      ),
      onChanged: _onInputChanged,
      items: const [
        DropdownMenuItem(
          value: 'WIB',
          child: Text('WIB'),
        ),
        DropdownMenuItem(
          value: 'WITA',
          child: Text('WITA'),
        ),
        DropdownMenuItem(
          value: 'WIT',
          child: Text('WIT'),
        ),
        DropdownMenuItem(
          value: 'UTC',
          child: Text('UTC'),
        ),
      ],
    );
  }

  Widget _buildOutput() {
    return DropdownButtonFormField<String>(
      value: outputTime,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Output',
      ),
      onChanged: _onOutputChanged,
      items: const [
        DropdownMenuItem(
          value: 'WIB',
          child: Text('WIB'),
        ),
        DropdownMenuItem(
          value: 'WITA',
          child: Text('WITA'),
        ),
        DropdownMenuItem(
          value: 'WIT',
          child: Text('WIT'),
        ),
        DropdownMenuItem(
          value: 'UTC',
          child: Text('UTC'),
        ),
      ],
    );
  }

  Widget _buildResult() {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
      initialData: resultTime,
      builder: (context, snapshot) {
        return Text(
          '${resultTime.hour}:${resultTime.minute}:${resultTime.second}',
          style: const TextStyle(fontSize: 30),
        );
      },
    );
  }

  Widget _buildConvertButton() {
    return ElevatedButton(
      onPressed: _convert,
      child: const Text('Convert'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Conversion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildInput(),
            const SizedBox(
              height: 20,
            ),
            _buildOutput(),
            const SizedBox(
              height: 20,
            ),
            _buildConvertButton(),
            const SizedBox(
              height: 20,
            ),
            _buildResult(),
          ],
        ),
      ),
    );
  }
}
