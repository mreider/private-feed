



class Feed {
  final Map<String, dynamic> data;

  Feed({required this.data});

  String get id {
    return data['id'];
  }

  String get author{
    return data['author'];
  }

  String get description {
    return data['description'];
  }

  String? get imageUrl {
    return data['imageUrl'];
  }

  List<String> get getLikeIDs {
    return data['likes'].cast<String>() ?? [];
  }

  List<Comment> get  comments{
    return data['comments'].map<Comment>((comment)=> Comment(data:  comment)).toList();
  }

  DateTime get createdAt {
    try{
      return data['createdAt'].toDate();
    }catch(e){
      return data['createdAt'];
    }

  }

  DateTime get updatedAt {
try{
  return data['updatedAt'].toDate();
}catch(e){
  return data['updatedAt'];
}
  }
}


class Comment{
  final Map<String, dynamic> data;

  Comment({required this.data});

  String get author{
    return data["author"];
  }

  String get comment{
    return data['comment'];
  }

  DateTime get createdAt{
    return data['createdAt'].toDate();
  }
}
