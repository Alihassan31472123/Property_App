class UserDataModel {
  final int id;
  final String name;
  const UserDataModel({required this.id, required this.name});
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      name: json['type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() => 'CurrencyModel(id: $id, name: $name)';
}
