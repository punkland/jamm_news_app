import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jamm_news_app/utils/app_colors.dart';
import 'package:jamm_news_app/utils/app_constants.dart';
import 'package:jamm_news_app/utils/app_text_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:jamm_news_app/bloc/bloc.dart';
import 'package:jamm_news_app/screens/widgets/categories.dart';
import 'package:jamm_news_app/screens/widgets/news_item.dart';
import 'package:jamm_news_app/model/article.dart';
import 'package:jamm_news_app/repository/news_repository.dart';

class ListArticles extends StatefulWidget {
  const ListArticles({super.key});

  @override
  State<ListArticles> createState() => _ListArticlesState();
}

class _ListArticlesState extends State<ListArticles> {
  String currentHeading = AppConstants.categoryAll;
  int selectedButtonID = 0;

  String selectedCategory = AppConstants.categoryAll;
  List<bool> buttonStatus = [
    true,
    false,
    false,
    false,
  ];

  final NewsRepository repository = NewsRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppConstants.appName,
          style: AppTextStyles.appTitle,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              padding:
                  EdgeInsets.only(bottom: 1.h, top: 1.h, left: 1.w, right: 1.w),
              scrollDirection: Axis.horizontal,
              children: [
                Categories(
                  category: AppConstants.categoryAll,
                  buttonID: 0,
                  isSelected: buttonStatus[0],
                  onClicked: (category, id) {
                    selectedCategory = category;
                    selectedButtonID = id;
                    putOffOtherButtons(buttonStatus);
                    setState(() {});
                  },
                ),
                Categories(
                  category: AppConstants.categorySports,
                  buttonID: 6,
                  isSelected: buttonStatus[1],
                  onClicked: (category, id) {
                    selectedCategory = category;
                    selectedButtonID = id;
                    putOffOtherButtons(buttonStatus);
                    setState(() {});
                  },
                ),
                Categories(
                  category: AppConstants.categoryBusiness,
                  buttonID: 1,
                  isSelected: buttonStatus[2],
                  onClicked: (category, id) {
                    selectedCategory = category;
                    selectedButtonID = id;
                    putOffOtherButtons(buttonStatus);
                    setState(() {});
                  },
                ),
                Categories(
                  category: AppConstants.categoryTechnology,
                  buttonID: 7,
                  isSelected: buttonStatus[3],
                  onClicked: (category, id) {
                    selectedCategory = category;
                    selectedButtonID = id;
                    putOffOtherButtons(buttonStatus);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Expanded(
            flex: 14,
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsInitialState) {
                  context.read<NewsBloc>().add(
                      GetArticlesEvent(categoryName: AppConstants.categoryAll));
                } else if (state is NewsLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.blue,
                    ),
                  );
                } else if (state is NewsSuccessState) {
                  return RefreshIndicator(
                      onRefresh: () async {
                        BlocProvider.of<NewsBloc>(context).add(
                          GetArticlesEvent(
                            categoryName: selectedCategory,
                          ),
                        );
                      },
                      child: buildArticles(context, state.articles));
                } else if (state is NewsErrorState) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      BlocProvider.of<NewsBloc>(context).add(
                        GetArticlesEvent(
                          categoryName: selectedCategory,
                        ),
                      );
                    },
                    child: const Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline),
                      ],
                    )),
                  );
                }
                return const Center(child: Text('Something Else Happened!'));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildArticles(BuildContext context, List<Article>? articles) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h),
              itemCount: articles!.length,
              itemBuilder: ((context, index) {
                return NewsItem(
                  title: articles[index].title,
                  description: articles[index].description,
                  author: articles[index].author,
                  content: articles[index].content,
                  url: articles[index].url,
                  urlToImage: articles[index].urlToImage,
                );
              })),
        ),
      ],
    );
  }

  void putOffOtherButtons(List<bool> buttonStatus) {
    for (int i = 0; i < buttonStatus.length; i++) {
      if (i != selectedButtonID) {
        buttonStatus[i] = false;
      }
    }
    buttonStatus[selectedButtonID] = true;
    if (selectedCategory[1] == 'o') {
      currentHeading = 'ALL';
    } else {
      selectedCategory = currentHeading =
          selectedCategory[0].toUpperCase() + selectedCategory.substring(1);
    }
  }
}
