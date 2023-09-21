class Dto {
  final List<dynamic> tmax;

  Dto({required this.tmax});

  factory Dto.fromJson(Map<String, dynamic> json) {
    return Dto(tmax: json["temperature_2m_max"]);
  }
}
