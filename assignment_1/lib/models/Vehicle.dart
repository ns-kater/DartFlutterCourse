import 'Person.dart';

class Vehicle extends Person {
  String registreringsnummer;
  String typ;
  Person owner;

  Vehicle({
    required this.registreringsnummer,
    required this.typ,
    required this.owner,
  }) : super(namn: owner.namn, personnummer: owner.personnummer); // Pass required parameters to super constructor

  @override
  String toString() =>
      'Vehicle(registreringsnummer: $registreringsnummer, typ: $typ, owner: ${owner.namn})';
}