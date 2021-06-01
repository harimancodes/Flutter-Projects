import 'package:flutter/material.dart';
import 'package:photo_measurement_app/model/Measurement.dart';

class MeasurementScreen extends StatefulWidget {
  Measurement _measurements;
  MeasurementScreen(this._measurements);
  @override
  _MeasurementScreenState createState() =>
      _MeasurementScreenState(this._measurements);
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  Measurement _measurements;

  _MeasurementScreenState(this._measurements);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.10),
            ElevatedButton(
              child: Text("Take Measurement Again"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView(
                children: [
                  getListCard("Neck", _measurements.d?.neck),
                  getListCard("Height", _measurements.d?.height),
                  getListCard("Weight", _measurements.d?.weight),
                  getListCard("Belly", _measurements.d?.belly),
                  getListCard("Chest", _measurements.d?.chest),
                  getListCard("Wrist", _measurements.d?.wrist),
                  getListCard("Arm Length", _measurements.d?.armLength),
                  getListCard("Thigh", _measurements.d?.thigh),
                  getListCard("Shoulder", _measurements.d?.shoulder),
                  getListCard("Hips", _measurements.d?.hips),
                  getListCard("Ankle", _measurements.d?.ankle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getListCard(String title, String? value) {
    return Card(
      color: Colors.white,
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: ListTile(
          trailing: Text(value!),
          leading: Text(title),
        ),
      ),
    );
  }
}
