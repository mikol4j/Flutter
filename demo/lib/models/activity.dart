class Activity {
  int id;
  int userId;
  int projectId;
  int subProjectId;
  int activityTypeId;
  String date;
  double totalTime;
  String comment;
  String activityKind;

  Activity({this.id, this.userId, this.projectId, this.subProjectId, this.activityTypeId,this.date, this.totalTime, this.comment, this.activityKind});
    factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'],
      userId: json['userId'],
      projectId: json['projectId'],
      subProjectId: json['subProjectId'],
      activityTypeId: json['activityTypeId'],
      date: json['date'],
      totalTime: json['totalTime'],
      comment: json['comment'],
      activityKind: json['activityKind'],
    );
    }
}