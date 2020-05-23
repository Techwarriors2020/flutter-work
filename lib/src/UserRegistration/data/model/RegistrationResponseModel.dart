class RegistrationResponseModel {
  String code;
  String message;
  String email;

  RegistrationResponseModel({
    this.code,
    this.message,
    this.email,
  });

  factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) => RegistrationResponseModel(
    code: json["code"],
    message: json["message"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "email": email,
  };
}
