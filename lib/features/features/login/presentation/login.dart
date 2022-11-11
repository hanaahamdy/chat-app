import 'package:chat_app_with_firebase/core/core/shared_prefrences/sharedPrefrences.dart';
import 'package:chat_app_with_firebase/features/features/login/data/login_bloc/login_bloc.dart';
import 'package:chat_app_with_firebase/features/features/login/presentation/widgets/build_form_field.dart';
import 'package:chat_app_with_firebase/features/features/login/presentation/widgets/custom_button.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core/app_texts.dart';
import '../../../../core/core/image_url.dart';
import '../data/loin_sates/login_states.dart';

class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginStates>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            LocalDataBase.setSData(key: "uid", value: state.uid).then((value) {
             userId=state.uid;
              print(userId);
              Navigator.pushNamedAndRemoveUntil(context, "HomePage", (route) => false);

            });

          }
        },
        builder: (context, state) {
          var cubit = LoginBloc.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .16,
                      ),
                      Image(
                        image: AssetImage(AppImages.login_logo),
                      ),
                      Text(
                        AppTexts.login_title,
                        style: AppStyles.largeStyle,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .16,
                      ),
                      buildTextFormField(
                          label: "Email",
                          controller: emailController,
                          prefix: Icons.email),
                      buildTextFormField(
                          label: "password",
                          security: cubit.isSecure,

                          suffixAction: (){
                            cubit.iconSecure();
                          },
                          controller: passwordController,
                          prefix: Icons.lock
                      ,suffix: cubit.visibilty
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConditionalBuilder(fallback: (context)=>Center(child: CircularProgressIndicator(),),
                          condition: state is! LoginLoadingState,
                         builder: (context){return  buildLoginButton(
                             cubit);
                         },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          AppButtons.buildTextButton(context: context,
                              buttonLabel: "Create One",
                            pageName: "Register")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding buildLoginButton(LoginBloc cubit) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: AppButtons.buildElevatedButton(
          text: "Sign In",
          voidmethod: () {
            if (formKey.currentState!.validate()) {
              cubit.loginUser(
                  emails: emailController.text,
                  passwords: passwordController.text);
            }
          }),
    );
  }
}
