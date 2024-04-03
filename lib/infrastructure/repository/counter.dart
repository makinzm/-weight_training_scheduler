import '../../domain/entity/counter.dart';
import '../../domain/repository/counter.dart';

class CounterRepositoryImpl implements CounterRepository {
  int _counter = 500;

  @override
  Future<void> decrementCounter() async {
    _counter--;
  }

  @override
  Future<int> getCounter() async {
    return Future.value(Counter(_counter).count);
  }

  @override
  Future<void> incrementCounter() async {
    _counter++;
  }

}