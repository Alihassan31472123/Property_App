import 'dart:convert';

GetSaleResponse getSaleResponseFromJson(String str) => GetSaleResponse.fromJson(json.decode(str));
String getSaleResponseToJson(GetSaleResponse data) => json.encode(data.toJson());

class GetSaleResponse {
  GetSaleResponse({
    this.status,
    this.message,
    this.data,
  });

  factory GetSaleResponse.fromJson(Map<String, dynamic> json) => GetSaleResponse(
        status: json['status'],
        message: json['message'],
        data: List<SaleItem>.from(json['data'].map((x) => SaleItem.fromJson(x))),
      );

  String? status;
  String? message;
  List<SaleItem>? data;

  GetSaleResponse copyWith({
    String? status,
    String? message,
    List<SaleItem>? data,
  }) =>
      GetSaleResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SaleItem {
  SaleItem({
    this.id,
    this.name,
    // other fields
  });

  factory SaleItem.fromJson(Map<String, dynamic> json) => SaleItem(
        id: json['id'],
        name: json['name'],
        // other fields
      );

  int? id;
  String? name;
  // other fields

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        // other fields
      };
}
