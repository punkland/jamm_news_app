import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jamm_news_app/bloc/bloc.dart';
import 'package:jamm_news_app/utils/app_text_styles.dart';
import 'package:sizer/sizer.dart';

import 'package:jamm_news_app/utils/app_colors.dart';

// ignore: must_be_immutable
class Categories extends StatefulWidget {
  Function onClicked;
  String category = "";
  int buttonID;
  bool isSelected;

  Categories({
    required this.onClicked,
    required this.isSelected,
    required this.category,
    required this.buttonID,
    super.key,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      child: BlocProvider(
        create: (context) => NewsBloc(),
        child: ElevatedButton(
          onPressed: () {
            GetArticlesEvent eventWithCategory = GetArticlesEvent(
              categoryName: widget.category,
            );

            if (BlocProvider.of<NewsBloc>(context).state is! NewsLoadingState) {
              BlocProvider.of<NewsBloc>(context).add(eventWithCategory);
            }

            widget.onClicked(widget.category, widget.buttonID);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                widget.isSelected ? AppColors.blue : AppColors.blue2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1.w),
            ),
          ),
          child: Text(
            widget.category,
            style: AppTextStyles.category,
          ),
        ),
      ),
    );
  }
}
