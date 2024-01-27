import 'dart:ui';

import 'package:syncfusion_flutter_calendar/calendar.dart';

class TutorRequest {
  final int perPage;
  final int numPage;
  final String accessToken;

  TutorRequest({
    required this.perPage,
    required this.numPage,
    required this.accessToken,
  });

  Map<String, dynamic> toQueryParameters() {
    return {
      'perPage': perPage.toString(),
      'page': numPage.toString(),
    };
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  Meeting(this.scheduleId, this.eventName, this.from, this.to, this.background,
      this.isAllDay);

  String scheduleId;
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay = false;
}

class ReviewDto {
  String bookingId;
  String userId;
  double rating;
  String content;

  ReviewDto({
    required this.bookingId,
    required this.userId,
    required this.rating,
    required this.content,
  });

  factory ReviewDto.fromJson(Map<String, dynamic> json) {
    return ReviewDto(
      bookingId: json['bookingId'],
      userId: json['userId'],
      rating: json['rating'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'userId': userId,
      'rating': rating,
      'content': content,
    };
  }
}
