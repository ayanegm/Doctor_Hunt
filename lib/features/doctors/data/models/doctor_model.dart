class DoctorModel {
  final String name;
  final String speciality;
  final String id;
  final String? imageUrl;
  DoctorModel({
    this.imageUrl,
    required this.id,
    required this.name,
    required this.speciality,
  });
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      speciality: json['speciality'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'speciality': speciality,
      'imageUrl': imageUrl ?? '',
    };
  }
}
