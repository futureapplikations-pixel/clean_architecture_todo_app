import 'package:faker/faker.dart';

import '../repository/mementos.dart';

class CreateRandomMementos {
  final MementosRepository _repository;

  CreateRandomMementos(this._repository);

  Future<void> call(int count) async {
    for (var i = 0; i < count; i++) {
      await _repository.createMemento(
        name: faker.person.name(),
        email: faker.internet.email(),
        phone: faker.phoneNumber.us(),
        company: faker.company.name(),
        jobTitle: faker.job.title(),
        context: faker.lorem.sentence(),
        birthday: faker.date.dateTime(minYear: 1950, maxYear: 2000),
      );
    }
  }
}
