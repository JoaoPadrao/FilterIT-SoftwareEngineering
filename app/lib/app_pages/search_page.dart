import 'package:filter_it/custom_widgets/search_bar.dart';
import 'package:filter_it/custom_widgets/filters_popup.dart';
import 'package:filter_it/data_models/job_post.dart';
import 'package:filter_it/custom_widgets/small_job_post_builder.dart';
import 'package:filter_it/itjobs_api/itjobs_api.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import '../custom_widgets/navigation_drawer.dart' as nav;


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  late List<JobPost> jobPostsDisplay = [];
  List<JobPost> allJobPosts = [];
  String searchQuery = '';
  var requestBody = {
    'api_key': '74f0ed2264074636d4cc729bd22c62de',
    'limit': '20',
    'jobType': 'Unspecified',
    'language': 'Unspecified',
    'contractType': 'Unspecified',
    'location': 'Unspecified',
  };

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final jobPosts = await ITJobsAPI.fetchJobPosts(requestBody);
    setState(() {
      jobPostsDisplay = jobPosts;
      allJobPosts = jobPosts;
    });
  }

  void showFiltersPopup() async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) => FiltersPopup(
        key: const Key('filtersPopup_key'),
        jobType: requestBody['jobType']!,
        language: requestBody['language']!,
        contractType: requestBody['contractType']!,
        location: requestBody['location']!,
      ),
    );

    if(result != null) {
      setState(() {
        jobPostsDisplay = [];
        allJobPosts = [];
      });

      requestBody['jobType'] = result['jobType'];
      requestBody['language'] = result['language'];
      requestBody['contractType'] = result['contractType'];
      requestBody['location'] = result['location'];

      final jobPosts = await ITJobsAPI.fetchJobPosts(requestBody);

      setState(() {
        jobPostsDisplay = jobPosts;
        allJobPosts = jobPosts;
      });
    }
  }

  void refresh() async {
    setState(() {
      jobPostsDisplay = [];
      allJobPosts = [];
    });

    requestBody['jobType'] = 'Unspecified';
    requestBody['language'] = 'Unspecified';
    requestBody['contractType'] = 'Unspecified';
    requestBody['location'] = 'Unspecified';

    final jobPosts = await ITJobsAPI.fetchJobPosts(requestBody);
    setState(() {
      jobPostsDisplay = jobPosts;
      allJobPosts = jobPosts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('searchPage'),
        appBar: AppBar(
          title:   Text(
            'Search Page',
            style: GoogleFonts.merriweatherSans(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.orangeAccent,
        ),
      drawer: const nav.NavigationDrawer(),
      body: Column(
        children: <Widget> [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: searchBar()),
                  IconButton(
                      onPressed: refresh,
                      icon: const Icon(Icons.refresh),
                  ),
                  IconButton(
                      onPressed: showFiltersPopup,
                      icon: const Icon(Icons.filter_list),
                  ),
                ],
            ),
          ),
          Expanded(
            child: jobPostsDisplay.isEmpty
                ?  Center(
                  child: Text(
                    'No results found.',
                    style: GoogleFonts.merriweatherSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                )
                : ListView.builder(
              itemCount: jobPostsDisplay.length,
              itemBuilder: (context, index) {
                final jobPost = jobPostsDisplay[index];
                return jobPostBuilder(jobPost, index);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              jobPostsDisplay.isNotEmpty ?
              ElevatedButton(
                onPressed: () async {
                  requestBody['limit'] = (int.parse(requestBody['limit']!) + 10).toString();
                  final jobPosts = await ITJobsAPI.fetchJobPosts(requestBody);
                  setState(() {
                    allJobPosts = jobPosts;
                    jobPostsDisplay = jobPosts;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                ),
                child:  Text("Add more results",style: GoogleFonts.merriweatherSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                ),
              ) : const SizedBox(width: 0, height: 0),

              jobPostsDisplay.length > 20 ?
                  const SizedBox(width: 10, height: 0) : const SizedBox(width: 0, height: 0),

              jobPostsDisplay.length > 20 ?
              ElevatedButton(
                onPressed: () async{
                  requestBody['limit'] = (int.parse(requestBody['limit']!) - 10).toString();
                  final jobPosts = await ITJobsAPI.fetchJobPosts(requestBody);
                  setState(() {
                    allJobPosts = jobPosts;
                    jobPostsDisplay = jobPosts;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                ),
                child:  Text("See less results",style: GoogleFonts.merriweatherSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),),
              ) : const SizedBox(width: 0, height: 0),
            ],
          )
        ]
      )
    );
  }
  
  Widget searchBar() => SearchBar(
    text: searchQuery,
    hintText: "Type a job type or a company name",
    onChanged: searchJobPosts,
  );

  Widget jobPostBuilder(JobPost jobPost,int index) => SmallJobPostBuilder(
      index: index,
      jobPost: jobPost
  );

  void searchJobPosts(String query) {
    final temp = allJobPosts.where((jobPost){
      return jobPost.jobTitle.toLowerCase().contains(query.toLowerCase())
            || jobPost.company.companyName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      searchQuery = query;
      jobPostsDisplay = temp;
    });
  }
}