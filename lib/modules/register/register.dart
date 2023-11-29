// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/home_layout.dart';
import 'package:social_app/modules/register/cubit/cubit.dart';
import 'package:social_app/modules/register/cubit/states.dart';
import 'package:social_app/shared/component/component.dart';

class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
           if (state is CreateUserSuccessState) {
             navigateAndFinish(context, HomeLayout()); 
           }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Register now to communicate with your friends',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultTextFormField(
                            controller: cubit.nameController,
                            type: TextInputType.name,
                            label: 'User Name',
                            prefix: Icons.person,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please Enter Your User Name';
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultTextFormField(
                            controller: cubit.emailController,
                            type: TextInputType.emailAddress,
                            label: 'Email Address',
                            prefix: Icons.email,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please Enter Your Email Address';
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultTextFormField(
                          type: TextInputType.visiblePassword,
                          controller: cubit.passwordController,
                          label: 'Password',
                          prefix: Icons.lock,
                          suffix: RegisterCubit.get(context).suffix,
                          obsecuretext: RegisterCubit.get(context).isVisibale,
                          onSumbit: (value) {},
                          suffixpressed: () {
                           cubit
                                .changVisibilityPassword();
                          },
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'please Enter Your Password';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultTextFormField(
                            controller: cubit.phoneController,
                            type: TextInputType.number,
                            label: 'Phone',
                            prefix: Icons.phone,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please Enter Your Phone Number';
                              }
                            },
                            onSumbit: (value) {
                              if (formKey.currentState!.validate()) {
                                cubit.userRegister(
                                    name: cubit.nameController.text,
                                    email: cubit.emailController.text,
                                    password: cubit.passwordController.text,
                                    phone: cubit.phoneController.text);
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLodingState,
                          builder: (BuildContext context) => defaultButton(
                              text: 'REGISTER',
                              context: context,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.userRegister(
                                      name: cubit.nameController.text,
                                      email: cubit.emailController.text,
                                      password: cubit.passwordController.text,
                                      phone: cubit.phoneController.text);
                                }
                              }),
                          fallback: (BuildContext context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
