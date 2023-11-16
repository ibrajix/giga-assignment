class Address {
  String? country;
  String? prefecture;
  String? municipality;
  String? streetAddress;
  String? apartment;

  Address({this.country, this.prefecture, this.municipality, this.streetAddress, this.apartment});

  @override
  String toString() {
    return '{country: $country, prefecture: $prefecture, municipality: $municipality, streetAddress: $streetAddress, apartment: $apartment}';
  }

}