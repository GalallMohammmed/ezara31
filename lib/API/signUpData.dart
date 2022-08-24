class PlantLoginModel {

   String? type;
 String? message;
 UserData? data;

  PlantLoginModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = (json['data']!=null? UserData.fromJson(json['data']):null)!;
  }

}

class UserData {

   String? userId;
   String? firstName;
   String? lastName;
   String? email;
   String? imageUrl;
   String? address;
   String? UserPoints;
   List<String>? UserNotification;

  UserData.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    UserPoints = json['UserPoints'];
    UserNotification = List.castFrom<dynamic, String>(json['UserNotification']);
  }

}