class TouristData {
  int numberOfTourist;
  String name;
  String surname;
  String birthDate;
  String citizenship;
  String passportNumber;
  String theValidityPeriodOfThePassport;

  TouristData(
    this.name,
    this.surname,
    this.birthDate,
    this.citizenship,
    this.passportNumber,
    this.theValidityPeriodOfThePassport,
      {required this.numberOfTourist,
  });
}