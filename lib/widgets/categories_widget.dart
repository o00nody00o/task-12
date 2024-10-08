import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_final_page/models/category.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  var futureCall = FirebaseFirestore.instance.collection('categories').get();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: futureCall,
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error occurred'),
                  );
                }

                if (!snapshot.hasData ||
                    (snapshot.data?.docs.isEmpty ?? false)) {
                  return const Center(
                    child: Text('No categories found'),
                  );
                }

                var categories = List<Category>.from(snapshot.data?.docs
                        .map(
                            (e) => Category.fromJson({'id': e.id, ...e.data()}))
                        .toList() ??
                    []);

                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xffE0E0E0),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(categories[index].name ?? 'No Name'),
                    ),
                  ),
                );
              }),
        ));
  }
}
