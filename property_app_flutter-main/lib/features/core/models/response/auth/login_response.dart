class LoginResponse {
  String? token;
  String? expiration;
  int? userID;
  String? email;
  // List<String>? rolls;

  LoginResponse({
    this.token,
    this.expiration,
    this.userID,
    this.email,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiration = json['expiration'];
    userID = json['userID'];
    email = json['email'];
    // rolls = json['rolls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['expiration'] = expiration;
    data['userID'] = userID;
    data['email'] = email;
    // data['rolls'] = rolls;
    return data;
  }
}
