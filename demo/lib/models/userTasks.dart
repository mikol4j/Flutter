class UserTasks {
  final int userId;
  final int projectId;
  final String projectName;
  final int subProjectId;
  final String subProjectName;

  UserTasks({this.userId, this.projectId, this.projectName, this.subProjectId, this.subProjectName});
    factory UserTasks.fromJson(Map<String, dynamic> json) {
    return UserTasks(
      userId: json['userId'],
      projectId: json['projectId'],
      projectName: json['projectName'],
      subProjectId: json['subProjectId'],
      subProjectName: json['subProjectName'],
    );
    }
}