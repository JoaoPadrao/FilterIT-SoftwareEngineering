import 'package:filter_it/data_models/company.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Company', () {
    test('fromJson should correctly initialize Company object', () {
      final json = {
        'id': '1',
        'name': 'Stub name',
        'logo': 'https://example.com/Stublogo.png',
        'description': 'Stub description',
        'address': 'Stub address',
        'phone': '1234567890',
        'fax': '0987654321',
        'email': 'Stub@example.com',
        'url': 'https://Stuburl.com',
        'slug': 'Stub-company',
        'url_twitter': 'https://twitter.com/Stub',
        'url_facebook': 'https://facebook.com/Stub',
        'url_linkedin': 'https://linkedin.com/Stub',
      };

      final company = Company.fromJson(json);

      expect(company.companyID, '1');
      expect(company.companyName, 'Stub name');
      expect(company.logoURL, 'https://example.com/Stublogo.png');
      expect(company.companyDescription, 'Stub description');
      expect(company.companyAddress, 'Stub address');
      expect(company.companyPhoneNumber, '1234567890');
      expect(company.companyFax, '0987654321');
      expect(company.companyEmail, 'Stub@example.com');
      expect(company.companyURL, 'https://Stuburl.com');
      expect(company.companySlug, 'Stub-company');
      expect(company.urlTwitter, 'https://twitter.com/Stub');
      expect(company.urlFacebook, 'https://facebook.com/Stub');
      expect(company.urlLinkedin, 'https://linkedin.com/Stub');
    });
  });
}
