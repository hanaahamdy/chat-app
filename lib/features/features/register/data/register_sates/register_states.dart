abstract class RegisterStates{}
class InitState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{}
class CreateErrorState extends RegisterStates{}
class CreateSuccessState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  final error;

  RegisterErrorState(this.error);

}