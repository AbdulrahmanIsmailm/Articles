import 'package:articles/model/articles.dart';
import 'package:articles/mvvvm/articles_view_modle.dart';
import 'package:articles/ui/articles/article_card_item.dart';
import 'package:articles/ui/help_widget.dart';
import 'package:articles/ui/widgets/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ArticlesViewModel(),
      child: Consumer<ArticlesViewModel>(
        builder: (context, viewModel, child) {
          List<Articles> articles =
              (viewModel.articlesAssociatedPress + viewModel.articlesNextWeb);
          return viewModel.errors == null
              ? articles.isNotEmpty
                  ? ListView.builder(
                      itemCount: articles.length,
                      padding: const EdgeInsets.only(
                        top: paddingBig,
                        right: paddingBig,
                        left: paddingBig,
                      ),
                      itemBuilder: (context, index) {
                        return ArticleCardItem(article: articles[index]);
                      },
                    )
                  : const Center(child:  CircularProgressIndicator())
              : MessageScreen(title: viewModel.errors!, errors: true);
        },
      ),
    );
  }
}
