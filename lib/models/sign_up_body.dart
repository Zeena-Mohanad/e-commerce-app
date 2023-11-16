class SignUpBody {
  String? name;
  String? email;
  String? password;
  String? repeatPassword;
  String? phone;
  String? gender;

  SignUpBody(
      {this.name,
      this.email,
      this.password,
      this.repeatPassword,
      this.phone,
      this.gender});

  SignUpBody.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = '';
    repeatPassword = '';
    phone = json['Phone'];
    gender = json['Gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['repeat_password'] = repeatPassword;
    data['Phone'] = phone;
    data['Gender'] = gender;
    return data;
  }
}
