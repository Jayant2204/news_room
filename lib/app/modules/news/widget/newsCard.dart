import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_room/app/data/model/newsList.dart';
import 'package:screenshot/screenshot.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCardWidget extends StatelessWidget {
  final Article article;
  final ScreenshotController controller;
  const NewsCardWidget({Key key, @required this.article, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Screenshot(
      controller: controller,
      child: Card(
        elevation: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: theme.accentColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    article.title ?? "",
                    style: theme.textTheme.headline6,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    article.publishedAt != null
                        ? timeago.format(article.publishedAt)
                        : "",
                    style: theme.textTheme.bodyText2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    article.description ?? "",
                    style: theme.textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
