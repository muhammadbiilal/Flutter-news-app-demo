import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app_demo/view/home_screen.dart';
import 'package:news_app_demo/view_model/news_view_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  NewsViewModel newsViewModel = NewsViewModel();
  final format = DateFormat('MMMM dd, yyyy');
  String categoryName = 'general';

  List<String> categoriesList = [
    'General',
    'Health',
    'Entertainment',
    'Business',
    'Technology',
    'Sports',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          categoryName = categoriesList[index];
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          decoration: BoxDecoration(
                              color: categoryName == categoriesList[index]
                                  ? Colors.blue
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Center(
                              child: Text(categoriesList[index].toString()),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
