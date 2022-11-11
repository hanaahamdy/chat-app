import 'package:bloc/bloc.dart';
import 'package:chat_app_with_firebase/features/features/login/data/loin_sates/login_states.dart';
import 'package:chat_app_with_firebase/features/features/register/data/register_sates/register_states.dart';
import 'package:chat_app_with_firebase/features/features/register/presentation/model_views/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Cubit<RegisterStates> {
  RegisterBloc() : super(InitState());

  static RegisterBloc get(BuildContext context) {
    return BlocProvider.of(context);
  }

  void registerUser({required String emails, required String passwords}) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: emails, password: passwords)
        .then((value) {
      createUser(email: emails, password: passwords, Uid: value.user!.uid);
     // emit(RegisterSuccessState());
      print(value.user?.email);
    }).catchError((onError) {
      // if(onError.code==)
      emit(RegisterErrorState(onError.toString()));
    });
  }

  void createUser(
      {required String email, required String password, required String Uid}) {
    UserModel model = UserModel(email: email, passward: password,user_Id: Uid);
    FirebaseFirestore.instance
        .collection("users")
        .doc(Uid)
        .set(model.toJson())
        .then((value) => emit(CreateSuccessState()
    ))
        .catchError((onError) {
      print(onError);
      emit(CreateErrorState());
    });
  }
}
