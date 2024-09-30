import 'package:flutter/material.dart';
import 'package:jamm_news_app/utils/app_constants.dart';
import 'package:jamm_news_app/utils/app_text_styles.dart';
import 'package:sizer/sizer.dart';

class NewsPage extends StatefulWidget {
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String content;

  const NewsPage(
      {super.key,
      required this.author,
      required this.title,
      required this.description,
      required this.urlToImage,
      required this.content});

  @override
  State<NewsPage> createState() => ShowDetailStatePage();
}

class ShowDetailStatePage extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(child: Text(widget.title)),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  FadeInImage(
                    placeholder: Image.asset(
                            alignment: Alignment.center,
                            fit: BoxFit.scaleDown,
                            height: 5.h,
                            AppConstants.loadingImg)
                        .image,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          AppConstants.placeHolderImg,
                        ),
                      );
                    },
                    image: Image.network(
                      widget.urlToImage,
                    ).image,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.detailTitle,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      widget.description,
                      style: AppTextStyles.detailDescription,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      widget.content,
                      style: AppTextStyles.detailContent,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
