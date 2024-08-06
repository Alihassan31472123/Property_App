/// status : "Success"
/// message : "Data Found."
/// data : [{"docID":1,"code":"0","fileID":1,"fileIDD":null,"doc_Name":"228ce395-ca40-48ae-80e3-36d907f62ec620230820152643941.jpg","document_Type":"Image","doc_ID":"0","expiry_dte":null,"doc_Path":"D:\\Apni App\\ApniPropertyApp\\wwwroot\\File_Images\\228ce395-ca40-48ae-80e3-36d907f62ec62023082015264394","isPic":true,"inserted_By":5,"inserted_Ip":"192.168.1.93","inserted_dte":"2023-08-20T15:26:43.467","updated_By":null,"updated_Ip":null,"updated_dte":null,"businessID":null,"isActive":false,"file":null}]

class ProductImagesResponse {
  ProductImagesResponse({
      String? status, 
      String? message, 
      String? foldername,
      List<Data>? data,}){
    _status = status;
    _message = message;
    _foldername = foldername;
    _data = data;
    
}

  ProductImagesResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _foldername = json['foldername'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  String? _foldername;
  List<Data>? _data;
ProductImagesResponse copyWith({  String? status,
  String? message,
  String? foldername,

  List<Data>? data,
}) => ProductImagesResponse(  status: status ?? _status,
  message: message ?? _message,
  foldername: foldername ?? _foldername,
  
  
  data: data ?? _data,
);
  String? get status => _status;
  String? get message => _message;
  String? get foldername => _foldername;
   List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['foldername'] = _foldername;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// docID : 1
/// code : "0"
/// fileID : 1
/// fileIDD : null
/// doc_Name : "228ce395-ca40-48ae-80e3-36d907f62ec620230820152643941.jpg"
/// document_Type : "Image"
/// doc_ID : "0"
/// expiry_dte : null
/// doc_Path : "D:\\Apni App\\ApniPropertyApp\\wwwroot\\File_Images\\228ce395-ca40-48ae-80e3-36d907f62ec62023082015264394"
/// isPic : true
/// inserted_By : 5
/// inserted_Ip : "192.168.1.93"
/// inserted_dte : "2023-08-20T15:26:43.467"
/// updated_By : null
/// updated_Ip : null
/// updated_dte : null
/// businessID : null
/// isActive : false
/// file : null

class Data {
  Data({
      num? docID, 
      String? code, 
      num? fileID, 
      dynamic fileIDD, 
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
      dynamic file,}){
    _docID = docID;
    _code = code;
    _fileID = fileID;
    _fileIDD = fileIDD;
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
    _file = file;
}

  Data.fromJson(dynamic json) {
    _docID = json['docID'];
    _code = json['code'];
    _fileID = json['fileID'];
    _fileIDD = json['fileIDD'];
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
    _file = json['file'];
  }
  num? _docID;
  String? _code;
  num? _fileID;
  dynamic _fileIDD;
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
  dynamic _file;
Data copyWith({  num? docID,
  String? code,
  num? fileID,
  dynamic fileIDD,
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
  dynamic file,
}) => Data(  docID: docID,
  code: code ?? _code,
  fileID: fileID ?? _fileID,
  fileIDD: fileIDD ?? _fileIDD,
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
  file: file ?? _file,
);
  num? get docID => _docID;
  String? get code => _code;
  num? get fileID => _fileID;
  dynamic get fileIDD => _fileIDD;
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
  dynamic get file => _file;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['docID'] = _docID;
    map['code'] = _code;
    map['fileID'] = _fileID;
    map['fileIDD'] = _fileIDD;
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
    map['file'] = _file;
    return map;
  }

}