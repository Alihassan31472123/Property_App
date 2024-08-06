class ProductListResponse {
  ProductListResponse({
    String? status,
    String? message,
    List<ProductData>? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  ProductListResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ProductData.fromJson(v));
      });
    }
  }

  String? _status;
  String? _message;
  List<ProductData>? _data;

  ProductListResponse copyWith({
    String? status,
    String? message,
    List<ProductData>? data,
  }) =>
      ProductListResponse(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );

  String? get status => _status;

  String? get message => _message;

  List<ProductData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductData {
  ProductData({
    num? price,
    num? commissionRate,
    num? saleTax,
    num? purchaseTax,
    num? sizeinSqFeet,
    num? remSizeinSqFeet,
    num? productType,
    num? primaryID,
    num? productID,
    num? unitPrice,
    num? purchasedArea,
    num? remainingArea,
    num? saledArea,
    num? docID,
    String? code,
    dynamic plotID,
    dynamic plotIDD,
    dynamic file,
    String? docName,
    String? documentType,
    dynamic expiryDte,
    String? docPath,
    bool? isPic,
    num? insertedBy,
    String? insertedIp,
    String? insertedDte,
    dynamic updatedBy,
    dynamic updatedIp,
    dynamic updatedDte,
    dynamic businessID,
    bool? isActive,
    String? countryName,
    String? stateName,
    String? cityName,
    String? location,
    String? rentalStatus,
    dynamic monthlyRent,
    String? salesStatus,
    String? purchaseStatus,
    num? propertyPurchaseExpense,
    num? porderID,
    num? clientID,
    num? walletID,
    num? typeID,
    num? currencyID,
    num? countryId,
    num? stateId,
    num? cityId,
    dynamic profit,
    dynamic myMonthlyRent,
    dynamic saleTaxPrice,
    dynamic commissionPrice,
    dynamic productName,
    dynamic walletName,
    String? combineCurrency,
    String? currency,
    dynamic clientName,
    dynamic originalPrice,
    double? tax1,
    double? tax1amount,
    double? tax2,
    double? tax2amount,
    double? tax3,
    double? tax3amount,
    double? tax4,
    double? tax4amount,
    double? tax5,
    double? tax5amount,
    double? tax6,
    double? tax6amount,
  }) {
    _price = price;
    _commissionRate = commissionRate;
    _saleTax = saleTax;
    _purchaseTax = purchaseTax;
    _sizeinSqFeet = sizeinSqFeet;
    _remSizeinSqFeet = remSizeinSqFeet;
    _productType = productType;
    _primaryID = primaryID;
    _productID = productID;
    _unitPrice = unitPrice;
    _purchasedArea = purchasedArea;
    _remainingArea = remainingArea;
    _saledArea = saledArea;
    _docID = docID;
    _code = code;
    _plotID = plotID;
    _plotIDD = plotIDD;
    _file = file;
    _docName = docName;
    _documentType = documentType;
    _expiryDte = expiryDte;
    _docPath = docPath;
    _isPic = isPic;
    _insertedBy = insertedBy;
    _insertedIp = insertedIp;
    _insertedDte = insertedDte;
    _updatedBy = updatedBy;
    _updatedIp = updatedIp;
    _updatedDte = updatedDte;
    _businessID = businessID;
    _isActive = isActive;
    _countryName = countryName;
    _stateName = stateName;
    _cityName = cityName;
    _location = location;
    _rentalStatus = rentalStatus;
    _monthlyRent = monthlyRent;
    _salesStatus = salesStatus;
    _purchaseStatus = purchaseStatus;
    _propertyPurchaseExpense = propertyPurchaseExpense;
    _porderID = porderID;
    _clientID = clientID;
    _walletID = walletID;
    _typeID = typeID;
    _currencyID = currencyID;
    _countryId = countryId;
    _stateId = stateId;
    _cityId = cityId;
    _profit = profit;
    _myMonthlyRent = myMonthlyRent;
    _saleTaxPrice = saleTaxPrice;
    _commissionPrice = commissionPrice;
    _productName = productName;
    _walletName = walletName;
    _combineCurrency = combineCurrency;
    _currency = currency;
    _clientName = clientName;
    _originalPrice = originalPrice;
    _tax1 = tax1??0.0;
    _tax1amount = tax1amount??0.0;
    _tax2 = tax2??0.0;
    _tax2amount = tax2amount??0.0;
    _tax3 = tax3??0.0;
    _tax3amount = tax3amount??0.0;
    _tax4 = tax4??0.0;
    _tax4amount = tax4amount??0.0;
    _tax5 = tax5??0.0;
    _tax5amount = tax5amount??0.0;
    _tax6 = tax6??0.0;
    _tax6amount = tax6amount??0.0;
  }

  ProductData.fromJson(dynamic json) {
    _price = json['price'];
    _commissionRate = json['commissionRate'];
    _saleTax = json['saleTax'];
    _purchaseTax = json['purchaseTax'];
    _sizeinSqFeet = json['sizeinSqFeet'];
    _remSizeinSqFeet = json['remSizeinSqFeet'];
    _productType = json['productType'];
    _primaryID = json['primaryID'];
    _productID = json['productID'];
    _unitPrice = json['unitPrice'];
    _purchasedArea = json['purchasedArea'];
    _remainingArea = json['remainingArea'];
    _saledArea = json['saledArea'];
    _docID = json['docID'];
    _code = json['code'];
    _plotID = json['plotID'];
    _plotIDD = json['plotIDD'];
    _file = json['file'];
    _docName = json['doc_Name'];
    _documentType = json['document_Type'];
    _expiryDte = json['expiry_dte'];
    _docPath = json['doc_Path'];
    _isPic = json['isPic'];
    _insertedBy = json['inserted_By'];
    _insertedIp = json['inserted_Ip'];
    _insertedDte = json['inserted_dte'];
    _updatedBy = json['updated_By'];
    _updatedIp = json['updated_Ip'];
    _updatedDte = json['updated_dte'];
    _businessID = json['businessID'];
    _isActive = json['isActive'];
    _countryName = json['country_Name'];
    _stateName = json['state_Name'];
    _cityName = json['city_Name'];
    _location = json['location'];
    _rentalStatus = json['rental_Status'];
    _monthlyRent = json['monthly_Rent'];
    _salesStatus = json['sales_Status'];
    _purchaseStatus = json['purchase_Status'];
    _propertyPurchaseExpense = json['propertyPurchase_Expense'];
    _porderID = json['porderID'];
    _clientID = json['clientID'];
    _walletID = json['walletID'];
    _typeID = json['typeID'];
    _currencyID = json['currencyID'];
    _countryId = json['countryId'];
    _stateId = json['stateId'];
    _cityId = json['cityId'];
    _profit = json['profit'];
    _myMonthlyRent = json['myMonthly_Rent'];
    _saleTaxPrice = json['saleTaxPrice'];
    _commissionPrice = json['commissionPrice'];
    _productName = json['productName'];
    _walletName = json['walletName'];
    _combineCurrency = json['combineCurrency'];
    _currency = json['currency'];
    _clientName = json['clientName'];
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

  num? _price;
  num? _commissionRate;
  num? _saleTax;
  num? _purchaseTax;
  num? _sizeinSqFeet;
  num? _remSizeinSqFeet;
  num? _productType;
  num? _primaryID;
  num? _productID;
  num? _unitPrice;
  num? _purchasedArea;
  num? _remainingArea;
  num? _saledArea;
  num? _docID;
  String? _code;
  dynamic _plotID;
  dynamic _plotIDD;
  dynamic _file;
  String? _docName;
  String? _documentType;
  dynamic _expiryDte;
  String? _docPath;
  bool? _isPic;
  num? _insertedBy;
  String? _insertedIp;
  String? _insertedDte;
  dynamic _updatedBy;
  dynamic _updatedIp;
  dynamic _updatedDte;
  dynamic _businessID;
  bool? _isActive;
  String? _countryName;
  String? _stateName;
  String? _cityName;
  String? _location;
  String? _rentalStatus;
  dynamic _monthlyRent;
  String? _salesStatus;
  String? _purchaseStatus;
  num? _propertyPurchaseExpense;
  num? _porderID;
  num? _clientID;
  num? _walletID;
  num? _typeID;
  num? _currencyID;
  num? _countryId;
  num? _stateId;
  num? _cityId;
  dynamic _profit;
  dynamic _myMonthlyRent;
  dynamic _saleTaxPrice;
  dynamic _commissionPrice;
  dynamic _productName;
  dynamic _walletName;
  String? _combineCurrency;
  String? _currency;
  dynamic _clientName;
  dynamic _originalPrice;
  double? _tax1;
  double? _tax1amount;
  double? _tax2;
  double? _tax2amount;
  double? _tax3;
  double? _tax3amount;
  double? _tax4;
  double? _tax4amount;
  double? _tax5;
  double? _tax5amount;
  double? _tax6;
  double? _tax6amount;

  ProductData copyWith({
    num? price,
    num? commissionRate,
    num? saleTax,
    num? purchaseTax,
    num? sizeinSqFeet,
    num? remSizeinSqFeet,
    num? productType,
    num? primaryID,
    num? productID,
    num? unitPrice,
    num? purchasedArea,
    num? remainingArea,
    num? saledArea,
    num? docID,
    String? code,
    dynamic plotID,
    dynamic plotIDD,
    dynamic file,
    String? docName,
    String? documentType,
    dynamic expiryDte,
    String? docPath,
    bool? isPic,
    num? insertedBy,
    String? insertedIp,
    String? insertedDte,
    dynamic updatedBy,
    dynamic updatedIp,
    dynamic updatedDte,
    dynamic businessID,
    bool? isActive,
    String? countryName,
    String? stateName,
    String? cityName,
    String? location,
    String? rentalStatus,
    dynamic monthlyRent,
    String? salesStatus,
    String? purchaseStatus,
    num? propertyPurchaseExpense,
    num? porderID,
    num? clientID,
    num? walletID,
    num? typeID,
    num? currencyID,
    num? countryId,
    num? stateId,
    num? cityId,
    dynamic profit,
    dynamic myMonthlyRent,
    dynamic saleTaxPrice,
    dynamic commissionPrice,
    dynamic productName,
    dynamic walletName,
    String? combineCurrency,
    String? currency,
    dynamic clientName,
    dynamic originalPrice,
    double? tax1,
    double? tax1amount,
    double? tax2,
    double? tax2amount,
    double? tax3,
    double? tax3amount,
    double? tax4,
    double? tax4amount,
    double? tax5,
    double? tax5amount,
    double? tax6,
    double? tax6amount,
  }) =>
      ProductData(
        price: price ?? _price,
        commissionRate: commissionRate ?? _commissionRate,
        saleTax: saleTax ?? _saleTax,
        purchaseTax: purchaseTax ?? _purchaseTax,
        sizeinSqFeet: sizeinSqFeet ?? _sizeinSqFeet,
        remSizeinSqFeet: remSizeinSqFeet ?? _remSizeinSqFeet,
        productType: productType ?? _productType,
        primaryID: primaryID ?? _primaryID,
        productID: productID ?? _productID,
        unitPrice: unitPrice ?? _unitPrice,
        purchasedArea: purchasedArea ?? _purchasedArea,
        remainingArea: remainingArea ?? _remainingArea,
        saledArea: saledArea ?? _saledArea,
        docID: docID ?? _docID,
        code: code ?? _code,
        plotID: plotID ?? _plotID,
        plotIDD: plotIDD ?? _plotIDD,
        file: file ?? _file,
        docName: docName ?? _docName,
        documentType: documentType ?? _documentType,
        expiryDte: expiryDte ?? _expiryDte,
        docPath: docPath ?? _docPath,
        isPic: isPic ?? _isPic,
        insertedBy: insertedBy ?? _insertedBy,
        insertedIp: insertedIp ?? _insertedIp,
        insertedDte: insertedDte ?? _insertedDte,
        updatedBy: updatedBy ?? _updatedBy,
        updatedIp: updatedIp ?? _updatedIp,
        updatedDte: updatedDte ?? _updatedDte,
        businessID: businessID ?? _businessID,
        isActive: isActive ?? _isActive,
        countryName: countryName ?? _countryName,
        stateName: stateName ?? _stateName,
        cityName: cityName ?? _cityName,
        location: location ?? _location,
        rentalStatus: rentalStatus ?? _rentalStatus,
        monthlyRent: monthlyRent ?? _monthlyRent,
        salesStatus: salesStatus ?? _salesStatus,
        purchaseStatus: purchaseStatus ?? _purchaseStatus,
        propertyPurchaseExpense:
            propertyPurchaseExpense ?? _propertyPurchaseExpense,
        porderID: porderID ?? _porderID,
        clientID: clientID ?? _clientID,
        walletID: walletID ?? _walletID,
        typeID: typeID ?? _typeID,
        currencyID: currencyID ?? _currencyID,
        countryId: countryId ?? _countryId,
        stateId: stateId ?? _stateId,
        cityId: cityId ?? _cityId,
        profit: profit ?? _profit,
        myMonthlyRent: myMonthlyRent ?? _myMonthlyRent,
        saleTaxPrice: saleTaxPrice ?? _saleTaxPrice,
        commissionPrice: commissionPrice ?? _commissionPrice,
        productName: productName ?? _productName,
        walletName: walletName ?? _walletName,
        combineCurrency: combineCurrency ?? _combineCurrency,
        currency: currency ?? _currency,
        clientName: clientName ?? _clientName,
        originalPrice: originalPrice ?? _originalPrice,
        tax1: tax1 ?? _tax1,
        tax1amount: tax1amount ?? _tax1amount,
        tax2: tax2 ?? _tax2,
        tax2amount: tax2amount ?? _tax2amount,
        tax3: tax3 ?? _tax3,
        tax3amount: tax3amount ?? _tax3amount,
        tax4: tax4 ?? _tax4,
        tax4amount: tax4amount ?? _tax4amount,
        tax5: tax5 ?? _tax5,
        tax5amount: tax5amount ?? _tax5amount,
        tax6: tax6 ?? _tax6,
        tax6amount: tax6amount ?? _tax6amount,
      );

  num? get price => _price;

  num? get commissionRate => _commissionRate;

  num? get saleTax => _saleTax;

  num? get purchaseTax => _purchaseTax;

  num? get sizeinSqFeet => _sizeinSqFeet;

  num? get remSizeinSqFeet => _remSizeinSqFeet;

  num? get productType => _productType;

  num? get primaryID => _primaryID;

  num? get productID => _productID;

  num? get unitPrice => _unitPrice;

  num? get purchasedArea => _purchasedArea;
  num? get remainingArea => _remainingArea;

  num? get saledArea => _saledArea;

  num? get docID => _docID;

  String? get code => _code;

  dynamic get plotID => _plotID;

  dynamic get plotIDD => _plotIDD;

  dynamic get file => _file;

  String? get docName => _docName;

  String? get documentType => _documentType;

  dynamic get expiryDte => _expiryDte;

  String? get docPath => _docPath;

  bool? get isPic => _isPic;

  num? get insertedBy => _insertedBy;

  String? get insertedIp => _insertedIp;

  String? get insertedDte => _insertedDte;

  dynamic get updatedBy => _updatedBy;

  dynamic get updatedIp => _updatedIp;

  dynamic get updatedDte => _updatedDte;

  dynamic get businessID => _businessID;

  bool? get isActive => _isActive;

  String? get countryName => _countryName;

  String? get stateName => _stateName;

  String? get cityName => _cityName;

  String? get location => _location;

  String? get rentalStatus => _rentalStatus;

  dynamic get monthlyRent => _monthlyRent;

  String? get salesStatus => _salesStatus;

  String? get purchaseStatus => _purchaseStatus;

  num? get propertyPurchaseExpense => _propertyPurchaseExpense;

  num? get porderID => _porderID;

  num? get clientID => _clientID;

  num? get walletID => _walletID;

  num? get typeID => _typeID;

  num? get currencyID => _currencyID;

  num? get countryId => _countryId;

  num? get stateId => _stateId;

  num? get cityId => _cityId;

  dynamic get profit => _profit;

  dynamic get myMonthlyRent => _myMonthlyRent;

  dynamic get saleTaxPrice => _saleTaxPrice;

  dynamic get commissionPrice => _commissionPrice;

  dynamic get productName => _productName;

  dynamic get walletName => _walletName;

  String? get combineCurrency => _combineCurrency;

  String? get currency => _currency;

  dynamic get clientName => _clientName;

  dynamic get originalPrice => _originalPrice;

  double? get tax1 => _tax1;

  double? get tax1amount => _tax1amount;

  double? get tax2 => _tax2;

  double? get tax2amount => _tax2amount;

  double? get tax3 => _tax3;

  double? get tax3amount => _tax3amount;

  double? get tax4 => _tax4;

  double? get tax4amount => _tax4amount;

  double? get tax5 => _tax5;

  double? get tax5amount => _tax5amount;

  double? get tax6 => _tax6;

  double? get tax6amount => _tax6amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = _price;
    map['commissionRate'] = _commissionRate;
    map['saleTax'] = _saleTax;
    map['purchaseTax'] = _purchaseTax;
    map['sizeinSqFeet'] = _sizeinSqFeet;
    map['remSizeinSqFeet'] = _remSizeinSqFeet;
    map['productType'] = _productType;
    map['primaryID'] = _primaryID;
    map['productID'] = _productID;
    map['unitPrice'] = _unitPrice;
    map['purchasedArea'] = _purchasedArea;
    map['remainingArea'] = _remainingArea;
    map['saledArea'] = _saledArea;
    map['docID'] = _docID;
    map['code'] = _code;
    map['plotID'] = _plotID;
    map['plotIDD'] = _plotIDD;
    map['file'] = _file;
    map['doc_Name'] = _docName;
    map['document_Type'] = _documentType;
    map['expiry_dte'] = _expiryDte;
    map['doc_Path'] = _docPath;
    map['isPic'] = _isPic;
    map['inserted_By'] = _insertedBy;
    map['inserted_Ip'] = _insertedIp;
    map['inserted_dte'] = _insertedDte;
    map['updated_By'] = _updatedBy;
    map['updated_Ip'] = _updatedIp;
    map['updated_dte'] = _updatedDte;
    map['businessID'] = _businessID;
    map['isActive'] = _isActive;
    map['country_Name'] = _countryName;
    map['state_Name'] = _stateName;
    map['city_Name'] = _cityName;
    map['location'] = _location;
    map['rental_Status'] = _rentalStatus;
    map['monthly_Rent'] = _monthlyRent;
    map['sales_Status'] = _salesStatus;
    map['purchase_Status'] = _purchaseStatus;
    map['propertyPurchase_Expense'] = _propertyPurchaseExpense;
    map['porderID'] = _porderID;
    map['clientID'] = _clientID;
    map['walletID'] = _walletID;
    map['typeID'] = _typeID;
    map['currencyID'] = _currencyID;
    map['countryId'] = _countryId;
    map['stateId'] = _stateId;
    map['cityId'] = _cityId;
    map['profit'] = _profit;
    map['myMonthly_Rent'] = _myMonthlyRent;
    map['saleTaxPrice'] = _saleTaxPrice;
    map['commissionPrice'] = _commissionPrice;
    map['productName'] = _productName;
    map['walletName'] = _walletName;
    map['combineCurrency'] = _combineCurrency;
    map['currency'] = _currency;
    map['clientName'] = _clientName;
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
