import 'package:articles/model/articles.dart';
import 'package:articles/resources/repository.dart';
import 'package:articles/ui/articles/articles_screen.dart';
import 'package:articles/utils/custom_exception.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ArticlesViewModel  with ChangeNotifier {
  List<Articles> articlesAssociatedPress = [];
  List<Articles> articlesNextWeb = [];
  String? errors;


  ArticlesViewModel() {
    getArticlesTheNextWeb ();
    getArticlesAssociatedPress ();
  }

  void getArticlesTheNextWeb () async {
    try {
      articlesNextWeb = await Repository().getArticles('the-next-web');
    } on MyException catch (e) {
      errors = e.message;
    } catch (e) {
      errors = tr('try_again_later');
    }
    notifyListeners();
  }


  void getArticlesAssociatedPress () async {
    try {
      articlesNextWeb = await Repository().getArticles('associated-press');
    } on MyException catch (e) {
      errors = e.message;
    } catch (e) {
      errors = tr('try_again_later');
    }
    notifyListeners();
  }



}
