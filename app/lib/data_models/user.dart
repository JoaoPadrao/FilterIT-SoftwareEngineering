class User{
  String name;
  String email;
  String about;
  String profilePictureURL = "";
  int favouritesCount = 0;
  int ratingsCount = 0;
  int reviewsCount = 0;
  String facebookURL = "";
  String linkedinURL = "";
  String twitterURL = "";
  String instagramURL = "";

  User({
    required this.name,
    required this.email,
    required this.about,
  });

  User.m({
    required this.name,
    required this.email,
    required this.about,
    required this.profilePictureURL,
    required this.favouritesCount,
    required this.ratingsCount,
    required this.reviewsCount,
    required this.facebookURL,
    required this.linkedinURL,
    required this.twitterURL,
    required this.instagramURL,
  });

  User.d({
    this.name = "",
    this.email = "",
    this.about = "",
    this.profilePictureURL = "",
    this.favouritesCount = 0,
    this.ratingsCount = 0,
    this.reviewsCount = 0,
    this.facebookURL = "",
    this.linkedinURL = "",
    this.twitterURL = "",
    this.instagramURL = "",
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User.m(
      name: map['name'],
      email: map['email'],
      about: map['about'],
      profilePictureURL: map['profilePicURL'],
      favouritesCount: map['favouritesCount'],
      ratingsCount: map['ratingsCount'],
      reviewsCount: map['reviewsCount'],
      facebookURL: map['facebookURL'],
      linkedinURL: map['linkedInURL'],
      twitterURL: map['twitterURL'],
      instagramURL: map['instagramURL'],
    );
  }
}