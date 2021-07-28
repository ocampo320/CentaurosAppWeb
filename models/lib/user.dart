class User {
  static User? singleton;

  int? idClient;
  String? identificationClient;
  String? typeIdentification;
  String? nameClient;
  String? lastNameClient;
  String? birthdayDate;
  String? addressClient;
  String? phoneNumberClient;
  String? profession;
  int? salary;
  double? expenses;
  String? typeContract;
  String? email;

  User.initial(
      {this.idClient,
      this.identificationClient,
      this.typeIdentification,
      this.nameClient,
      this.lastNameClient,
      this.birthdayDate,
      this.addressClient,
      this.phoneNumberClient,
      this.profession,
      this.salary,
      this.expenses,
      this.typeContract,
      this.email});

  factory User() {
    if (singleton == null) {
      singleton = User.initial();
    }
    return singleton!;
  }

  User.fromJson(Map<String, dynamic> json) {
    idClient = json['idClient'];
    identificationClient = json['identificationClient'];
    typeIdentification = json['typeIdentification'];
    nameClient = json['nameClient'];
    lastNameClient = json['lastNameClient'];
    birthdayDate = json['birthdayDate'];
    addressClient = json['addressClient'];
    phoneNumberClient = json['phoneNumberClient'];
    profession = json['profession'];
    salary = json['salary'];
    expenses = json['expenses'];
    typeContract = json['typeContract'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idClient'] = this.idClient;
    data['identificationClient'] = this.identificationClient;
    data['typeIdentification'] = this.typeIdentification;
    data['nameClient'] = this.nameClient;
    data['lastNameClient'] = this.lastNameClient;
    data['birthdayDate'] = this.birthdayDate;
    data['addressClient'] = this.addressClient;
    data['phoneNumberClient'] = this.phoneNumberClient;
    data['profession'] = this.profession;
    data['salary'] = this.salary;
    data['expenses'] = this.expenses;
    data['typeContract'] = this.typeContract;
    data['email'] = this.email;
    return data;
  }
}
