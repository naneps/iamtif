import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:iamtif/app/common/shape/x_container.dart';
import 'package:iamtif/app/common/theme.dart';
import 'package:iamtif/app/models/post_model.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;
  const PostWidget({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return XContainer(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          XContainer(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://avatar.iran.liara.run/public/${post.postId}"),
                  onBackgroundImageError: (exception, stackTrace) {
                    //   CircleAvatar(
                    //     radius: 20,
                    //     backgroundImage: Netw(
                    //       placeholder: 'assets/images/avatar.png',
                    //       image: post.user!.avatar!,
                    //       fit: BoxFit.cover,
                    //     ).image,
                    //   );
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.user!.fullName!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post.createdAtStr,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
          //   make image slider
          XContainer(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: 300,
            padding: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[300],
            ),
            child: Image.network(
              "https://picsum.photos/seed/${post.postId}/400/300",
              fit: BoxFit.cover,
            ),
          ),
          XContainer(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.comment),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.send),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bookmark_border),
                ),
              ],
            ),
          ),
          XContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  post.user!.fullName!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                ExpandableText(
                  post.description!,
                  expandText: "more",
                  collapseText: "less",
                  maxLines: 2,
                  animation: true,
                  linkColor: ThemeApp().primaryColor,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  linkEllipsis: true,
                  linkStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  post.hashtagsFormatted!,
                  style: TextStyle(
                    color: ThemeApp().primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
