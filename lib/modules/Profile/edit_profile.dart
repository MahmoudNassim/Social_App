// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/component/component.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';

class EditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var usermodel = AppCubit.get(context).model;
        var profileImage = AppCubit.get(context).profileImage;
                var coverImage = AppCubit.get(context).coverImage;

        nameController.text = usermodel!.name!;
        bioController.text = usermodel.bio!;
        return Scaffold(
          appBar:
              defaultAppBar(context: context, title: 'Edit Profile', actions: [
            IconButton(
                onPressed: () {},
                icon: const Text(
                  'Update',
                  style: TextStyle(color: Colors.blue),
                )),
            const SizedBox(
              width: 10,
            )
          ]),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 190,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(4),
                                      topLeft: Radius.circular(4),
                                    ),
                                    image: DecorationImage(
                                        image: coverImage != null
                                            ? FileImage(coverImage)
                                                as ImageProvider<Object>
                                            : NetworkImage(
                                                '${usermodel.cover}'),
                                        fit: BoxFit.cover)),
                              ),
                              IconButton(
                                  onPressed: () {
                                    AppCubit.get(context).getCoverImage();
                                  },
                                  icon: const CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 15,
                                      child: Icon(Icons.camera_alt_outlined))),
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 62,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 58,
                                backgroundImage: profileImage != null
                                    ? FileImage(profileImage)
                                        as ImageProvider<Object>?
                                    : NetworkImage('${usermodel.image}'),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  AppCubit.get(context).getProfileImage();
                                },
                                icon: const CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 15,
                                    child: Icon(Icons.camera_alt_outlined))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  defaultTextFormField(
                      type: TextInputType.name,
                      controller: nameController,
                      label: 'Name',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'name Must not be null';
                        }
                        return null;
                      },
                      enabledBorderColor: Colors.grey[350],
                      labelStyle: TextStyle(color: Colors.grey),
                      prefix: Icons.person),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultTextFormField(
                      type: TextInputType.text,
                      controller: bioController,
                      label: 'Bio',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Bio Must not be null';
                        }
                        return null;
                      },
                      enabledBorderColor: Colors.grey[350],
                      labelStyle: TextStyle(color: Colors.grey),
                      prefix: Icons.info_outline),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
