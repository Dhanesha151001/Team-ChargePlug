// ignore_for_file: non_constant_identifier_names

class UserModel {
  String? email;
  String? firstName;
  String? lastName;
  String? mobile_number;
  String? uid;
  String? vehicleNumber;
  int? count;

  UserModel({this.uid,this.email, this.firstName,this.lastName,this.mobile_number,this.vehicleNumber,this.count});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      mobile_number: map['mobile_number'],
      vehicleNumber: map['vehicleNumber'],
      count: map['count'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'mobile_number': mobile_number,
      'vehicleNumber': vehicleNumber,
      'count': count,
    };
  }
}