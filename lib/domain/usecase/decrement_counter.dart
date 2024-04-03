import '../repository/counter.dart';

class IncrementCounterUseCase {
  final CounterRepository repository;

  IncrementCounterUseCase(this.repository);

  Future<void> call() async {
    await repository.incrementCounter();
  }
}
