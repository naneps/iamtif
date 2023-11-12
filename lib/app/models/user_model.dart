class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? image;
  String? password;
  String? confirmPassword;
  UserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.image,
    this.password,
    this.confirmPassword,
  });

  UserModel.fromJson(Map<String, dynamic>? json) {
    name = json!['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  Map<String, dynamic> toRegisterMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'confirmPassword': confirmPassword,
    };
  }
}
