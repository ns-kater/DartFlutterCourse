import '../models/Person.dart';
import 'repository.dart';

class PersonRepository extends Repository<Person> {
  final List<Person> _persons = [];
  static final PersonRepository _instance = PersonRepository._internal();

  factory PersonRepository() {
    return _instance;
  }

  PersonRepository._internal();

  @override
  void add(Person item) {
    if (item.isValid()) {
      _persons.add(item);
    } else {
      throw Exception('Invalid person data. Please Check you data it should not be null and personnummer should be exactly 10 digits');
    }
  }

  @override
  List<Person> getAll() {
    return _persons;
  }

  @override
  Person getById(int personnummer) {
    return _persons.firstWhere((p) => p.personnummer == personnummer.toString(),
        orElse: () => throw Exception('Person not found.'));
  }

  @override
  void update(Person updatedPerson, int index) {
    if (updatedPerson.isValid()) {
      _persons[index] = updatedPerson;
    } else {
      throw Exception('Invalid person data.');
    }
  }

  @override
  void delete(int personnummer) {
    _persons.removeWhere((p) => p.personnummer == personnummer.toString());
  }

  List<Person> searchByName(String namn) {
    return _persons.where((p) => p.namn.contains(namn)).toList();
  }
}