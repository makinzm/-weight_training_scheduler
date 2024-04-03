import '../entity/counter.dart';
import '../repository/counter.dart';

class GetCounterUseCase {
  final CounterRepository repository;

  GetCounterUseCase(this.repository);

  Future<Counter> call() async {
    return await repository.getCounter();
  }
}
