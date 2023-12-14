// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class AppStates {}

class AppInitialStates extends AppStates {}

class AppLoadingStates extends AppStates {}

class AppSuccessStates extends AppStates {}

class AppErrorStates extends AppStates {
  String? error;
  AppErrorStates(
    this.error,
  );
}


class AppNewPostState extends AppStates {}

class AppChangBottomNavState extends AppStates {}
