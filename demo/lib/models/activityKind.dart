class ActivityKind {

  final String code;

  ActivityKind({this.code});
    factory ActivityKind.fromJson(Map<String, dynamic> json) {
    return ActivityKind(
      code: json['code']
    );
    }
}