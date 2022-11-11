import 'package:bloc/bloc.dart';
import 'package:chat_app_with_firebase/features/features/login/data/loin_sates/login_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Cubit<LoginStates>{
  LoginBloc():super(InitialState());

  static LoginBloc get(BuildContext context){
    return BlocProvider.of(context);
  }
  void loginUser({required String emails,required String passwords}){
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: emails, password: passwords).then((value) {

      emit(LoginSuccessState(value.user!.uid));
      print(value.user?.email);
    }).catchError((onError){
      // if(onError.code==)
      emit(LoginErrorState(onError.toString()));
    });

  }

  bool isSecure=false;
  IconData visibilty=Icons.visibility_off;
  void iconSecure(){
    isSecure=!isSecure;
    visibilty=isSecure?Icons.visibility_off:Icons.visibility;
    emit( VisibilityChange());

  }

}