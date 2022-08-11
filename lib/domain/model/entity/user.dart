// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String name;
  final String password;

  User(this.name, this.password);

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ password.hashCode;
}
