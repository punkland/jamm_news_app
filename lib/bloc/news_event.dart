import 'package:equatable/equatable.dart';

class NewsEvent extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class GetArticlesEvent extends NewsEvent {
  String categoryName;
  String countryName;
  GetArticlesEvent(
      {this.categoryName = 'all', this.countryName = 'us'});
}
