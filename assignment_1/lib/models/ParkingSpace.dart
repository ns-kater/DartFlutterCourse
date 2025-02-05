class ParkingSpace {
  String id;
  String adress;
  double prisPerTimme;

  ParkingSpace({
    required this.id,
    required this.adress,
    required this.prisPerTimme,
  });

  @override
  String toString() =>
      'ParkingSpace(id: $id, adress: $adress, prisPerTimme: $prisPerTimme)';
}
