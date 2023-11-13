class Company {
  final String companyID;
  final String companyName;
  final String logoURL;
  final String companyDescription;
  final String companyAddress;
  final String companyPhoneNumber;
  final String companyFax;
  final String companyEmail;
  final String companyURL;
  final String companySlug;
  final String urlTwitter;
  final String urlFacebook;
  final String urlLinkedin;

  Company({
    required this.companyID,
    required this.companyName,
    required this.logoURL,
    required this.companyDescription,
    required this.companyAddress,
    required this.companyPhoneNumber,
    required this.companyFax,
    required this.companyEmail,
    required this.companyURL,
    required this.companySlug,
    required this.urlTwitter,
    required this.urlFacebook,
    required this.urlLinkedin,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      companyID: (json['id']).toString(),
      companyName: (json['name']).toString(),
      logoURL: (json['logo']).toString(),
      companyDescription: (json['description']).toString(),
      companyAddress: (json['address']).toString(),
      companyPhoneNumber: (json['phone']).toString(),
      companyFax: (json['fax']).toString(),
      companyEmail: (json['email']).toString(),
      companyURL: (json['url']).toString(),
      companySlug: (json['slug']).toString(),
      urlTwitter: (json['url_twitter']).toString(),
      urlFacebook: (json['url_facebook']).toString(),
      urlLinkedin: (json['url_linkedin']).toString(),
    );
  }
}