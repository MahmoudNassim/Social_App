import 'package:flutter/material.dart';
import 'package:social_app/shared/component/component.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context,title: 'Add Post'),
      
    );
  }
}