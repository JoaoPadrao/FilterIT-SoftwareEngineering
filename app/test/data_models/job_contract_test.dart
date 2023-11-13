import 'package:filter_it/data_models/job_contract.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('JobContract', () {
    test('fromJson correctly initialize JobContract object', () {
      final json = {
        'id': '-1',
        'name': 'Stub Job Contract',
      };

      final jobContract = JobContract.fromJson(json);

      expect(jobContract.jobContractID, '-1');
      expect(jobContract.jobContractName, 'Stub Job Contract');
    });

    test('fromJson handle missing or invalid data', () {
      Map<String, dynamic> json = {};

      final jobContract = JobContract.fromJson(json);

      expect(jobContract.jobContractID, 'Error: Not valid JobContract');
      expect(jobContract.jobContractName, '');
    });
  });
}
