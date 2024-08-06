class UserprofileResponse {
  String? status;
  String? message;
  ProfileData? data;

  UserprofileResponse({this.status, this.message, this.data});

  UserprofileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    final jsonData = json['data'];
    if (jsonData is Map<String, dynamic>) {
      data = ProfileData.fromJson(jsonData);
    } else {
      data = null; // Handle the case where 'data' is not a JSON object (e.g., it's an error code).
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileData {
  int? clientID;
  String? code;
  String? firstName;
  String? middleName;
  String? lastName;
  String? contactNumber;
  String? email;
  String? gender;
  String? address;
  String? postal_code;
  String? nominee1Name;
  String? nominee1NID;
  String? nominee1Phone;
  String? nominee1Gender;
  String? nominee1Address;
  String? nominee1Relation;
  String? nominee2Name;
  String? nominee2NID;
  String? nominee2Phone;
  String? nominee2Gender;
  String? nominee2Address;
  String? nominee2Relation;
  String? nid;
  int? countryId;
  int? stateId;
  int? cityId;
  int? walletID;
  String? currencyID;
  String? balance;
  String? walletCode;
  String? walletName;
  String? profilePath;
  String? profileName;
  String? folderName;
  bool? walletIsActive;
  String? occupation;
  String? dateOfBirth;
  int? countryCodeId;

  ProfileData(
      {this.clientID,
      this.code,
      this.firstName,
      this.middleName,
      this.lastName,
      this.contactNumber,
      this.email,
      this.gender,
      this.address,
      this.postal_code,
      this.nominee1Name,
      this.nominee1NID,
      this.nominee1Phone,
      this.nominee1Gender,
      this.nominee1Address,
      this.nominee1Relation,
      this.nominee2Name,
      this.nominee2NID,
      this.nominee2Phone,
      this.nominee2Gender,
      this.nominee2Address,
      this.nominee2Relation,
      this.nid,
      this.countryId,
      this.stateId,
      this.cityId,
      this.walletID,
      this.currencyID,
      this.balance,
      this.walletCode,
      this.walletName,
      this.profilePath,
        this.profileName,
        this.folderName,
      this.walletIsActive,
      this.occupation,
      this.dateOfBirth,
      this.countryCodeId});

  ProfileData.fromJson(Map<String, dynamic> json) {
    clientID = json['client_ID'];
    code = json['code'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    contactNumber = json['contactNumber'];
    email = json['email'];
    gender = json['gender'];
    address = json['address'];
    postal_code = json['postal_code'];
    nominee1Name = json['nominee1Name'];
    nominee1NID = json['nominee1NID'];
    nominee1Phone = json['nominee1Phone'];
    nominee1Gender = json['nominee1Gender'];
    nominee1Address = json['nominee1Address'];
    nominee1Relation = json['nominee1Relation'];
    nominee2Name = json['nominee2Name'];
    nominee2NID = json['nominee2NID'];
    nominee2Phone = json['nominee2Phone'];
    nominee2Gender = json['nominee2Gender'];
    nominee2Address = json['nominee2Address'];
    nominee2Relation = json['nominee2Relation'];
    nid = json['nid'];
    countryId = json['countryId'];
    stateId = json['stateId'];
    cityId = json['cityId'];
    walletID = json['walletID'];
    currencyID = json['currencyID'];
    balance = json['balance'];
    walletCode = json['walletCode'];
    walletName = json['walletName'];
    profilePath = json['profilePath'];
    profileName = json['profileName'];
    folderName = json['folderName'];
    walletIsActive = json['walletIsActive'];
    occupation = json['occupation'];
    dateOfBirth = json['dateOfBirth'];
    countryCodeId = json['countryCodeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['client_ID'] = clientID;
    data['code'] = code;
    data['firstName'] = firstName;
    data['middleName'] = middleName;
    data['lastName'] = lastName;
    data['contactNumber'] = contactNumber;
    data['email'] = email;
    data['gender'] = gender;
    data['address'] = address;
    data['postal_code'] = postal_code;
    data['nominee1Name'] = nominee1Name;
    data['nominee1NID'] = nominee1NID;
    data['nominee1Phone'] = nominee1Phone;
    data['nominee1Gender'] = nominee1Gender;
    data['nominee1Address'] = nominee1Address;
    data['nominee1Relation'] = nominee1Relation;
    data['nominee2Name'] = nominee2Name;
    data['nominee2NID'] = nominee2NID;
    data['nominee2Phone'] = nominee2Phone;
    data['nominee2Gender'] = nominee2Gender;
    data['nominee2Address'] = nominee2Address;
    data['nominee2Relation'] = nominee2Relation;
    data['nid'] = nid;
    data['countryId'] = countryId;
    data['stateId'] = stateId;
    data['cityId'] = cityId;
    data['walletID'] = walletID;
    data['currencyID'] = currencyID;
    data['balance'] = balance;
    data['walletCode'] = walletCode;
    data['walletName'] = walletName;
    data['profilePath'] = profilePath;
    data['profileName'] = profileName;
    data['folderName'] = folderName;
    data['walletIsActive'] = walletIsActive;
    data['occupation'] = occupation;
    data['dateOfBirth'] = dateOfBirth;
    data['countryCodeId'] = countryCodeId;
    return data;
  }
}
