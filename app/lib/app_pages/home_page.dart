import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../custom_widgets/navigation_drawer.dart' as nav;
import 'package:google_fonts/google_fonts.dart';
import '../data_models/job_post.dart';
import '../itjobs_api/itjobs_api.dart';
import '../custom_widgets/big_job_post_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Marker> markers = <Marker>[];

  final currentDate = DateTime.now();

  var requestBody = {
    'api_key': '74f0ed2264074636d4cc729bd22c62de',
    'limit': '100',
    'jobType': 'Unspecified',
    'language': 'Unspecified',
    'contractType': 'Unspecified',
    'location': 'Unspecified',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('homePage'),
      appBar: AppBar(
        title:   Text(
        'Home Page',
        style: GoogleFonts.merriweatherSans(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: const nav.NavigationDrawer(),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(41.150766, -8.610537),
              zoom: 10,
            ),
            cameraTargetBounds: CameraTargetBounds(
              LatLngBounds(
                southwest: const LatLng(32.155561, -32.240317),
                northeast: const LatLng(42.165909, -6.125619),
              ),
            ),
            markers: Set.from(markers),
          ),
          Positioned(
            top: 10,
            right: 60,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: MediaQuery.of(context).size.width * 0.83,
              child: Row(
                children: [
                  Text(
                    'Job Location:',
                    style: GoogleFonts.merriweatherSans(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 20),
                  DropdownButton(
                    key: const Key('locationDropdown'),
                    value: requestBody['location'],
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    items: <String>['Unspecified', 'Açores', 'Aveiro', 'Beja', 'Braga', 'Bragança', 'Castelo Branco', 'Coimbra', 'Évora', 'Faro', 'Guarda', 'Leiria', 'Lisboa', 'Madeira', 'Portalegre', 'Porto', 'Santarém', 'Setúbal', 'Viana do Castelo', 'Vila Real', 'Viseu', 'Internacional']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.merriweatherSans(
                            color: Colors.black,
                            fontSize: 19,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        requestBody['location'] = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            key: const Key('searchButton'),
            top: 12,
            right: 0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: Colors.white,
                shape: const CircleBorder(),
              ),
              child: const Icon(Icons.search, color: Colors.black,),
              onPressed: () async {
                final jobPosts = await ITJobsAPI.fetchJobPosts(requestBody);
                setState(() {
                  markers.clear();
                  _createMarkers(jobPosts);
                });
              },
            )
          ),
        ],
      ),
    );
  }

  void _createMarkers(List<JobPost> jobPosts) async {
    for (final jobPost in jobPosts) {
      if(jobPost.company.companyAddress.contains(requestBody['location']!)){
        final response = await http.post(Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?address=${jobPost.company.companyAddress}&key=AIzaSyD0dD7pIUJM_B6yXZKMWuknUiaKGm8z-Hw'));
        Map<String, dynamic> body = json.decode(response.body);
        if(body["status"] == "OK"){
          var lat = body["results"][0]["geometry"]["location"]["lat"];
          var lng = body["results"][0]["geometry"]["location"]["lng"];
          final marker = Marker(
            markerId: MarkerId(jobPost.jobID.toString()),
            position: LatLng(lat, lng),
            infoWindow: InfoWindow(
              title: jobPost.jobTitle,
              snippet: jobPost.company.companyName,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BigJobPostBuilder(jobPost: jobPost),
                  ),
                );
              },
            ),
          );
          setState(() {
            markers.add(marker);
          });
        }
      }
      else {
        continue;
      }
    }
    sleep(const Duration(seconds: 1));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          key: const Key('snackBarText'),
          '${markers.length} job posts found!',
          style: GoogleFonts.merriweatherSans(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        duration: const Duration(seconds: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.white,
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}