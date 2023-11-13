import 'package:filter_it/custom_widgets/review_builder.dart';
import 'package:filter_it/data_models/job_post.dart';
import 'package:filter_it/data_models/review_service.dart';
import 'package:filter_it/app_pages/favorites_page.dart';
import 'package:filter_it/custom_widgets/favorites_list.dart';
import 'package:filter_it/custom_widgets/small_fav_post_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:core';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data_models/job_type.dart';
import '../data_models/review.dart';

class BigJobPostBuilder extends StatefulWidget{
  final JobPost jobPost;
  const BigJobPostBuilder({
    Key? key,
    required this.jobPost,
  }) : super(key: key);

  @override
  State<BigJobPostBuilder> createState() => _BigJobPostBuilderState();
}

class _BigJobPostBuilderState extends State<BigJobPostBuilder> {
  
  bool isFavorited= false;

  @override
  void initState(){
    super.initState();
    isFavorited = FavoritesList.isFavPost(widget.jobPost);
  }

  @override
  Widget build(BuildContext context){
    final reviewService = ReviewService();
    String companyNumber = widget.jobPost.company.companyPhoneNumber;
    String companyEmail = widget.jobPost.company.companyEmail;
    String companyAddress = widget.jobPost.company.companyAddress;
    String companyContacts = "Phone number: ${companyNumber == "null" ? "No phone number specified" : companyNumber}\n"
        "Email: ${companyEmail == "null" ? "No email specified" : companyEmail}\n"
        "Address: ${companyAddress == "null" ? "No address specified" : companyAddress}";
    String companyDesc = widget.jobPost.company.companyDescription;
    String jobTypes = "No job types specified";

    if(widget.jobPost.jobTypes.isNotEmpty){
      jobTypes = "";
      for(JobType jobType in widget.jobPost.jobTypes){
        jobTypes += "${jobType.jobTypeName}, ";
      }
      //erase last comma
      jobTypes = jobTypes.substring(0, jobTypes.length - 2);
    }

    return Scaffold(
      key: const Key('jobDetailPage'),
      appBar: AppBar(
        title: Text(widget.jobPost.jobTitle),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 30),
        physics: const BouncingScrollPhysics(),
        children: [
          Image.network(
            widget.jobPost.company.logoURL,
            width: MediaQuery.of(context).size.width * 0.15,
            height: MediaQuery.of(context).size.width * 0.15,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Company Name",
               textAlign: TextAlign.left,
               style: GoogleFonts.merriweatherSans(
                 fontWeight: FontWeight.bold,
                 fontSize: 20,
               ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                widget.jobPost.company.companyName,
                textAlign: TextAlign.left,
                style: const TextStyle(
                fontSize: 18,
              ),
            )
          ),
          const SizedBox(height: 10),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Job Position",
              textAlign: TextAlign.left,
              style: GoogleFonts.merriweatherSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                widget.jobPost.jobTitle,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
          ),
          const SizedBox(height: 10),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Job Type(s)",
              textAlign: TextAlign.left,
              style: GoogleFonts.merriweatherSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                alignment: Alignment.topLeft,
                child: Scrollable(
                  axisDirection: AxisDirection.right,
                  viewportBuilder: (BuildContext context, ViewportOffset position){
                    return Row(
                      children: [
                        Text(
                          jobTypes,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
          ),
          const SizedBox(height: 10),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Remote Work Available?",
              textAlign: TextAlign.left,
              style: GoogleFonts.merriweatherSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                widget.jobPost.allowRemote == "true" ? "Yes" : "No",
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Job Description",
              textAlign: TextAlign.left,
              style: GoogleFonts.merriweatherSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ReadMoreText(
                widget.jobPost.jobDescription == "null" ? "No job description specified" : widget.jobPost.jobDescription,
                trimLines: 3,
                colorClickableText: Colors.orangeAccent,
                trimMode: TrimMode.Line,
                trimCollapsedText: '...Show more',
                trimExpandedText: ' show less',
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Job Wage",
              textAlign: TextAlign.left,
              style: GoogleFonts.merriweatherSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                widget.jobPost.jobWage == "null" ? "No job wage specified" : widget.jobPost.jobWage,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Company Description",
              textAlign: TextAlign.left,
              style: GoogleFonts.merriweatherSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ReadMoreText(
                companyDesc == "null" ? "No company description specified" : companyDesc,
                trimLines: 3,
                colorClickableText: Colors.orangeAccent,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Show less',
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Contacts",
              textAlign: TextAlign.left,
              style: GoogleFonts.merriweatherSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ReadMoreText(
                companyContacts == "null" ? "No contacts specified" : companyContacts,
                trimLines: 3,
                colorClickableText: Colors.orangeAccent,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Show less',
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Company Socials",
              textAlign: TextAlign.left,
              style: GoogleFonts.merriweatherSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Row(
              //position them on the left
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: (widget.jobPost.company.urlFacebook == "null") ? Colors.grey : Colors.blue,
                  ),
                  onPressed: (widget.jobPost.company.urlFacebook == "null") ? null : () {_launchURL(widget.jobPost.company.urlFacebook);},
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.twitter,
                    color: (widget.jobPost.company.urlTwitter == "null") ? Colors.grey : Colors.blue,
                  ),
                  onPressed: (widget.jobPost.company.urlTwitter == "null") ? null : () {_launchURL(widget.jobPost.company.urlTwitter);},
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: (widget.jobPost.company.urlLinkedin == "null") ? Colors.grey : Colors.blue,
                  ),
                  onPressed: (widget.jobPost.company.urlLinkedin == "null") ? null : () {_launchURL(widget.jobPost.company.urlLinkedin);},
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black,
            endIndent: 20,
            indent: 20,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Average Rating",
              textAlign: TextAlign.left,
              style: GoogleFonts.merriweatherSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: StreamBuilder<double>(
              stream: reviewService.getJobAverageRatingStream(widget.jobPost.jobID),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  double averageRating = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0 ),
                    child: Text(
                      "${averageRating.toStringAsFixed(1)} / 5 ★",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.merriweatherSans(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontSize: 20,
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Latest Review",
              textAlign: TextAlign.left,
              style: GoogleFonts.merriweatherSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 80,
              child: StreamBuilder<List<Review>>(
                stream: reviewService.getJobReviewsStream(widget.jobPost.jobID),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: Text(
                            "No reviews yet. Be the first to write one!",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        )
                    );
                  }

                  final reviews = snapshot.data!;
                  reviews.sort((a, b) => b.timestamp.compareTo(a.timestamp));

                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      final review = snapshot.data![index];
                      return Card(
                        elevation: 5,
                        child: ListTile(
                          title: Text(
                            review.comment,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(DateFormat('dd-MM-yyyy HH:mm:ss').format(review.timestamp.toDate())),
                          trailing: Text(
                            '${review.rating}/5 ★',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFFCB45),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  key: const Key('seeMoreReviews_key'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReviewBuilder(jobID: widget.jobPost.jobID),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child:  Text(
                      'See more reviews',
                    style: GoogleFonts.merriweatherSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  ),
                ),
                IconButton(
                    onPressed: (){
                      setState(() {
                        if(isFavorited){
                          isFavorited = false;
                          FavoritesList.removeFavPost(widget.jobPost);
                        } else {
                          isFavorited = true;
                          FavoritesList.addFavPost(widget.jobPost);
                        }
                      });
                    },
                    icon: Icon(
                      (isFavorited || FavoritesList.isFavPost(widget.jobPost)) ? Icons.favorite : Icons.favorite_border,
                      color:  isFavorited ? Colors.red : null,
                    ),
                ),
              ],
            ),
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