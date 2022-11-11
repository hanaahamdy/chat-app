import 'package:bloc/bloc.dart';
import 'package:chat_app_with_firebase/core/core/app_texts.dart';
import 'package:chat_app_with_firebase/features/features/home_page/bloc/massege_states.dart';
import 'package:chat_app_with_firebase/features/features/home_page/models/massege_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageBloc extends Cubit<MessageStates> {
  MessageBloc() : super(MessageInitState());

  static MessageBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  sendMessages({required String Message}) {
    emit(SendMessageLoadingState());
    MessageModel massegeModel = MessageModel(createdAt: DateTime.now(),id: userId!,
        message: Message);
    FirebaseFirestore.instance
        .collection("messages")
        .add(massegeModel.tojson() )
        .then((value) {
          getMessages();
      emit(SendMessageSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(SendMessageErrorState());
    });
  }

  List<MessageModel>? messagesList ;
 MessageModel? model;
  void getMessages() {
    messagesList=[];
    emit(GetMessageLoadingState());
    FirebaseFirestore.instance.collection("messages").orderBy("createdAt",descending:true ).get().then((value) {
      value.docs.forEach((element){
        messagesList?.add(MessageModel.fromjson(element.data())
        );
      });
      emit(SendMessageSuccessState());
    }).catchError((onError) {
      print(onError);
      emit(SendMessageErrorState());
    });
  }
}
