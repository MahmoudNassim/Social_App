class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? bio;
  String? image;
  String? cover;
  bool? isEmailVerified;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.bio,
    this.image,
    this.cover,
    this.isEmailVerified
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    bio = json['bio'];
    image = json['image'];
    cover = json['cover'];
    isEmailVerified = json['isEmailVerified'];
  }
  Map<String, dynamic> toMap()
  {
    return{
      'name': name ,
      'email': email ,
      'phone': phone  ,
      'uId': uId  ,
      'image': image  ,
      'bio' : bio,
      'cover':cover,
      'isEmailVerified': isEmailVerified  ,
    };
  }
}
