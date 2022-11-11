abstract class LoginStates{}
class InitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class VisibilityChange extends LoginStates{}
class LoginSuccessState extends LoginStates{
  final String uid;

  LoginSuccessState(this.uid);
}
class LoginErrorState extends LoginStates{
  final error;

  LoginErrorState(this.error);

}