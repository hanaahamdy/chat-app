class MessageModel{
 final String message;
var createdAt;
final String? id;

  MessageModel({required this.message,required this.createdAt,required this.id});
  factory MessageModel.fromjson(Map<String,dynamic>json){
    return MessageModel(createdAt: json["createdAt"],
        message: json["message"],
    id: json["id"]);
  }
  Map<String,dynamic> tojson(){
    return {"message":message,
    "createdAt": createdAt,"id":id
    };

  }
}