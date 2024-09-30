import 'package:flutter/material.dart';
import 'package:jamm_news_app/screens/news_page/news_page.dart';
import 'package:jamm_news_app/utils/app_constants.dart';
import 'package:jamm_news_app/utils/app_text_styles.dart';
import 'package:sizer/sizer.dart';

class NewsItem extends StatelessWidget {
   final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;

  const NewsItem(
      {super.key,
      required this.title,
      required this.description,
      required this.author,
      required this.url,
      required this.urlToImage,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => NewsPage(
              title: title,
              description: description,
              author: author,
              content: content,
              urlToImage: urlToImage,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(2.h),
        margin: EdgeInsets.only(bottom: 1.5.h),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              title,
              maxLines: 1,
              style: AppTextStyles.summaryTitle,
            ),
            Text(
              description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: AppTextStyles.summaryDescription,
            ),
            FadeInImage(
              width: 40.w,
              placeholder: Image.asset(
                      alignment: Alignment.center,
                      fit: BoxFit.scaleDown,
                      height: 1.h,
                      AppConstants.loadingImg)
                  .image,
              imageErrorBuilder: (context, error, stackTrace) {
                return Container(
                  alignment: Alignment.center,
                  height: 20.h,
                  child: Image.asset(AppConstants.placeHolderImg),
                );
              },
              image: Image.network(
                urlToImage,
                fit: BoxFit.scaleDown,
              ).image,
            ),
          ],
        ),
      ),
    );
  }
}
