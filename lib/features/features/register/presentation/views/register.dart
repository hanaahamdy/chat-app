import 'package:chat_app_with_firebase/features/features/register/data/register_bloc/register_bloc.dart';
import 'package:chat_app_with_firebase/features/features/register/data/register_sates/register_states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core/app_texts.dart';
import '../../../../../core/core/image_url.dart';
import '../../../login/presentation/widgets/build_form_field.dart';
import '../../../login/presentation/widgets/custom_button.dart';

class RegesterScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: BlocConsumer<RegisterBloc, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("${state.error}")));
          }
          if (state is CreateSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
                context, "Login", (route) => false);
          }
        },
        builder: (context, state) {
          RegisterBloc cubit = RegisterBloc.get(context);
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
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .16,
                        ),
                        Image(
                          image: AssetImage(AppImages.login_logo),
                        ),
                        Text(
                          AppTexts.login_title,
                          style: AppStyles.largeStyle,
                        ),
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .16,
                        ),
                        buildTextFormField(
                            label: "Email",
                            controller: emailController,
                            prefix: Icons.email),
                        buildTextFormField(
                            label: "password",
                            controller: passwordController,
                            prefix: Icons.lock),
                        ConditionalBuilder(
                            condition: state is! RegisterLoadingState,
                            builder: (context) => buildRegisterbutton(cubit),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator(),))
                       , Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Do you have an account? "),
                            AppButtons.buildTextButton(
                                context: context,
                                pageName: "Login",
                                buttonLabel: "Login")
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

  Padding buildRegisterbutton(RegisterBloc cubit) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: AppButtons.buildElevatedButton(
          voidmethod: () {
            if (formKey.currentState!.validate()) {
              cubit.registerUser(
                  emails: emailController.text,
                  passwords: passwordController.text);
            }
          },
          text: "Sign Up"),
    );
  }
}
