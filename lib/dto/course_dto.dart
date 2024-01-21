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
