class AuthUser{
  final Map<String, dynamic> data;

  AuthUser({required this.data});

  String get id{
    return data['id'];
  }
  String get fullName{
    return data['fullName']??'User';
  }

  DateTime get createdAt{
    return data['createdAt'].toDate();
  }
  String? get imageUrl{
    return data['imageUrl'];
  }

}
