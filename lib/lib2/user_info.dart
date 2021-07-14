enum UserType{
  customer,
  merchant
}
class UserInfo {
   UserType userType;
   String userName;
   String email;
   String password;
   String shopName ;
   String companyAddress;
   String pio;

  UserInfo.merchant({
    this.userName,
    this.email,
    this.password,
    this.shopName,
    this.companyAddress,
    this.pio,
    this.userType = UserType.merchant
  });

  UserInfo.customer({
    this.userName,
    this.email,
    this.password,
    this.userType = UserType.customer
  });
}
