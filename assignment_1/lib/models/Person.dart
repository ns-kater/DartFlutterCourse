class Person {
  String namn;
  String personnummer;

  Person({required this.namn, required this.personnummer});

  @override
  String toString() => 'Person(namn: $namn, personnummer: $personnummer)';
}