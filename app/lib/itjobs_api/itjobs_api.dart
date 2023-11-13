import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:filter_it/data_models/job_post.dart';

class ITJobsAPI {
  static Future<List<JobPost>> fetchJobPosts(Map<String, String> body) async {
    Map<String, dynamic> finalBody = {};
    String query = '';
    for(var key in body.keys){
      if(key == 'api_key'){
        finalBody[key] = body[key];
      }

      else if(key == 'jobType' && body[key] != 'Unspecified'){
        switch(body[key]){
          case 'Full-Time':
            finalBody['type'] = '1';
            break;
          case 'Part-Time':
            finalBody['type'] = '2';
            break;
          default:
            break;
        }
      }

      else if(key == 'contractType' && body[key] != 'Unspecified'){
        switch(body[key]){
          case 'Estágio Académico':
            finalBody['contract'] = '5';
            break;
          case 'Prestação de Serviços':
            finalBody['contract'] = '4';
            break;
          case 'Estágio Profissional':
            finalBody['contract'] = '3';
            break;
          case 'Contrato sem termo':
            finalBody['contract'] = '2';
            break;
          case 'Contrato a termo':
            finalBody['contract'] = '1';
            break;
          default:
            break;
        }
      }

      else if(key == 'location' && body[key] != "Unspecified"){
        switch(body[key]){
          case 'Aveiro':
            finalBody['location'] = '1';
            break;
          case 'Beja':
            finalBody['location'] = '3';
            break;
          case 'Braga':
            finalBody['location'] = '4';
            break;
          case 'Bragança':
            finalBody['location'] = '5';
            break;
          case 'Castelo Branco':
            finalBody['location'] = '6';
            break;
          case 'Coimbra':
            finalBody['location'] = '8';
            break;
          case 'Évora':
            finalBody['location'] = '10';
            break;
          case 'Faro':
            finalBody['location'] = '9';
            break;
          case 'Guarda':
            finalBody['location'] = '11';
            break;
          case 'Leiria':
            finalBody['location'] = '13';
            break;
          case 'Lisboa':
            finalBody['location'] = '14';
            break;
          case 'Portalegre':
            finalBody['location'] = '12';
            break;
          case 'Porto':
            finalBody['location'] = '18';
            break;
          case 'Santarém':
            finalBody['location'] = '20';
            break;
          case 'Setúbal':
            finalBody['location'] = '17';
            break;
          case 'Viana do Castelo':
            finalBody['location'] = '22';
            break;
          case 'Vila Real':
            finalBody['location'] = '21';
            break;
          case 'Viseu':
            finalBody['location'] = '16';
            break;
          case 'Açores':
            finalBody['location'] = '2';
            break;
          case 'Madeira':
            finalBody['location'] = '15';
            break;
          case 'Internacional':
            finalBody['location'] = '29';
            break;
          default:
            break;
        }
      }

      else if(body[key] != 'Unspecified' && key != 'limit'){
        if(query.isEmpty){
          query += body[key].toString().toLowerCase();
        }
        else{
          query += ',${body[key].toString().toLowerCase()}';
        }
      }
    }

    if(query.isNotEmpty){
      finalBody['q'] = query;
    }

    if(body['limit'] != "Unspecified"){
      finalBody['limit'] = body['limit'];
    }

    final response = await http.post(Uri.parse('https://api.itjobs.pt/job/list.json'), body: finalBody);

    if (response.statusCode == 200) {
      final Map<String, dynamic> preFetch = json.decode(response.body);
      List jobPostsJson = [];
      if(preFetch["results"] == null){
        jobPostsJson = [];
      }
      else {
        jobPostsJson = preFetch["results"];
      }

      if(jobPostsJson.isEmpty){
        throw Exception("jobPostsJson is empty");
      }

      List<JobPost> finalList =  jobPostsJson.map((jobPostJson) => JobPost.fromJson(jobPostJson)).toList();

      return finalList;
    }

    else {
      throw Exception('Failed to load job posts');
    }
  }
}

