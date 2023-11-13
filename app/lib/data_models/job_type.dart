class JobType {
  final String jobTypeID;
  final String jobTypeName;

  JobType({
    required this.jobTypeID,
    required this.jobTypeName,
  });

  factory JobType.fromJson(Map<String, dynamic> json) {
    return JobType(
      jobTypeID: json['id'] ?? "Error: Not valid JobType",
      jobTypeName: json['name'] ?? "",
    );
  }
}