class RegisterRequest {
  final String email;
  final String password;
  final dynamic source;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.source,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'source': source,
    };
  }
}

class User {
  final String id;
  final String email;
  final String name;
  final String avatar;
  final String? country;
  final String phone;
  final String? language;
  final String? birthday;
  final bool isActivated;
  final dynamic requireNote;
  final dynamic level;
  final bool isPhoneActivated;
  final dynamic timezone;
  final dynamic studySchedule;
  final bool canSendMessage;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.country,
    required this.phone,
    required this.language,
    required this.birthday,
    required this.isActivated,
    required this.requireNote,
    required this.level,
    required this.isPhoneActivated,
    required this.timezone,
    required this.studySchedule,
    required this.canSendMessage,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      avatar: json['avatar'],
      country: json['country'],
      phone: json['phone'],
      language: json['language'],
      birthday: json['birthday'],
      isActivated: json['isActivated'],
      requireNote: json['requireNote'],
      level: json['level'],
      isPhoneActivated: json['isPhoneActivated'],
      timezone: json['timezone'],
      studySchedule: json['studySchedule'],
      canSendMessage: json['canSendMessage'],
    );
  }
}

class RegisterResponse {
  final User user;
  final Map<String, dynamic> tokens;

  RegisterResponse({
    required this.user,
    required this.tokens,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      user: User.fromJson(json['user']),
      tokens: json['tokens'],
    );
  }
}

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class WalletInfo {
  final String id;
  final String userId;
  final String amount;
  final bool isBlocked;
  final String createdAt;
  final String updatedAt;
  final int bonus;

  WalletInfo({
    required this.id,
    required this.userId,
    required this.amount,
    required this.isBlocked,
    required this.createdAt,
    required this.updatedAt,
    required this.bonus,
  });

  factory WalletInfo.fromJson(Map<String, dynamic> json) {
    return WalletInfo(
      id: json['id'],
      userId: json['userId'],
      amount: json['amount'],
      isBlocked: json['isBlocked'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      bonus: json['bonus'],
    );
  }
}

class UserLogin {
  final String id;
  final String email;
  final String name;
  final String avatar;
  final String country;
  final String phone;
  final List<String> roles;
  final String language;
  final String birthday;
  final bool isActivated;
  final WalletInfo walletInfo;
  final List<dynamic> courses;
  final String requireNote;
  final String level;
  final List<dynamic> learnTopics;
  final List<dynamic> testPreparations;
  final bool isPhoneActivated;
  final int timezone;
  final String studySchedule;
  final bool canSendMessage;

  UserLogin({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.country,
    required this.phone,
    required this.roles,
    required this.language,
    required this.birthday,
    required this.isActivated,
    required this.walletInfo,
    required this.courses,
    required this.requireNote,
    required this.level,
    required this.learnTopics,
    required this.testPreparations,
    required this.isPhoneActivated,
    required this.timezone,
    required this.studySchedule,
    required this.canSendMessage,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      avatar: json['avatar'],
      country: json['country'],
      phone: json['phone'],
      roles: List<String>.from(json['roles']),
      language: json['language'],
      birthday: json['birthday'],
      isActivated: json['isActivated'],
      walletInfo: WalletInfo.fromJson(json['walletInfo']),
      courses: List<dynamic>.from(json['courses']),
      requireNote: json['requireNote'],
      level: json['level'],
      learnTopics: List<dynamic>.from(json['learnTopics']),
      testPreparations: List<dynamic>.from(json['testPreparations']),
      isPhoneActivated: json['isPhoneActivated'],
      timezone: json['timezone'],
      studySchedule: json['studySchedule'],
      canSendMessage: json['canSendMessage'],
    );
  }
}

class LoginResponse {
  final UserLogin user;
  final Map<String, dynamic> tokens;

  LoginResponse({
    required this.user,
    required this.tokens,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      user: UserLogin.fromJson(json['user']),
      tokens: json['tokens'],
    );
  }
}
