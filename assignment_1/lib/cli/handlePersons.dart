import 'dart:io';
import '../repositories/PersonRepository.dart';
import '../models/person.dart';

void handlePersons(PersonRepository repo) {
  while (true) {
    print('Du har valt att hantera Personer.');
    print('1. Skapa ny person');
    print('2. Visa alla personer');
    print('3. Uppdatera person');
    print('4. Ta bort person');
    print('5. Gå tillbaka till huvudmenyn');
    stdout.write('Välj ett alternativ (1-5): ');

    var choice = stdin.readLineSync()?.trim();

    switch (choice) {
      case '1':
        print('Ange namn:');
        var namn = stdin.readLineSync()?.trim() ?? '';
        print('Ange personnummer:');
        var personnummer = stdin.readLineSync()?.trim() ?? '';
        repo.add(Person(namn: namn, personnummer: personnummer));
        print('Person skapad!');
        break;
      case '2':
        for (var person in repo.getAll()) {
          print(person);
        }
        break;
      case '3':
        print('Ange ID för personen som ska uppdateras:');
        var id = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 0;
        if (id >= 0 && id < repo.getAll().length) {
          print('Ange nytt namn:');
          var namn = stdin.readLineSync()?.trim() ?? '';
          print('Ange nytt personnummer:');
          var personnummer = stdin.readLineSync()?.trim() ?? '';
          repo.update(Person(namn: namn, personnummer: personnummer), id);
          print('Person uppdaterad!');
        } else {
          print('Ogiltigt ID.');
        }
        break;
      case '4':
        print('Ange ID för personen som ska tas bort:');
        var id = int.tryParse(stdin.readLineSync()?.trim() ?? '') ?? 0;
        if (id >= 0 && id < repo.getAll().length) {
          repo.delete(id);
          print('Person borttagen!');
        } else {
          print('Ogiltigt ID.');
        }
        break;
      case '5':
        return;
      default:
        print('Ogiltigt val. Försök igen.');
    }
  }
}
