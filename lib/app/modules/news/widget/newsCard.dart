import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_room/app/data/model/newsList.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCardWidget extends StatelessWidget {
  final Article article;

  const NewsCardWidget({Key key, @required this.article}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: CachedNetworkImage(
              imageUrl: article.urlToImage,
            ),
          ),
          Text(article.title, style: theme.textTheme.headline6),
          Text(
            timeago.format(article.publishedAt),
            style: theme.accentTextTheme.caption,
          ),
          Text(
            article.description,
            style: theme.textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
