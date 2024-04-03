import '../entity/counter.dart';

abstract class CounterRepository {
  Future<Counter> getCounter();
  Future<void> incrementCounter();
  Future<void> decrementCounter();
}