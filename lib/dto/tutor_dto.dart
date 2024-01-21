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
