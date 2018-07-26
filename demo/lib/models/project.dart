class Project {

  final int projectId;
  final String projectName;


  Project({this.projectId, this.projectName});
    factory Project.fromJson(Map<String, dynamic> json) {
    return Project(

      projectId: json['projectId'],
      projectName: json['projectName']
    );
    }
}