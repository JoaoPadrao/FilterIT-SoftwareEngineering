import 'package:filter_it/data_models/company.dart';
import 'package:filter_it/data_models/job_contract.dart';
import 'package:filter_it/data_models/job_location.dart';
import 'package:filter_it/data_models/job_type.dart';

class JobPost{
  final Company company;
  final int companyID;
  final String jobTitle;
  final String jobDescription;
  final String jobReference;
  final String jobWage;
  final List<JobType> jobTypes;
  final List<JobContract> jobContracts;
  final List<JobLocation> jobLocations;
  final String publishedDate;
  final String updatedDate;
  final String jobSlug;
  final int jobID;
  final String allowRemote;

  JobPost({
    required this.company,
    required this.companyID,
    required this.jobTitle,
    required this.jobDescription,
    required this.jobReference,
    required this.jobWage,
    required this.jobTypes,
    required this.jobContracts,
    required this.jobLocations,
    required this.publishedDate,
    required this.updatedDate,
    required this.jobSlug,
    required this.jobID,
    required this.allowRemote,
  });

  factory JobPost.fromJson(Map<String, dynamic> json) {
    List<JobType> jobTypesTemp = [];
    if (json['types'] != null) {
      jobTypesTemp = (json['types'] as List<dynamic>)
          .map((type) => JobType.fromJson(type))
          .toList();
    } else {
      jobTypesTemp = [JobType(jobTypeID: "", jobTypeName: "")];
    }

    List<JobLocation> jobLocationsTemp = [];
    if (json['locations'] != null) {
      jobLocationsTemp = (json['locations'] as List<dynamic>)
          .map((location) => JobLocation.fromJson(location))
          .toList();
    } else {
      jobLocationsTemp = [JobLocation(jobLocationID: "", jobLocationName: "")];
    }

    List<JobContract> jobContractsTemp = [];
    if (json['contracts'] != null) {
      jobContractsTemp = (json['contracts'] as List<dynamic>)
          .map((contract) => JobContract.fromJson(contract))
          .toList();
    } else {
      jobContractsTemp = [JobContract(jobContractID: "", jobContractName: "")];
    }

    return JobPost(
      company: Company.fromJson(json['company']),
      companyID: json['companyId'] ?? 0,
      jobTitle: (json['title']).toString(),
      jobDescription: (json['description']).toString(),
      jobReference: (json['reference']).toString(),
      jobWage: (json['wage']).toString(),
      jobTypes: jobTypesTemp,
      jobContracts: jobContractsTemp,
      jobLocations: jobLocationsTemp,
      publishedDate: json['publishedAt'] ?? "",
      updatedDate: json['updatedAt'] ?? "",
      jobSlug: (json['slug']).toString(),
      jobID: (json['id']),
      allowRemote: (json['allowRemote']).toString(),
    );
  }
}
