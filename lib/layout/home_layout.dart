import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/login/login_screen.dart';
import 'package:social_app/shared/component/component.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';
import 'package:social_app/shared/local/cache_helper.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('News Feed'),
            ),
            body: ConditionalBuilder(
                condition: AppCubit.get(context).model != null ,
                builder: (context) {
                  var model = AppCubit.get(context).model;
                 return  Column(
                  children: [
                    //Verify Account 
                    if (!FirebaseAuth.instance.currentUser!.emailVerified)
                       Container(
                        color: Colors.amber.withOpacity(0.6),
                        width: double.infinity,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(children: [
                              const Icon(Icons.info_outline),
                              const SizedBox(
                                width: 15,
                              ),
                              const Expanded(child: Text('please verify your email')),
                              const SizedBox(
                                width: 15,
                              ),
                              defaultTextButton(function: () {
                                FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value){
                                  showToast(text: 'Check your mail ', state: ToastStates.SUCCESS);
                                }).catchError((error){
                                });
                              }, text: 'Send')
                            ]))),
                            
                    // the body 
                 
                  ]);
                },
                fallback: (context) => const CircularProgressIndicator()));
      },
    );
  }
}
