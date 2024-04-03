// import '../entity/counter.dart';
import '../repository/counter.dart';

class GetCounterUseCase {
  final CounterRepository repository;

  GetCounterUseCase(this.repository);

  Future<int> call() async {
    return await repository.getCounter();
  }
}
