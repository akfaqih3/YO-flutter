class RegisterModel {
  final String email;
  final String name;
  final String gender;
  final String longitude;
  final String latitude;

  RegisterModel({
    required this.email,
    required this.name,
    required this.gender,
    required this.longitude,
    required this.latitude,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json["email"],
      name: json["name"],
      gender: json["gender"],
      longitude: json["longitude"],
      latitude: json["latitude"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
      "gender": gender,
      "longitude": longitude,
      "latitude": latitude,
    };
  }
}
