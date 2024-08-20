import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_final_page/widgets/categories_widget.dart';
import 'package:the_final_page/widgets/courses_widget.dart';
import 'package:the_final_page/widgets/label_widget.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Welcome Back! ${FirebaseAuth.instance.currentUser?.displayName}'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              LabelWidget(
                name: 'Categories',
                onSeeAllClicked: () {},
              ),
              CategoriesPage(),
              const SizedBox(
                height: 20,
              ),
              LabelWidget(
                name: 'Top Rated Courses',
                onSeeAllClicked: () {},
              ),
              const CoursesWidget(
                rankValue: 'top rated',
              ),
              ElevatedButton(
                  onPressed: () async {
                    await FirebaseFirestore.instance
                        .collection('test')
                        .doc('x')
                        .delete();
                  },
                  child: Text('test'))
            ],
          ),
        ),
      ),
    );
  }
}
