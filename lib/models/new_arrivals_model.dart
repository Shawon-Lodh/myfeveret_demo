class NewArrivalsModel {
  String slNo;
  String productName;
  String shortDetails;
  String productDescription;
  int availableStock;
  int orderQty;
  int salesQty;
  int orderAmount;
  int salesAmount;
  int discountPercent;
  int discountAmount;
  int unitPrice;
  String productImage;
  String sellerName;
  String sellerProfilePhoto;
  String sellerCoverPhoto;
  String ezShopName;
  int defaultPushScore;
  String myProductVarId;
  String error;

  List<NewArrivalsModel> allNewArrivals;

  NewArrivalsModel(
      {this.slNo,
      this.productName,
      this.shortDetails,
      this.productDescription,
      this.availableStock,
      this.orderQty,
      this.salesQty,
      this.orderAmount,
      this.salesAmount,
      this.discountPercent,
      this.discountAmount,
      this.unitPrice,
      this.productImage,
      this.sellerName,
      this.sellerProfilePhoto,
      this.sellerCoverPhoto,
      this.ezShopName,
      this.defaultPushScore,
      this.myProductVarId});

  NewArrivalsModel.withError(String errorMessage) {
    error = errorMessage;
  }

  NewArrivalsModel.makeListAllNewArrivals(var jsonResponse) {
    allNewArrivals = new List<NewArrivalsModel>();
    jsonResponse.forEach((insideJsonResponse) {
      insideJsonResponse.forEach((value){
        allNewArrivals.add(new NewArrivalsModel.fromJson(value));
      });
    });
  }

  NewArrivalsModel.fromJson(Map<String, dynamic> json) {
    slNo = json['slNo'];
    productName = json['productName'];
    shortDetails = json['shortDetails'];
    productDescription = json['productDescription'];
    availableStock = json['availableStock'];
    orderQty = json['orderQty'];
    salesQty = json['salesQty'];
    orderAmount = json['orderAmount'];
    salesAmount = json['salesAmount'];
    discountPercent = json['discountPercent'];
    discountAmount = json['discountAmount'];
    unitPrice = json['unitPrice'];
    productImage = json['productImage'];
    sellerName = json['sellerName'];
    sellerProfilePhoto = json['sellerProfilePhoto'];
    sellerCoverPhoto = json['sellerCoverPhoto'];
    ezShopName = json['ezShopName'];
    defaultPushScore = json['defaultPushScore'];
    myProductVarId = json['myProductVarId'];
  }
}
