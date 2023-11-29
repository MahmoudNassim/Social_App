// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLodingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  String? uId ;
  LoginSuccessState(this.uId);
  
}

class LoginErrorState extends LoginStates {
  String error;
  LoginErrorState(
    this.error,
  );
}

class VisiblePasswordState  extends LoginStates {}