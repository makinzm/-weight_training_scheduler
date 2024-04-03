import '../../domain/entity/counter.dart';
import '../../domain/repository/counter.dart';

class CounterRepositoryImpl implements CounterRepository {
  int _counter = 0;

  @override
  Future<void> decrementCounter() async {
    _counter--;
  }

  @override
  Future<Counter> getCounter() async {
    return Future.value(Counter(_counter));
  }

  @override
  Future<void> incrementCounter() async {
    _counter++;
  }

}