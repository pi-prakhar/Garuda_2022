import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class TestPage extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    // readData();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff04c4c4),
        title: Text(
          'GARUDA',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
                stream: databaseReference.child('cctv_data/CCTV_1').onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data.snapshot.value;
                    if (data["detected"] == true) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "CCTV_1",
                                style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Center(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.video_camera_back),
                                  SizedBox(width: 10.0),
                                  GestureDetector(
                                      onTap: (() {}),
                                      child: Text("See Live video Feed"))
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Center(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.location_on),
                                  SizedBox(width: 10.0),
                                  Text("See Live Location")
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Image.asset('assets/drone.jpg'),
                            SizedBox(
                              height: 40.0,
                            ),
                            Text("Live Status",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500)),
                            Text(
                              "Receeding",
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Divider(
                              height: 0.5,
                              thickness: 2.0,
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text("Time",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500)),
                            Text(
                              "4:37pm",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "All Good",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ]);
                    }
                  }

                  return Container(
                    height: 0,
                    width: 0,
                  );
                })
            // RaisedButton(
            //   child: Text('Create Data'),
            //   color: Colors.redAccent,
            //   onPressed: () {
            //     createData();
            //   },
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(20))),
            // ),
            // SizedBox(
            //   height: 8,
            // ),
            // RaisedButton(
            //   child: Text('Read/View Data'),
            //   color: Colors.redAccent,
            //   onPressed: () {
            //     readData();
            //   },
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(20))),
            // ),
            // SizedBox(
            //   height: 8,
            // ),
            // RaisedButton(
            //   child: Text('Update Data'),
            //   color: Colors.redAccent,
            //   onPressed: () {
            //     updateData();
            //   },
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(20))),
            // ),
            // SizedBox(
            //   height: 8,
            // ),
            // RaisedButton(
            //   child: Text('Delete Data'),
            //   color: Colors.redAccent,
            //   onPressed: () {
            //     deleteData();
            //   },
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(20))),
            // ),
          ],
        ),
      )), //center
    );
  }

  void createData() {
    databaseReference.child("CCTV_1").set({
      'lat': '13.029230105544494',
      'long': '77.55829850350145',
      'detected': false,
      'status': 'receding',
    });
    databaseReference.child("CCTV_2").set({
      'lat': '13.029230105544494',
      'long': '77.55829850350145',
      'detected': false,
      'status': 'receding',
    });
    databaseReference.child("CCTV_3").set({
      'lat': '13.029230105544494',
      'long': '77.55829850350145',
      'detected': false,
      'status': 'receding',
    });
    databaseReference.child("CCTV_4").set({
      'lat': '13.029230105544494',
      'long': '77.55829850350145',
      'detected': false,
      'status': 'receding',
    });
    databaseReference.child("CCTV_5").set({
      'lat': '13.029230105544494',
      'long': '77.55829850350145',
      'detected': false,
      'status': 'receding',
    });
  }

  void readData() {
    databaseReference.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  void setAlarmOff() {
    databaseReference.child('CCTV_1').update({'detected': false});
  }

  // void setAlarmOff() {
  //   databaseReference.child('CCTV_!').remove();
  //   databaseReference.child('flutterDevsTeam2').remove();
  //   databaseReference.child('flutterDevsTeam3').remove();
  // }
}
