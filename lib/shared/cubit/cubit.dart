import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/models/usermodel.dart';
import 'package:social_app/modules/chats/chats_screen.dart';
import 'package:social_app/modules/feeds/feeds_screen.dart';
import 'package:social_app/modules/newpost/new_post_screen.dart';
import 'package:social_app/modules/settings/settings_screen.dart';
import 'package:social_app/modules/users/users_screen.dart';
import 'package:social_app/shared/component/constants.dart';
import 'package:social_app/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel? model;

  void getUserData() {
    emit(AppGetUserLoadingStates());

    // if (model.uId == null || model.uId!.isEmpty) {
    //   // Handle the case where uId is not set
    //   emit(AppErrorStates("User ID is not set"));
    //   print ("User ID is not set");
    // }
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      // Handle the retrieved data as needed
      model = UserModel.fromJson(value.data());
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
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];
  List<String> titles = ['Home', 'Chats', 'Posts', 'Users', 'Settings'];

  changeBottomNav(int index) {
    if (index == 2) {
      emit(AppNewPostState());
    } else {
      currentIndex = index;
      emit(AppChangBottomNavState());
    }
  }

  File? profileImage;

  var picker = ImagePicker();

  Future getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(AppProfileImagePickerSuccessState());
    } else {
      emit(AppProfileImagePickerErrorState());
      print('No Image Select');
    }
  }

  File? coverImage;
  Future getCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(AppCoverImagePickerSuccessState());
    } else {
      emit(AppCoverImagePickerErrorState());
      print('No Image Select');
    }
  }
}
