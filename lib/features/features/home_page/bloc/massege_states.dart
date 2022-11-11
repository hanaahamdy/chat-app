abstract class MessageStates{}
class MessageInitState extends MessageStates{}
class SendMessageLoadingState extends MessageStates{}
class SendMessageSuccessState extends MessageStates{}
class SendMessageErrorState extends MessageStates{}
class GetMessageLoadingState extends MessageStates{}
class GetMessageSuccessState extends MessageStates{}
class GetMessageErrorState extends MessageStates{}