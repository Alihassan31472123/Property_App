// class MyPurchaseDetails {
//   String? status;
//   String? message;
//   Data? data;
//
//   MyPurchaseDetails({this.status, this.message, this.data});
//
//   MyPurchaseDetails.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String? countryName;
//   Null? fileName;
//   String? stateName;
//   String? cityName;
//   String? currency;
//   int? currencyID;
//   String? location;
//   int? primaryID;
//   int? clientID;
//   Null? sizeType;
//   Null? sizeinSqFeet;
//   int? price;
//   Null? balance;
//   Null? remBalance;
//   Null? remBalance1;
//   int? saleTax;
//   Null? purchaseTax;
//   int? commissionRate;
//   int? remSizeinSqFeet;
//   double? unitPrice;
//   int? purchasedArea;
//   int? saledArea;
//   int? remainingArea;
//   Null? clientRentCommision;
//   Null? clientRentCommisionAmount;
//   int? productID;
//   int? typeID;
//   int? countryId;
//   int? stateId;
//   int? cityId;
//   String? rentalStatus;
//   String? salesStatus;
//   String? purchaseStatus;
//   int? propertyPurchaseExpense;
//   int? porderID;
//   int? clientID;
//   int? walletID;
//   int? profit;
//   Null? myMonthlyRent;
//   double? saleTaxPrice;
//   int? commissionPrice;
//   double? updatedPrice;
//   Null? currentPrice;
//   double? priceVariation;
//   int? remainingUpdatedPrice;
//   String? productName;
//   String? walletName;
//   String? combineCurrency;
//   int? productType;
//   String? clientName;
//   int? docID;
//   String? code;
//   Null? file;
//   String? docName;
//   String? documentType;
//   String? docID;
//   Null? expiryDte;
//   String? docPath;
//   bool? isPic;
//   int? insertedBy;
//   Null? insertedIp;
//   Null? insertedDte;
//   Null? updatedBy;
//   Null? updatedIp;
//   Null? updatedDte;
//   int? businessID;
//   bool? isActive;
//   String? purchaseDate;
//   Null? originalPrice;
//   Null? tax1;
//   Null? tax1amount;
//   Null? tax2;
//   Null? tax2amount;
//   Null? tax3;
//   Null? tax3amount;
//   Null? tax4;
//   Null? tax4amount;
//   Null? tax5;
//   Null? tax5amount;
//   Null? tax6;
//   Null? tax6amount;
//
//   Data(
//       {this.countryName,
//         this.fileName,
//         this.stateName,
//         this.cityName,
//         this.currency,
//         this.currencyID,
//         this.location,
//         this.primaryID,
//         this.clientID,
//         this.sizeType,
//         this.sizeinSqFeet,
//         this.price,
//         this.balance,
//         this.remBalance,
//         this.remBalance1,
//         this.saleTax,
//         this.purchaseTax,
//         this.commissionRate,
//         this.remSizeinSqFeet,
//         this.unitPrice,
//         this.purchasedArea,
//         this.saledArea,
//         this.remainingArea,
//         this.clientRentCommision,
//         this.clientRentCommisionAmount,
//         this.productID,
//         this.typeID,
//         this.countryId,
//         this.stateId,
//         this.cityId,
//         this.rentalStatus,
//         this.monthlyRent,
//         this.salesStatus,
//         this.purchaseStatus,
//         this.propertyPurchaseExpense,
//         this.porderID,
//         this.clientID,
//         this.walletID,
//         this.profit,
//         this.myMonthlyRent,
//         this.saleTaxPrice,
//         this.commissionPrice,
//         this.updatedPrice,
//         this.currentPrice,
//         this.priceVariation,
//         this.remainingUpdatedPrice,
//         this.productName,
//         this.walletName,
//         this.combineCurrency,
//         this.productType,
//         this.clientName,
//         this.docID,
//         this.code,
//         this.file,
//         this.docName,
//         this.documentType,
//         this.docID,
//         this.expiryDte,
//         this.docPath,
//         this.isPic,
//         this.insertedBy,
//         this.insertedIp,
//         this.insertedDte,
//         this.updatedBy,
//         this.updatedIp,
//         this.updatedDte,
//         this.businessID,
//         this.isActive,
//         this.purchaseDate,
//         this.originalPrice,
//         this.tax1,
//         this.tax1amount,
//         this.tax2,
//         this.tax2amount,
//         this.tax3,
//         this.tax3amount,
//         this.tax4,
//         this.tax4amount,
//         this.tax5,
//         this.tax5amount,
//         this.tax6,
//         this.tax6amount});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     countryName = json['country_Name'];
//     fileName = json['fileName'];
//     stateName = json['state_Name'];
//     cityName = json['city_Name'];
//     currency = json['currency'];
//     currencyID = json['currencyID'];
//     location = json['location'];
//     primaryID = json['primaryID'];
//     clientID = json['client_ID'];
//     sizeType = json['sizeType'];
//     sizeinSqFeet = json['sizeinSqFeet'];
//     price = json['price'];
//     balance = json['balance'];
//     remBalance = json['remBalance'];
//     remBalance1 = json['remBalance1'];
//     saleTax = json['saleTax'];
//     purchaseTax = json['purchaseTax'];
//     commissionRate = json['commissionRate'];
//     remSizeinSqFeet = json['remSizeinSqFeet'];
//     unitPrice = json['unitPrice'];
//     purchasedArea = json['purchasedArea'];
//     saledArea = json['saledArea'];
//     remainingArea = json['remainingArea'];
//     clientRentCommision = json['clientRentCommision'];
//     clientRentCommisionAmount = json['clientRentCommisionAmount'];
//     productID = json['productID'];
//     typeID = json['typeID'];
//     countryId = json['countryId'];
//     stateId = json['stateId'];
//     cityId = json['cityId'];
//     rentalStatus = json['rental_Status'];
//     monthlyRent = json['monthly_Rent'];
//     salesStatus = json['sales_Status'];
//     purchaseStatus = json['purchase_Status'];
//     propertyPurchaseExpense = json['propertyPurchase_Expense'];
//     porderID = json['porderID'];
//     clientID = json['clientID'];
//     walletID = json['walletID'];
//     profit = json['profit'];
//     myMonthlyRent = json['myMonthly_Rent'];
//     saleTaxPrice = json['saleTaxPrice'];
//     commissionPrice = json['commissionPrice'];
//     updatedPrice = json['updatedPrice'];
//     currentPrice = json['currentPrice'];
//     priceVariation = json['priceVariation'];
//     remainingUpdatedPrice = json['remainingUpdatedPrice'];
//     productName = json['productName'];
//     walletName = json['walletName'];
//     combineCurrency = json['combineCurrency'];
//     productType = json['productType'];
//     clientName = json['clientName'];
//     docID = json['docID'];
//     code = json['code'];
//     file = json['file'];
//     docName = json['doc_Name'];
//     documentType = json['document_Type'];
//     docID = json['doc_ID'];
//     expiryDte = json['expiry_dte'];
//     docPath = json['doc_Path'];
//     isPic = json['isPic'];
//     insertedBy = json['inserted_By'];
//     insertedIp = json['inserted_Ip'];
//     insertedDte = json['inserted_dte'];
//     updatedBy = json['updated_By'];
//     updatedIp = json['updated_Ip'];
//     updatedDte = json['updated_dte'];
//     businessID = json['businessID'];
//     isActive = json['isActive'];
//     purchaseDate = json['purchaseDate'];
//     originalPrice = json['originalPrice'];
//     tax1 = json['tax1'];
//     tax1amount = json['tax1amount'];
//     tax2 = json['tax2'];
//     tax2amount = json['tax2amount'];
//     tax3 = json['tax3'];
//     tax3amount = json['tax3amount'];
//     tax4 = json['tax4'];
//     tax4amount = json['tax4amount'];
//     tax5 = json['tax5'];
//     tax5amount = json['tax5amount'];
//     tax6 = json['tax6'];
//     tax6amount = json['tax6amount'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['country_Name'] = this.countryName;
//     data['fileName'] = this.fileName;
//     data['state_Name'] = this.stateName;
//     data['city_Name'] = this.cityName;
//     data['currency'] = this.currency;
//     data['currencyID'] = this.currencyID;
//     data['location'] = this.location;
//     data['primaryID'] = this.primaryID;
//     data['client_ID'] = this.clientID;
//     data['sizeType'] = this.sizeType;
//     data['sizeinSqFeet'] = this.sizeinSqFeet;
//     data['price'] = this.price;
//     data['balance'] = this.balance;
//     data['remBalance'] = this.remBalance;
//     data['remBalance1'] = this.remBalance1;
//     data['saleTax'] = this.saleTax;
//     data['purchaseTax'] = this.purchaseTax;
//     data['commissionRate'] = this.commissionRate;
//     data['remSizeinSqFeet'] = this.remSizeinSqFeet;
//     data['unitPrice'] = this.unitPrice;
//     data['purchasedArea'] = this.purchasedArea;
//     data['saledArea'] = this.saledArea;
//     data['remainingArea'] = this.remainingArea;
//     data['clientRentCommision'] = this.clientRentCommision;
//     data['clientRentCommisionAmount'] = this.clientRentCommisionAmount;
//     data['productID'] = this.productID;
//     data['typeID'] = this.typeID;
//     data['countryId'] = this.countryId;
//     data['stateId'] = this.stateId;
//     data['cityId'] = this.cityId;
//     data['rental_Status'] = this.rentalStatus;
//     data['monthly_Rent'] = this.monthlyRent;
//     data['sales_Status'] = this.salesStatus;
//     data['purchase_Status'] = this.purchaseStatus;
//     data['propertyPurchase_Expense'] = this.propertyPurchaseExpense;
//     data['porderID'] = this.porderID;
//     data['clientID'] = this.clientID;
//     data['walletID'] = this.walletID;
//     data['profit'] = this.profit;
//     data['myMonthly_Rent'] = this.myMonthlyRent;
//     data['saleTaxPrice'] = this.saleTaxPrice;
//     data['commissionPrice'] = this.commissionPrice;
//     data['updatedPrice'] = this.updatedPrice;
//     data['currentPrice'] = this.currentPrice;
//     data['priceVariation'] = this.priceVariation;
//     data['remainingUpdatedPrice'] = this.remainingUpdatedPrice;
//     data['productName'] = this.productName;
//     data['walletName'] = this.walletName;
//     data['combineCurrency'] = this.combineCurrency;
//     data['productType'] = this.productType;
//     data['clientName'] = this.clientName;
//     data['docID'] = this.docID;
//     data['code'] = this.code;
//     data['file'] = this.file;
//     data['doc_Name'] = this.docName;
//     data['document_Type'] = this.documentType;
//     data['doc_ID'] = this.docID;
//     data['expiry_dte'] = this.expiryDte;
//     data['doc_Path'] = this.docPath;
//     data['isPic'] = this.isPic;
//     data['inserted_By'] = this.insertedBy;
//     data['inserted_Ip'] = this.insertedIp;
//     data['inserted_dte'] = this.insertedDte;
//     data['updated_By'] = this.updatedBy;
//     data['updated_Ip'] = this.updatedIp;
//     data['updated_dte'] = this.updatedDte;
//     data['businessID'] = this.businessID;
//     data['isActive'] = this.isActive;
//     data['purchaseDate'] = this.purchaseDate;
//     data['originalPrice'] = this.originalPrice;
//     data['tax1'] = this.tax1;
//     data['tax1amount'] = this.tax1amount;
//     data['tax2'] = this.tax2;
//     data['tax2amount'] = this.tax2amount;
//     data['tax3'] = this.tax3;
//     data['tax3amount'] = this.tax3amount;
//     data['tax4'] = this.tax4;
//     data['tax4amount'] = this.tax4amount;
//     data['tax5'] = this.tax5;
//     data['tax5amount'] = this.tax5amount;
//     data['tax6'] = this.tax6;
//     data['tax6amount'] = this.tax6amount;
//     return data;
//   }
// }
