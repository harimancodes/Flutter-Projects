
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_measurement_app/model/Measurement.dart';
import 'package:photo_measurement_app/screens/measurement_screen.dart';
import 'package:http/http.dart' as http;

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  PickedFile? _image;
  String? _uploadedFileURL;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text("Upload Image"),
            onPressed: () {
              chooseFile()
                  .whenComplete(() => uploadFile().whenComplete(() async {
                        if (_image == null) {
                          final snackBar = SnackBar(
                              content: Text(
                            "Please select an image!",
                            textAlign: TextAlign.center,
                          ));

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                         
                          var url = Uri.parse(
                              "https://backend-test-zypher.herokuapp.com/uploadImageforMeasurement");
                          var response = await http.post(url,
                              body: {'imageURL': _uploadedFileURL.toString()});
                          print("Response body : ${response.body}");

                          if (200 == response.statusCode) {
                            final Measurement measurements =
                                measurementFromJson(response.body);

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MeasurementScreen(measurements)));
                          } else {
                            final snackBar = SnackBar(
                                content: Text(
                              "Something went wrong! Please try again.",
                              textAlign: TextAlign.center,
                            ));

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      }));
            },
          ),
        ),
      ),
    );
  }

  Future chooseFile() async {
    final picker = ImagePicker();
    final result =
        await picker.getImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
      });
      if(_image!=null) showLoaderDialog(context);
    });
  }

  Future uploadFile() async {
    File file = File(_image!.path);
    var snapshot = await FirebaseStorage.instance
        .ref()
        .child("folder/${file.path}")
        .putFile(file)
        .whenComplete(() => null);
    var url = await snapshot.ref.getDownloadURL();
    print("file = $file \n url =$url \n sanpshot=${snapshot.toString()}");
    setState(() {
      _uploadedFileURL = url;
    });
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
