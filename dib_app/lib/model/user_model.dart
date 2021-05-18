class UserModel{
  String shopName;
  String category;
  String deliveryRange;
  bool isDelivery;
  String phNum;
  String email;

  UserModel(
      {this.shopName,
      this.category,
      this.deliveryRange,
      this.isDelivery,
      this.phNum,
      this.email});

  set userPhNum(String number) => phNum;
}
