import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/newpost/new_post_screen.dart';
import 'package:social_app/shared/component/component.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppNewPostState) {
          navigateTo(context, NewPostScreen());
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
              IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: const[
                BottomNavigationBarItem(label: 'Feeds', icon: Icon(Icons.home)),
                BottomNavigationBarItem(label: 'Chats', icon: Icon(Icons.chat)),
                BottomNavigationBarItem(label: 'addPost', icon: Icon(Icons.post_add)),
                BottomNavigationBarItem(
                    label: 'Users', icon: Icon(Icons.location_on_outlined)),
                BottomNavigationBarItem(
                    label: 'Settings', icon: Icon(Icons.settings)),
              ]),
        );
      },
    );
  }
}
