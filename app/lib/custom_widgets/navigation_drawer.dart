import 'package:filter_it/authentication/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../authentication/auth_page.dart';
import '../app_pages/home_page.dart';
import '../app_pages/favorites_page.dart';
import '../app_pages/help_page.dart';
import '../app_pages/search_page.dart';
import '../app_pages/profile_pages/profile_page.dart';
import '../authentication/main_page.dart';
import 'package:google_fonts/google_fonts.dart';


class NavigationDrawer extends StatelessWidget{
    const NavigationDrawer({Key? key}) : super(key: key);

  Widget buildHeader(BuildContext context){
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
    );
  }

  Widget buildItems(BuildContext context){
    return Wrap(
      runSpacing: 10,
      children: [
        ListTile(
          key: const Key('home_key'),
          leading: const Icon(Icons.home),
          title: Text("Home Page",style: GoogleFonts.merriweatherSans(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          ),
          onTap: () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomePage()
              )),
        ),
        ListTile(
          key: const Key('search_key'),
          leading: const Icon(Icons.search),
          title: Text("Search Page",style: GoogleFonts.merriweatherSans(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SearchPage(),
            ));
          },
        ),
        ListTile(
          key: const Key('favorites_key'),
          leading: const Icon(Icons.favorite),
          title: Text("Favorites",style: GoogleFonts.merriweatherSans(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const FavoritesPage(),
            ));
          },
        ),

        const Divider(
          color: Colors.black,
          indent: 10,
          endIndent: 10,
        ),

        ListTile(
          key: const Key('profile_key'),
          leading: const Icon(Icons.person),
          title: Text("Profile",style: GoogleFonts.merriweatherSans(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProfilePage(),
            ));
          },
        ),

        ListTile(
            key: const Key('help_key'),
            leading: const Icon(Icons.question_mark_rounded),
            title: Text("Help Page",style: GoogleFonts.merriweatherSans(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HelpPage()
              ));
            }
        ),

        ListTile(
          key: const Key('logout_key'),
          leading: const Icon(Icons.arrow_back),
          title :Text("Sign Out",style: GoogleFonts.merriweatherSans(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),),
          onTap: ()  {
            FirebaseAuth.instance.signOut();
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const MainPage()
            ));
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildItems(context)
          ],
        ),
      ),
    );
  }
}