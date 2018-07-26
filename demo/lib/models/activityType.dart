class ActivityType {

  final int activityId;
  final String name;

  ActivityType({this.activityId,this.name});
    factory ActivityType.fromJson(Map<String, dynamic> json) {
    return ActivityType(
      activityId: json['activityId'],
      name: json['name']
    );
    }
}