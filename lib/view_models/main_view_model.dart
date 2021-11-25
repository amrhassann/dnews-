import 'package:dnews/models/Article.dart';
import 'package:dnews/others/Api/newsApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainVM extends GetxController{

  NewsApi newsApi = new NewsApi();
  // List<Article> articles = [];
  var articles = <Article>[].obs;
  int page = 5;
  int currentPage = 1;
  bool loading = true;
  ScrollController scrollController = new ScrollController();
  static String? selectedCategory;


  fetchNews() {
    newsApi.fetchArticle(
        page: currentPage, category: selectedCategory, country: 'eg')
        .then((value) {
      articles.addAll(value);
        loading = false;
        if (currentPage != page) {
          currentPage++;
        }
        update();
    });
  }

@override
  void onInit() {
    print(selectedCategory);
    print(currentPage);
  fetchNews();
  scrollController.addListener(() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      fetchNews();
    }
  });
    super.onInit();
  }

 @override
  void onClose() {
   scrollController.dispose();
    super.onClose();
  }
}