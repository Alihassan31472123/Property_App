class ProductDetails {
  ProductDetails({
    String? message,
    Data? data,
    String? status,}){
    _message = message;
    _data = data;
    _status = status;
  }

  ProductDetails.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _status = json['status'];
  }
  String? _message;
  Data? _data;
  String? _status;

  String? get message => _message;
  Data? get data => _data;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['status'] = _status;
    return map;
  }

}

class Data {
  Data({
    num? typeID,
    String? fileName,
    String? countryName,
    num? primaryID,
    String? stateName,
    String? cityName,
    String? currency,
    String? location,
    String? sizeType,
    num? sizeinSqFeet,
    num? commissionRate,
    num? currencyID,
    num? saleTax,
    num? remSizeinSqFeet,
    num? unitPrice,
    dynamic purchaseTax,
    num? countryId,
    num? stateId,
    num? cityId,
    num? purchasedArea,
    String? rentalStatus,
    dynamic monthlyRent,
    num? saledArea,
    num? price,
    num? originalPrice,
    num? tax1,
    num? tax1amount,
    num? tax2,
    num? tax2amount,
    num? tax3,
    num? tax3amount,
    num? tax4,
    num? tax4amount,
    num? tax5,
    num? tax5amount,
    num? tax6,
    num? tax6amount,}){
    _typeID = typeID;
    _fileName = fileName;
    _countryName = countryName;
    _primaryID = primaryID;
    _stateName = stateName;
    _cityName = cityName;
    _currency = currency;
    _location = location;
    _sizeType = sizeType;
    _sizeinSqFeet = sizeinSqFeet;
    _commissionRate = commissionRate;
    _currencyID = currencyID;
    _saleTax = saleTax;
    _remSizeinSqFeet = remSizeinSqFeet;
    _unitPrice = unitPrice;
    _purchaseTax = purchaseTax;
    _countryId = countryId;
    _stateId = stateId;
    _cityId = cityId;
    _purchasedArea = purchasedArea;
    _rentalStatus = rentalStatus;
    _monthlyRent = monthlyRent;
    _saledArea = saledArea;
    _price = price;
    _originalPrice = originalPrice;
    _tax1 = tax1;
    _tax1amount = tax1amount;
    _tax2 = tax2;
    _tax2amount = tax2amount;
    _tax3 = tax3;
    _tax3amount = tax3amount;
    _tax4 = tax4;
    _tax4amount = tax4amount;
    _tax5 = tax5;
    _tax5amount = tax5amount;
    _tax6 = tax6;
    _tax6amount = tax6amount;
  }

  Data.fromJson(dynamic json) {
    _typeID = json['typeID'];
    _fileName = json['fileName'];
    _countryName = json['country_Name'];
    _primaryID = json['primaryID'];
    _stateName = json['state_Name'];
    _cityName = json['city_Name'];
    _currency = json['currency'];
    _location = json['location'];
    _sizeType = json['sizeType'];
    _sizeinSqFeet = json['sizeinSqFeet'];
    _commissionRate = json['commissionRate'];
    _currencyID = json['currencyID'];
    _saleTax = json['saleTax'];
    _remSizeinSqFeet = json['remSizeinSqFeet'];
    _unitPrice = json['unitPrice'];
    _purchaseTax = json['purchaseTax'];
    _countryId = json['countryId'];
    _stateId = json['stateId'];
    _cityId = json['cityId'];
    _purchasedArea = json['purchasedArea'];
    _rentalStatus = json['rental_Status'];
    _monthlyRent = json['monthly_Rent'];
    _saledArea = json['saledArea'];
    _price = json['price'];
    _originalPrice = json['originalPrice'];
    _tax1 = json['tax1'];
    _tax1amount = json['tax1amount'];
    _tax2 = json['tax2'];
    _tax2amount = json['tax2amount'];
    _tax3 = json['tax3'];
    _tax3amount = json['tax3amount'];
    _tax4 = json['tax4'];
    _tax4amount = json['tax4amount'];
    _tax5 = json['tax5'];
    _tax5amount = json['tax5amount'];
    _tax6 = json['tax6'];
    _tax6amount = json['tax6amount'];
  }
  num? _typeID;
  String? _fileName;
  String? _countryName;
  num? _primaryID;
  String? _stateName;
  String? _cityName;
  String? _currency;
  String? _location;
  String? _sizeType;
  num? _sizeinSqFeet;
  num? _commissionRate;
  num? _currencyID;
  num? _saleTax;
  num? _remSizeinSqFeet;
  num? _unitPrice;
  dynamic _purchaseTax;
  num? _countryId;
  num? _stateId;
  num? _cityId;
  num? _purchasedArea;
  String? _rentalStatus;
  dynamic _monthlyRent;
  num? _saledArea;
  num? _price;
  num? _originalPrice;
  num? _tax1;
  num? _tax1amount;
  num? _tax2;
  num? _tax2amount;
  num? _tax3;
  num? _tax3amount;
  num? _tax4;
  num? _tax4amount;
  num? _tax5;
  num? _tax5amount;
  num? _tax6;
  num? _tax6amount;

  num? get typeID => _typeID;
  String? get fileName => _fileName;
  String? get countryName => _countryName;
  num? get primaryID => _primaryID;
  String? get stateName => _stateName;
  String? get cityName => _cityName;
  String? get currency => _currency;
  String? get location => _location;
  String? get sizeType => _sizeType;
  num? get sizeinSqFeet => _sizeinSqFeet;
  num? get commissionRate => _commissionRate;
  num? get currencyID => _currencyID;
  num? get saleTax => _saleTax;
  num? get remSizeinSqFeet => _remSizeinSqFeet;
  num? get unitPrice => _unitPrice;
  dynamic get purchaseTax => _purchaseTax;
  num? get countryId => _countryId;
  num? get stateId => _stateId;
  num? get cityId => _cityId;
  num? get purchasedArea => _purchasedArea;
  String? get rentalStatus => _rentalStatus;
  dynamic get monthlyRent => _monthlyRent;
  num? get saledArea => _saledArea;
  num? get price => _price;
  num? get originalPrice => _originalPrice;
  num? get tax1 => _tax1;
  num? get tax1amount => _tax1amount;
  num? get tax2 => _tax2;
  num? get tax2amount => _tax2amount;
  num? get tax3 => _tax3;
  num? get tax3amount => _tax3amount;
  num? get tax4 => _tax4;
  num? get tax4amount => _tax4amount;
  num? get tax5 => _tax5;
  num? get tax5amount => _tax5amount;
  num? get tax6 => _tax6;
  num? get tax6amount => _tax6amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['typeID'] = _typeID;
    map['fileName'] = _fileName;
    map['country_Name'] = _countryName;
    map['primaryID'] = _primaryID;
    map['state_Name'] = _stateName;
    map['city_Name'] = _cityName;
    map['currency'] = _currency;
    map['location'] = _location;
    map['sizeType'] = _sizeType;
    map['sizeinSqFeet'] = _sizeinSqFeet;
    map['commissionRate'] = _commissionRate;
    map['currencyID'] = _currencyID;
    map['saleTax'] = _saleTax;
    map['remSizeinSqFeet'] = _remSizeinSqFeet;
    map['unitPrice'] = _unitPrice;
    map['purchaseTax'] = _purchaseTax;
    map['countryId'] = _countryId;
    map['stateId'] = _stateId;
    map['cityId'] = _cityId;
    map['purchasedArea'] = _purchasedArea;
    map['rental_Status'] = _rentalStatus;
    map['monthly_Rent'] = _monthlyRent;
    map['saledArea'] = _saledArea;
    map['price'] = _price;
    map['originalPrice'] = _originalPrice;
    map['tax1'] = _tax1;
    map['tax1amount'] = _tax1amount;
    map['tax2'] = _tax2;
    map['tax2amount'] = _tax2amount;
    map['tax3'] = _tax3;
    map['tax3amount'] = _tax3amount;
    map['tax4'] = _tax4;
    map['tax4amount'] = _tax4amount;
    map['tax5'] = _tax5;
    map['tax5amount'] = _tax5amount;
    map['tax6'] = _tax6;
    map['tax6amount'] = _tax6amount;
    return map;
  }

}