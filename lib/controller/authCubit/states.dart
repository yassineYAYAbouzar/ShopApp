abstract class LoginState {}
class LoginItailState extends LoginState{}

class LoginSucsessState extends LoginState{
  final loginModel;
  LoginSucsessState(this.loginModel);
}
class LoginErrorState extends LoginState{
  final onError;
  LoginErrorState(this.onError);
}
class LoginLoadedState extends LoginState{}
class ChangeobscureTextState extends LoginState{}
