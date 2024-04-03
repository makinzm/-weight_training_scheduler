// import '../entity/counter.dart';

abstract class CounterRepository {
  Future<int> getCounter();
  Future<void> incrementCounter();
  Future<void> decrementCounter();
}