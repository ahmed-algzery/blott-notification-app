import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:newstask/core/constants/constants.dart';
import 'package:newstask/core/util/responsive_utils.dart';
import 'package:newstask/features/news/domain/entities/article.dart';
import 'package:newstask/features/news/presentation/pages/article_details/article_details.dart';

class ArticleTile extends StatelessWidget {
  final ArticleEntity article;
  const ArticleTile({required this.article, super.key});

  // Helper method to format the datetime field
  String formatDateTime(int? timestamp) {
    if (timestamp == null || timestamp == 0) {
      return 'Unknown date';
    }
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
        timestamp * 1000); // Convert to DateTime
    return DateFormat.yMMMd().add_jm().format(dateTime); // Format date and time
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArticleDetails(article),
          ));
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 3,
                spreadRadius: 2,
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image on the left side in square format
              CachedNetworkImage(
                imageUrl: article.image ?? kDefaultImage,
                height: h(context, 0.16), // Make it a square
                width: h(context, 0.14), // Same height and width for square
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    Image.asset(kDefaultImage), // Fallback for error
              ),
              const Gap(10),

              // Article details (source, date, and title)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Source and Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            article.source ?? 'Unknown source',
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                            overflow: TextOverflow.ellipsis, // Handle long text
                          ),
                        ),
                        Text(
                          formatDateTime(article.datetime),
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    const Gap(10),

                    // Title under the image, limited to 3 lines
                    Text(
                      article.headline ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
          .animate()
          .fadeIn(
            duration: const Duration(milliseconds: 500),
          )
          .scaleX(),
    );
  }
}
