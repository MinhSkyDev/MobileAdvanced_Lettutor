class CourseRequest {
  final int page;
  final int size;
  final String accessToken;

  CourseRequest({
    required this.page,
    required this.size,
    required this.accessToken,
  });

  Map<String, dynamic> toQueryParameters() {
    return {
      'page': page.toString(),
      'size': size.toString(),
    };
  }
}

class CourseInfoRequest {
  final String courseId;
  final String accessToken;

  CourseInfoRequest({
    required this.courseId,
    required this.accessToken,
  });
}

class CourseInfo {
  final String video;
  final String bio;
  final String education;
  final String experience;
  final String profession;
  final String targetStudent;
  final String interests;
  final String languages;
  final String specialties;
  final double rating;
  final String youtubeVideoId;
  final User user;
  final bool isFavorite;
  final double avgRating;
  final int totalFeedback;

  CourseInfo({
    required this.video,
    required this.bio,
    required this.education,
    required this.experience,
    required this.profession,
    required this.targetStudent,
    required this.interests,
    required this.languages,
    required this.specialties,
    required this.rating,
    required this.youtubeVideoId,
    required this.user,
    required this.isFavorite,
    required this.avgRating,
    required this.totalFeedback,
  });

  factory CourseInfo.fromJson(Map<String, dynamic> json) {
    return CourseInfo(
      video: json['video'],
      bio: json['bio'],
      education: json['education'],
      experience: json['experience'],
      profession: json['profession'],
      targetStudent: json['targetStudent'],
      interests: json['interests'],
      languages: json['languages'],
      specialties: json['specialties'],
      rating: json['rating'].toDouble(),
      youtubeVideoId: json['youtubeVideoId'],
      user: User.fromJson(json['User']),
      isFavorite: json['isFavorite'],
      avgRating: json['avgRating'].toDouble(),
      totalFeedback: json['totalFeedback'],
    );
  }
}

class User {
  final String id;
  final String level;
  final String avatar;
  final String name;
  final String country;
  final String language;
  final bool isPublicRecord;
  final String zaloUserId;
  final String studentGroupId;
  final List<CourseItem> courses;

  User({
    required this.id,
    required this.level,
    required this.avatar,
    required this.name,
    required this.country,
    required this.language,
    required this.isPublicRecord,
    required this.zaloUserId,
    required this.studentGroupId,
    required this.courses,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      level: json['level'],
      avatar: json['avatar'],
      name: json['name'],
      country: json['country'],
      language: json['language'],
      isPublicRecord: json['isPublicRecord'],
      zaloUserId: json['zaloUserId'],
      studentGroupId: json['studentGroupId'],
      courses: List<CourseItem>.from(
          json['courses'].map((course) => CourseItem.fromJson(course))),
    );
  }
}

class CourseItem {
  final String id;
  final String name;

  CourseItem({
    required this.id,
    required this.name,
  });

  factory CourseItem.fromJson(Map<String, dynamic> json) {
    return CourseItem(
      id: json['id'],
      name: json['name'],
    );
  }
}
