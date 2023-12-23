import 'package:intl/intl.dart';

class Content {
  String? text;
  List<String>? images;

  Content({this.text, this.images});

  Content.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['images'] = images;
    return data;
  }
}

class Like {
  int? count;
  List<User>? users;

  Like({this.count, this.users});

  Like.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['users'] != null) {
      users = <User>[];
      json['users'].forEach((v) {
        users!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostModel {
  int? postId;
  User? user;
  Content? content;
  String? description;
  String? createdAt;
  Like? like;
  List<String>? hashtags;

  PostModel(
      {this.postId,
      this.user,
      this.content,
      this.description,
      this.createdAt,
      this.like,
      this.hashtags});

  PostModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    content =
        json['content'] != null ? Content.fromJson(json['content']) : null;
    description = json['description'];
    createdAt = json['createdAt'];
    like = json['likes'] != null ? Like.fromJson(json['likes']) : null;
    hashtags = json['hashtags'].cast<String>();
  }

  String get createdAtStr {
    final DateTime now = DateTime.now();
    final DateTime postDate = DateTime.parse(
        createdAt!); // Assuming 'createdAt' is a string representing the date

    final Duration difference = now.difference(postDate);

    if (difference.inDays > 1) {
      // If more than one day has passed, show the date in a different format
      return DateFormat('dd-MMM-yyyy').format(postDate);
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  get hashtagsFormatted => hashtags!.map((e) => e).join(' ');

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = postId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (content != null) {
      data['content'] = content!.toJson();
    }
    data['description'] = description;
    data['createdAt'] = createdAt;
    if (like != null) {
      data['likes'] = like!.toJson();
    }
    data['hashtags'] = hashtags;
    return data;
  }
}

class User {
  int? userId;
  String? username;
  String? fullName;
  String? avatar;

  User({this.userId, this.username, this.fullName, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    fullName = json['fullName'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['username'] = username;
    data['fullName'] = fullName;
    data['avatar'] = avatar;
    return data;
  }
}
