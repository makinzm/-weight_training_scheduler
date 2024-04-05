import 'package:flutter/material.dart';
import 'package:weight_training_scheduler/domain/repository/counter.dart';
import 'package:weight_training_scheduler/domain/usecase/decrement_counter.dart';
import 'package:weight_training_scheduler/domain/usecase/get_counter.dart';
import 'package:weight_training_scheduler/domain/usecase/increment_counter.dart';
import 'package:weight_training_scheduler/infrastructure/repository/counter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CounterRepository counter;
  late int _counter;

  @override
  void initState() {
    super.initState();
    counter = CounterRepositoryImpl();
    _loadCounter();
  }

  void _loadCounter() {
    final getCounterUseCase = GetCounterUseCase(counter);
    getCounterUseCase().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      final incrementCounterUseCase = IncrementCounterUseCase(counter);
      incrementCounterUseCase();
      _loadCounter();
    });
  }

  void _decrementCounter() {
    setState(() {
      final func = DecrementCounterUseCase(counter);
      func();
      _loadCounter();
    });
  }

  static const incrementButtonX = -0.9;
  static const incrementButtonY = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: const Alignment(incrementButtonX, incrementButtonY),
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: const Text(
                  '-',
                  style: TextStyle(height: 40, fontSize: 40),
                ),
              )
          )
        ],
      ),
    );    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
