import 'package:bloc/bloc.dart';
import 'package:chat_app_with_firebase/core/core/app_texts.dart';
import 'package:chat_app_with_firebase/core/core/shared_prefrences/sharedPrefrences.dart';
import 'package:chat_app_with_firebase/features/features/home_page/chat_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'config/config/theme.dart';
import 'core/core/bloc_observer.dart';
import 'features/features/login/presentation/login.dart';
import 'features/features/register/presentation/views/register.dart';
import 'firebase_options.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await  LocalDataBase.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 userId=LocalDataBase.getData(key: "uid");
  Bloc.observer = MyBlocObserver();
  runApp( MyApp(id: userId,));
}

class MyApp extends StatelessWidget {

final String? id;

   MyApp(
{required this.id}
   );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "HomePage":(context)=>ChatPage(),
        "Login":(context)=>Login(),
        "Register":(context)=>RegesterScreen()
      },
      title: 'Flutter Demo',
      theme: CustomAppTheme(),
      initialRoute:userId==null?"Login":"HomePage",
    );
  }
}

