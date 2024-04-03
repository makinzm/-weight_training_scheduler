import '../repository/counter.dart';

class DecrementCounterUseCase {
  final CounterRepository repository;

  DecrementCounterUseCase(this.repository);

  Future<void> call() async {
    await repository.incrementCounter();
  }
}
