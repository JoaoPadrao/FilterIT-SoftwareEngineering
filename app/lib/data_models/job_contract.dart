class JobContract{
  final String jobContractID;
  final String jobContractName;

  JobContract({
    required this.jobContractID,
    required this.jobContractName,
  });

  factory JobContract.fromJson(Map<String, dynamic> json) {
    return JobContract(
      jobContractID: json['id'] ?? "Error: Not valid JobContract",
      jobContractName: json['name'] ?? "",
    );
  }
}