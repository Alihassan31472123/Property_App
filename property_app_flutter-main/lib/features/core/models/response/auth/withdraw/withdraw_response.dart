/// data : []
/// message : "Data Found."
/// status : "success"
/// walletName : "sub"
/// walletID : 6

class WithDrawResponse {
  WithDrawResponse({
      // List<dynamic>? data,
      String? message, 
      String? status, 
      String? walletName, 
      num? walletID,}){
    // _data = data;
    _message = message;
    _status = status;
    _walletName = walletName;
    _walletID = walletID;
}

  WithDrawResponse.fromJson(dynamic json) {
    // if (json['data'] != null) {
    //   _data = [];
    //   json['data'].forEach((v) {
    //     _data?.add(Dynamic.fromJson(v));
    //   });
    // }
    _message = json['message'];
    _status = json['status'];
    _walletName = json['walletName'];
    _walletID = json['walletID'];
  }
  // List<dynamic>? _data;
  String? _message;
  String? _status;
  String? _walletName;
  num? _walletID;
WithDrawResponse copyWith({  /*List<dynamic>? data,*/
  String? message,
  String? status,
  String? walletName,
  num? walletID,
}) => WithDrawResponse(
  // data: data ?? _data,
  message: message ?? _message,
  status: status ?? _status,
  walletName: walletName ?? _walletName,
  walletID: walletID ?? _walletID,
);
  // List<dynamic>? get data => _data;
  String? get message => _message;
  String? get status => _status;
  String? get walletName => _walletName;
  num? get walletID => _walletID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // if (_data != null) {
    //   map['data'] = _data?.map((v) => v.toJson()).toList();
    // }
    map['message'] = _message;
    map['status'] = _status;
    map['walletName'] = _walletName;
    map['walletID'] = _walletID;
    return map;
  }

}