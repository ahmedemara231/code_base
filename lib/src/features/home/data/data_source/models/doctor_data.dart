class DoctorInfo {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  int appointPrice;
  String startTime;
  String endTime;
  DoctorInfo({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });
  factory DoctorInfo.fromJson(Map<String, dynamic> json) => DoctorInfo(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    phone: json['phone'],
    photo: json['photo'],
    gender: json['gender'],
    address: json['address'],
    description: json['description'],
    appointPrice: json['appoint_price'],
    startTime: json['start_time'],
    endTime: json['end_time'],
  );
}