import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/usermodel.dart';
import 'package:social_app/modules/register/cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  void userRegister({
    required String email,
    required String name,
    required String password,
    required String phone,
  }) {
    emit(RegisterLodingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.uid);
      userCreate(email: email, name: name, phone: phone, uId: value.user!.uid);
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error));
    });
  }

  void userCreate(
      {required String email,
      required String name,
      required String phone,
      required String uId}) {
    UserModel model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      bio: 'Write Your bio.....',
      image: 'https://img.freepik.com/free-photo/3d-rendering-ice-hockey-player_23-2150898762.jpg?t=st=1702306368~exp=1702309968~hmac=9cf561992fce46b219a185f768204cb8c84cd73bc0c74b9df9a1c45d3e881dc2&w=740',
      cover: 'https://img.freepik.com/free-photo/photo-overjoyed-hipster-looks-gladfully-away-points-fore-finger-blank-space_273609-25559.jpg?w=900&t=st=1702216902~exp=1702217502~hmac=c4d0b7d1ccbbaa81b7578b4f98e07f74fd84c556422d7ebc0347208f2e61039c',
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isVisibale = true;

  void changVisibilityPassword() {
    isVisibale = !isVisibale;
    suffix =
        isVisibale ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterVisiblePasswordState());
  }
}
