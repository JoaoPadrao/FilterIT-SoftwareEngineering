import 'package:flutter_test/flutter_test.dart';
import 'package:filter_it/data_models/job_type.dart';

void main() {
  group('JobType', () {
    test('fromJson correctly initialize JobType object', () {
      final json = {
        'id': '1',
        'name': 'Type 1',
      };

      final jobType = JobType.fromJson(json);

      expect(jobType.jobTypeID, equals('1'));
      expect(jobType.jobTypeName, equals('Type 1'));
    });

    test('fromJson handle missing or invalid data', () {
      Map<String, dynamic> json = {};

      final jobType = JobType.fromJson(json);

      expect(jobType.jobTypeID, equals('Error: Not valid JobType'));
      expect(jobType.jobTypeName, equals(''));
    });
  });
}
