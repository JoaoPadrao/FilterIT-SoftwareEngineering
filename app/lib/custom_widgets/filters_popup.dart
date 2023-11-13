import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FiltersPopup extends StatefulWidget {
  final String jobType;
  final String language;
  final String contractType;
  final String location;
  const FiltersPopup({
    Key? key,
    required this.jobType,
    required this.language,
    required this.contractType,
    required this.location,
  }) : super(key: key);

  @override
  FiltersPopupState createState() => FiltersPopupState();
}

class FiltersPopupState extends State<FiltersPopup> {
  late String jobType = widget.jobType;
  late String language = widget.language;
  late String contractType = widget.contractType;
  late String location = widget.location;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text('Search Filters', style: GoogleFonts.merriweatherSans(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      ),
      content: SizedBox(
        height: 200,
        child: Column(
            children: <Widget>[
              Expanded(
                  child: Row(
                    children: [
                      Text('Job Type: ',style: GoogleFonts.merriweatherSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),),
                      DropdownButton<String>(
                        value: jobType,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 20,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.orangeAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            jobType = newValue!;
                          });
                        },
                        items: <String>['Unspecified', 'Full-Time', 'Part-Time']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: GoogleFonts.merriweatherSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
              ),
              Expanded(
                  child: Row(
                    children: [
                      Text('Language: ',style: GoogleFonts.merriweatherSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),),
                      DropdownButton<String>(
                        value: language,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 20,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.orangeAccent
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            language = newValue!;
                          });
                        },
                        items: <String>['Unspecified', 'Java', 'Python', 'C#', 'C++', 'C', 'JavaScript', 'PHP', 'Ruby', 'Go', 'Swift', 'Kotlin', 'R', 'Scala', 'Rust', 'Dart', 'Elixir', 'Erlang', 'Haskell', 'Julia', 'Lua', 'Objective-C', 'Perl', 'Racket', 'SQL', 'TypeScript', 'Visual Basic', 'Assembly', 'Clojure', 'COBOL', 'F#', 'Groovy', 'Lisp', 'Matlab', 'Prolog', 'Scratch', 'Smalltalk', 'VBScript', 'VHDL', 'Other']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: GoogleFonts.merriweatherSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
              ),
              Expanded(
                  child: Row(
                    children: [
                      Text('Contract: ',
                        style: GoogleFonts.merriweatherSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),),
                      DropdownButton<String>(
                        value: contractType,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 20,
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.orangeAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            contractType = newValue!;
                          });
                        },
                        items: <String>['Unspecified', 'Contrato a termo', 'Contrato sem termo', 'Estágio profissional', 'Prestação de Serviços', 'Estágio académico']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: GoogleFonts.merriweatherSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Text('Location: ',style: GoogleFonts.merriweatherSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                    DropdownButton<String>(
                      value: location,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 20,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.orangeAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          location = newValue!;
                        });
                      },
                      items: <String>['Unspecified', 'Açores', 'Aveiro', 'Beja', 'Braga', 'Bragança', 'Castelo Branco', 'Coimbra', 'Évora', 'Faro', 'Guarda', 'Leiria', 'Lisboa', 'Madeira', 'Portalegre', 'Porto', 'Santarém', 'Setúbal', 'Viana do Castelo', 'Vila Real', 'Viseu', 'Internacional']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: GoogleFonts.merriweatherSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop({
                'jobType': jobType,
                'language': language,
                'contractType': contractType,
                'location': location,
              });
            },
            child:  Text(
                'Apply Filters',style: GoogleFonts.merriweatherSans(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            ),
        ),
        TextButton(
          child:  Text('Close',style: GoogleFonts.merriweatherSans(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}