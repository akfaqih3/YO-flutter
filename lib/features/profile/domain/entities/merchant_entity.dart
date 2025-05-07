class MerchantEntity {
  final String email;
  final String name;
  final String gender;
  final double longitude;
  final double latitude;
  final String userType;
  final String phone;
  final String address;

  const MerchantEntity({
    required this.email,
    required this.name,
    required this.gender,
    required this.longitude,
    required this.latitude,
    required this.userType,
    required this.phone,
    required this.address,
  });

  factory MerchantEntity.fromJson(Map<String, dynamic> json) {
    return MerchantEntity(
      email: json["email"],
      name: json["name"],
      gender: json["gender"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      userType: json["user_type"],
      phone: json["phone"],
      address: json["address"],
    );
  }


}
