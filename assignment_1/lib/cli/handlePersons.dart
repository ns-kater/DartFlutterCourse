import 'dart:io';
import '../repositories/PersonRepository.dart';
import '../models/Person.dart';

void handlePersons(PersonRepository repo) {
  bool running = true;
  while (running) {
    print('Du har valt att hantera Personer.');
    print('1. Skapa ny person');
    print('2. Visa alla personer');
    print('3. Sök efter person');
    print('4. Uppdatera person');
    print('5. Ta bort person');
    print('6. Gå tillbaka till huvudmenyn');
    stdout.write('Välj ett alternativ (1-6): ');
    String? choice = stdin.readLineSync();

    try {
      switch (choice) {
        case '1':
          stdout.write('Namn: ');
          String? name = stdin.readLineSync();
          stdout.write('Personnummer: ');
          String? personnummer = stdin.readLineSync();
          if (name != null && personnummer != null) {
            repo.add(Person(namn: name, personnummer: personnummer));
            print('Person skapad.');
          }
          break;
        case '2':
          for (var person in repo.getAll()) {
            print(person);
          }
          break;
        case '3':
          stdout.write('Sök namn: ');
          String? name = stdin.readLineSync();
          if (name != null) {
            var results = repo.searchByName(name);
            if (results.isEmpty) {
              print('Inga resultat hittades.');
            } else {
              for (var person in results) {
                print(person);
              }
            }
          }
          break;
        case '4':
          stdout.write('Personnummer att uppdatera: ');
          String? personnummer = stdin.readLineSync();
          if (personnummer != null) {
            try {
              Person person = repo.getById(int.parse(personnummer));
              stdout.write('Nytt namn: ');
              String? newName = stdin.readLineSync();
              if (newName != null) {
                person = Person(namn: newName, personnummer: personnummer);
                repo.update(person, person as int);
                print('Person uppdaterad.');
              }
            } catch (e) {
              print('Person hittades inte.');
            }
          }
          break;
        case '5':
          stdout.write('Personnummer att ta bort: ');
          String? personnummer = stdin.readLineSync();
          if (personnummer != null) {
            repo.delete(int.parse(personnummer));
            print('Person borttagen.');
          }
          break;
        case '6':
          running = false;
          break;
        default:
          print('Ogiltigt val.');
      }
    } catch (e) {
      print('Ett fel inträffade: $e');
    }
  }
}
