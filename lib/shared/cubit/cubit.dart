import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/usermodel.dart';
import 'package:social_app/modules/chats/chats_screen.dart';
import 'package:social_app/modules/feeds/feeds_screen.dart';
import 'package:social_app/modules/settings/settings_screen.dart';
import 'package:social_app/modules/users/users_screen.dart';
import 'package:social_app/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel model = UserModel();

  void getUserData() {
    emit(AppLoadingStates());

    FirebaseFirestore.instance
        .collection('users')
        .doc(model.uId)
        .get()
        .then((value) {
      print(value.data());
      emit(AppSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorStates(error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    FeedsScreen(),
    ChatsScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];
  List<String> titles = ['Home', 'Chats', 'Users', 'Settings'];

  changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangBottomNavState());
  }
}
