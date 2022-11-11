import 'package:chat_app_with_firebase/core/core/app_texts.dart';
import 'package:chat_app_with_firebase/features/features/home_page/bloc/massege_bloc.dart';
import 'package:chat_app_with_firebase/features/features/home_page/bloc/massege_states.dart';
import 'package:chat_app_with_firebase/features/features/home_page/presentation/views/widgets/build_massege_text_field.dart';
import 'package:chat_app_with_firebase/features/features/home_page/presentation/views/widgets/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  ScrollController listViewController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      MessageBloc()
        ..getMessages(),
      child: BlocConsumer<MessageBloc, MessageStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MessageBloc.get(context);
          return cubit.messagesList != null
              ? Scaffold(
              backgroundColor: Colors.white,
              appBar: buildChatAppBar(context:context),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(reverse: true,
                      controller: listViewController,
                      itemCount: cubit.messagesList?.length,
                      itemBuilder: (context, index) {
                      return  cubit.messagesList ? [index].id == userId?
                      Align(
                            alignment: Alignment.centerLeft,
                            child:
                                 buildChatBubble(
                                context: context,
                                message: cubit.messagesList![index].message)

                        ):    Align(
                          alignment: Alignment.topRight,
                          child:
                         buildDifferentChatBubble(context: context, message: cubit.messagesList![index].message)
                      );
                      },
                    ),
                  ),
                  buldSendMassegField(
                    sendAction: (){ cubit.sendMessages(Message: controller.text);
                    },
                      controller: controller,
                      onsubmit: (value) {
                        cubit.sendMessages(Message: controller.text);

                        controller.clear();
                        listViewController.animateTo(
                            listViewController.position.maxScrollExtent,
                            duration: Duration(minutes: 1),
                            curve: Curves.fastOutSlowIn
                        );
                      })
                ],
              ))
              : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
