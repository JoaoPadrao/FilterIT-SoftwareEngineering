import 'package:filter_it/data_models/job_location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('JobLocation', () {
    test('fromJson correctly initialize JobLocation object', () {
      final json = {
        'id': '-1',
        'name': 'Stub Job Location',
      };

      final jobLocation = JobLocation.fromJson(json);

      expect(jobLocation.jobLocationID, '-1');
      expect(jobLocation.jobLocationName, 'Stub Job Location');
    });

    test('fromJson handle missing or invalid data', () {
      Map<String, dynamic> json = {};

      final jobLocation = JobLocation.fromJson(json);

      expect(jobLocation.jobLocationID, 'Error: Not valid JobLocation');
      expect(jobLocation.jobLocationName, '');
    });
  });
}
