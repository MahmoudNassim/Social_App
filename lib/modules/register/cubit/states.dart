// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLodingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
    String state;
  RegisterSuccessState(
    this.state,
  );
  }

class RegisterErrorState extends RegisterStates {
  String error;
  RegisterErrorState(
    this.error,
  );
}

class CreateUserSuccessState extends RegisterStates {}

class CreateUserErrorState extends RegisterStates {
  String error;
  CreateUserErrorState(
    this.error,
  );
}

class RegisterVisiblePasswordState extends RegisterStates {}
