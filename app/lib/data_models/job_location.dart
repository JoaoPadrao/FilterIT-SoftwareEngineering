class JobLocation {
  final String jobLocationID;
  final String jobLocationName;

  JobLocation({
    required this.jobLocationID,
    required this.jobLocationName,
  });

  factory JobLocation.fromJson(Map<String, dynamic> json){
    return JobLocation(
      jobLocationID: json['id'] ?? "Error: Not valid JobLocation",
      jobLocationName: json['name'] ?? "",
    );
  }
}