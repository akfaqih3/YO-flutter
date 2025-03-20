class MerchantEntity {
  final String email;
  final String name;
  final String gender;
  final double longitude;
  final double latitude;
  final String userType;
  final String phone;
  final String idCommercial;
  final String address;

  const MerchantEntity({
    required this.email,
    required this.name,
    required this.gender,
    required this.longitude,
    required this.latitude,
    required this.userType,
    required this.phone,
    required this.idCommercial,
    required this.address,
  });
}
