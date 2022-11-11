import 'package:chat_app_with_firebase/core/core/shared_prefrences/sharedPrefrences.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/core/app_colors.dart';
import '../../../../../../core/core/app_texts.dart';
import '../../../../../../core/core/image_url.dart';



Container buildChatBubble({required BuildContext context,required String message}) {
  return Container(
    decoration: BoxDecoration( color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15))),
    margin: EdgeInsets.all(15),
    padding: EdgeInsets.all(15),
    width: MediaQuery.of(context).size.width * .6,

    child: Text("${message}"),
  );
}
Container buildDifferentChatBubble({required BuildContext context,required String message}) {
  return Container(
    decoration: BoxDecoration( color: Colors.grey[400],
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15))),
    margin: EdgeInsets.all(15),
    padding: EdgeInsets.all(15),
    width: MediaQuery.of(context).size.width * .6,

    child: Text("${message}"),
  );
}

AppBar buildChatAppBar({required BuildContext context}) {
  return AppBar(actions: [IconButton(onPressed: (){
    LocalDataBase.removeData(key: "uid").then((value) {
      Navigator.pushNamedAndRemoveUntil(context, "Login", (route) => false);
    });
  },icon: Text("leave"),)],
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(
            AppImages.login_logo,
          ),
          height: 60,
        ),
        Text(
          "Chat",
          style: AppStyles.largeStyle,
        ),
      ],
    ),
  );
}