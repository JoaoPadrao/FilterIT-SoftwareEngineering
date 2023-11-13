import 'package:flutter/material.dart';

import '../custom_widgets/navigation_drawer.dart' as nav;
import 'package:google_fonts/google_fonts.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('helpPage'),
      appBar: AppBar(
        title:   Text(
          'Help Page',
          style: GoogleFonts.merriweatherSans(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: const nav.NavigationDrawer(),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome to the FilterIT support!",
                style: GoogleFonts.merriweatherSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    "How to use the home page:",
                    style: GoogleFonts.merriweatherSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "- Choose a city and press the magnifying glass icon to see the pinpointed location of that city job offers.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "- After choosing a city the number of job offers available also is shown on the bottom of the page.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    "How to use the search page:",
                    style: GoogleFonts.merriweatherSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "- Scroll down to browse through the job offers.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "- The job offers can be filtered by using the icon in the top right corner of the screen or you can search for them using the text box.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "- More results are shown if the button 'Add more results' is pressed. The arrow next to the filter button.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "- The arrow next to the filter button refreshes the search page.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "- By clicking a job offer, it's information will be shown.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    "How to use the job offer information page:",
                    style: GoogleFonts.merriweatherSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "- It is possible to select job offers as favourites by clicking on the heart icon that is at the end of the job offer information page.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "- The company name and description, the job position, type, wage and description and the company socials and contacts are shown.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "- Every review is shown by pressing the 'See more reviews' button at the bottom of the page.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "- In the review page, it is possible to left a review by choosing the number of stars and/or writing a comment before clicking the 'Submit Review' button.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "- The average rating has into account every single rating left by the users.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How to use the favourites:",
                    style: GoogleFonts.merriweatherSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "- The job offers that are selected as favourites in the search page appear in the favourite page.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "- Each job offer, that has been selected favourite, information is available in this page.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "- It is possible to remove a job offer from the favourites page by clicking on the trash can icon.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How to use the profile:",
                    style: GoogleFonts.merriweatherSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "- The user profile image, username, email, description and social links are shown as well as the number of favourites, ratings and reviews.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "- By pressing the 'Edit Profile' button, the user is able to change their image, name, email, description and social links.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
              const SizedBox(height: 30),
               Text(
                "If you have any further questions or need assistance, please feel free to reach out to our support team. We're here to help!",
                style: GoogleFonts.merriweatherSans(
                  fontSize: 15,
                  fontStyle: FontStyle.italic
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







































































