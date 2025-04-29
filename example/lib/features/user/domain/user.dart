class User {
  const User({
    this.uuid,
    this.name,
    this.email,
    this.birthday,
    this.description,
    this.createdAt,
  });

  final String? uuid;
  final String? name;
  final String? email;
  final DateTime? birthday;
  final String? description;
  final DateTime? createdAt;

  User copyWith({
    String? uuid,
    String? name,
    String? email,
    DateTime? birthday,
    String? description,
    DateTime? createdAt,
  }) {
    return User(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
      email: email ?? this.email,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
