class Drug {
  String id;
  String name;
  String dosage;

  Drug({
    required this.id,
    required this.name,
    required this.dosage,
  });

  factory Drug.fromJson(Map<String, dynamic> json) => Drug(
        id: json["id"],
        name: json["name"],
        dosage: json["dosage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dosage": dosage,
      };
}
