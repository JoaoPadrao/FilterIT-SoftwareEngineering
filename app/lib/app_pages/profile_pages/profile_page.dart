import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../custom_widgets/navigation_drawer.dart' as nav;
import '../../custom_widgets/profile_image.dart';
import '../../data_models/review_service.dart';
import '../../data_models/user.dart';
import '../../custom_widgets/rounded_button.dart';
import 'edit_profile_page.dart';
import '../../custom_widgets/favorites_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final String? userEmail = auth.FirebaseAuth.instance.currentUser?.email;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late User user;

  Stream<User> generateUser() {
    return _db.collection('user_profiles').where('email', isEqualTo: userEmail).snapshots().map((querySnapshot){
      if (querySnapshot.size == 0) {
        return user;
      }
      return querySnapshot.docs.map((doc) => User.fromMap(doc.data())).first;
    });
  }

  @override
  Widget build(BuildContext context){

    return StreamBuilder<User>(
      stream: generateUser(),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return Scaffold(
              appBar: AppBar(
                title: const Text("Profile"),
                backgroundColor: Colors.orangeAccent,
              ),
              drawer: const nav.NavigationDrawer(),
              body: const Center(
                child: CircularProgressIndicator()
              ),
          );
        }
        else{
          user = snapshot.data!;
          return Scaffold(
              appBar: AppBar(
                title: const Text("Profile"),
                backgroundColor: Colors.orangeAccent,
              ),
              drawer: const nav.NavigationDrawer(),
              body: ListView(
                padding: const EdgeInsets.only(top: 30),
                physics: const BouncingScrollPhysics(),
                children: [
                  ProfileImage(
                    profilePictureURL: user.profilePictureURL,
                  ),
                  const SizedBox(height: 24),
                  buildName(user),
                  const SizedBox(height: 24),
                  buildUserStats(user),
                  const SizedBox(height: 24),
                  buildAboutUser(user),
                  const SizedBox(height: 24),
                  buildSocials(user),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: buildEditButton()
                  ),
                ],
              )
          );
        }
      }
    );
  }

  Widget buildName(User user){
    return Column(
      children: [
        Text(
          key: const Key('profile_name_key'),
          user.name,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          user.email,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget buildEditButton(){
    return RoundedButton(
      key: const Key('edit_profile_key'),
      text: "Edit Profile",
      onPressed:(){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditProfile(user: user),
          ),
        );
      },
    );
  }

  Widget buildUserStats(User user){
    final reviewService = ReviewService();
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildStatColumn(context, "Favourites", FavoritesList.favPostsDisplay.length.toString()),
          verticalDivider(),
          StreamBuilder<int>(
            stream: reviewService.getUserRatingCountStream(user.email),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData) {
                return buildStatColumn(context, "Ratings", snapshot.data.toString());
              } else {
                return buildStatColumn(context, "Ratings", "0");
              }
            },
          ),
          verticalDivider(),
          StreamBuilder<int>(
            stream: reviewService.getUserReviewsCountStream(user.email),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasData) {
                return buildStatColumn(context, "Reviews", snapshot.data.toString());
              } else {
                return buildStatColumn(context, "Reviews", "0");
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildStatColumn(BuildContext context, String label, String count){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            count,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black54
            ),
          ),
        ],
      ),
    );
  }

  Widget verticalDivider(){
    return const SizedBox(
      height: 28,
      child: VerticalDivider(
        color: Colors.black,
        thickness: 1,
      ),
    );
  }

  Widget buildAboutUser(User user){
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "About me",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 120,
              child: SingleChildScrollView(
                child: Text(
                  user.about,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget buildSocials(User user){
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Socials",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: (user.facebookURL == "") ? Colors.grey : Colors.blue,
                ),
                onPressed: (user.facebookURL == "") ? null : () {_launchURL(user.facebookURL);},
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.twitter,
                  color: (user.twitterURL == "") ? Colors.grey : Colors.blue,
                ),
                onPressed: (user.twitterURL == "") ? null : () {_launchURL(user.twitterURL);},
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: (user.linkedinURL == "") ? Colors.grey : Colors.blue,
                ),
                onPressed: (user.linkedinURL == "") ? null : () {_launchURL(user.linkedinURL);},
              ),
              const SizedBox(width: 10),
              IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: (user.instagramURL == "") ? Colors.grey : Colors.blue,
                ),
                onPressed: (user.instagramURL == "") ? null : () {_launchURL(user.instagramURL);}
              ),
            ],
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    final uri = Uri.parse(url);
    await launchUrl(uri);
  }
}