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

class CourseDTO {
  final String message;
  final CourseDataDTO data;

  CourseDTO({
    required this.message,
    required this.data,
  });

  factory CourseDTO.fromJson(Map<String, dynamic> json) {
    return CourseDTO(
      message: json['message'] ?? '',
      data: CourseDataDTO.fromJson(json['data'] ?? {}),
    );
  }
}

class CourseDataDTO {
  dynamic id;
  dynamic name;
  dynamic description;
  dynamic imageUrl;
  dynamic level;
  dynamic reason;
  dynamic purpose;
  dynamic otherDetails;
  dynamic defaultPrice;
  dynamic coursePrice;
  dynamic courseType;
  dynamic sectionType;
  dynamic visible;
  dynamic displayOrder;
  dynamic createdAt;
  dynamic updatedAt;
  List<TopicDTO>? topics;
  List<UserDTO>? users;

  CourseDataDTO({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.level,
    required this.reason,
    required this.purpose,
    required this.otherDetails,
    required this.defaultPrice,
    required this.coursePrice,
    required this.courseType,
    required this.sectionType,
    required this.visible,
    required this.displayOrder,
    required this.createdAt,
    required this.updatedAt,
    required this.topics,
    required this.users,
  });

  factory CourseDataDTO.fromJson(Map<String, dynamic> json) {
    return CourseDataDTO(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      level: json['level'] ?? '',
      reason: json['reason'] ?? '',
      purpose: json['purpose'] ?? '',
      otherDetails: json['other_details'] ?? '',
      defaultPrice: json['default_price'] ?? 0,
      coursePrice: json['course_price'] ?? 0,
      courseType: json['courseType'],
      sectionType: json['sectionType'],
      visible: json['visible'] ?? false,
      displayOrder: json['displayOrder'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      topics: List<TopicDTO>.from(
          json['topics']?.map((topic) => TopicDTO.fromJson(topic)) ?? []),
      users: List<UserDTO>.from(
          json['users']?.map((user) => UserDTO.fromJson(user)) ?? []),
    );
  }
}

class TopicDTO {
  final String id;
  final String courseId;
  final int orderCourse;
  final String name;
  final String? beforeTheClassNotes;
  final String? afterTheClassNotes;
  final String nameFile;
  final String? numberOfPages;
  final String description;
  final String? videoUrl;
  final String? type;
  final String createdAt;
  final String updatedAt;

  TopicDTO({
    required this.id,
    required this.courseId,
    required this.orderCourse,
    required this.name,
    required this.beforeTheClassNotes,
    required this.afterTheClassNotes,
    required this.nameFile,
    required this.numberOfPages,
    required this.description,
    required this.videoUrl,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TopicDTO.fromJson(Map<String, dynamic> json) {
    return TopicDTO(
      id: json['id'] ?? '',
      courseId: json['courseId'] ?? '',
      orderCourse: json['orderCourse'] ?? 0,
      name: json['name'] ?? '',
      beforeTheClassNotes: json['beforeTheClassNotes'] ?? '',
      afterTheClassNotes: json['afterTheClassNotes'] ?? '',
      nameFile: json['nameFile'] ?? '',
      numberOfPages: json['numberOfPages'] ?? '',
      description: json['description'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      type: json['type'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}

class UserDTO {
  final dynamic id;
  final dynamic level;
  final dynamic email;
  final dynamic google;
  final dynamic facebook;
  final dynamic apple;
  final dynamic password;
  final dynamic avatar;
  final dynamic name;
  final dynamic country;
  final dynamic phone;
  final dynamic language;
  final dynamic birthday;
  final dynamic requestPassword;
  final dynamic isActivated;
  final dynamic isPhoneActivated;
  final dynamic requireNote;
  final dynamic timezone;
  final dynamic phoneAuth;
  final dynamic isPhoneAuthActivated;
  final dynamic studySchedule;
  final dynamic canSendMessage;
  final dynamic isPublicRecord;
  final dynamic caredByStaffId;
  final dynamic zaloUserId;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic deletedAt;
  final dynamic studentGroupId;
  final TutorCourseDTO tutorCourse;

  UserDTO({
    required this.id,
    required this.level,
    required this.email,
    required this.google,
    required this.facebook,
    required this.apple,
    required this.password,
    required this.avatar,
    required this.name,
    required this.country,
    required this.phone,
    required this.language,
    required this.birthday,
    required this.requestPassword,
    required this.isActivated,
    required this.isPhoneActivated,
    required this.requireNote,
    required this.timezone,
    required this.phoneAuth,
    required this.isPhoneAuthActivated,
    required this.studySchedule,
    required this.canSendMessage,
    required this.isPublicRecord,
    required this.caredByStaffId,
    required this.zaloUserId,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.studentGroupId,
    required this.tutorCourse,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      id: json['id'] ?? '',
      level: json['level'] ?? '',
      email: json['email'] ?? '',
      google: json['google'] ?? '',
      facebook: json['facebook'] ?? '',
      apple: json['apple'] ?? '',
      password: json['password'] ?? '',
      avatar: json['avatar'] ?? '',
      name: json['name'] ?? '',
      country: json['country'] ?? '',
      phone: json['phone'] ?? '',
      language: json['language'] ?? '',
      birthday: json['birthday'] ?? '',
      requestPassword: json['requestPassword'] ?? false,
      isActivated: json['isActivated'] ?? false,
      isPhoneActivated: json['isPhoneActivated'] ?? false,
      requireNote: json['requireNote'] ?? false,
      timezone: json['timezone'] ?? 0,
      phoneAuth: json['phoneAuth'] ?? false,
      isPhoneAuthActivated: json['isPhoneAuthActivated'] ?? false,
      studySchedule: json['studySchedule'] ?? '',
      canSendMessage: json['canSendMessage'] ?? false,
      isPublicRecord: json['isPublicRecord'] ?? false,
      caredByStaffId: json['caredByStaffId'] ?? '',
      zaloUserId: json['zaloUserId'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      deletedAt: json['deletedAt'] ?? '',
      studentGroupId: json['studentGroupId'] ?? '',
      tutorCourse: TutorCourseDTO.fromJson(json['TutorCourse'] ?? {}),
    );
  }
}

class TutorCourseDTO {
  final dynamic userId;
  final dynamic courseId;
  final dynamic createdAt;
  final dynamic updatedAt;

  TutorCourseDTO({
    required this.userId,
    required this.courseId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TutorCourseDTO.fromJson(Map<String, dynamic> json) {
    return TutorCourseDTO(
      userId: json['UserId'] ?? '',
      courseId: json['CourseId'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
