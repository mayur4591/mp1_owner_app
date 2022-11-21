import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      title: Text('Testing'),),
      body: SizedBox(
        height: 500,
        child:ModelViewer(
          src: 'https://firebasestorage.googleapis.com/v0/b/miniproject-3f999.appspot.com/o/owner%2F2022-11-21%2015%3A59%3A25.937701.glb?alt=media&token=ded55b78-e9de-4e29-a83f-2ca03b51ecee',//'https://firebasestorage.googleapis.com/v0/b/miniproject-3f999.appspot.com/o/chesterfield-sofa.glb?alt=media&token=fefb2430-347b-4ae0-88e0-e35c5cdbf3fc',
          alt: "A 3D model of an astronaut",
          ar: true,
          autoRotate: true,
          cameraControls: true,
        ),
      ),
    );
  }

  Future getPdfAndUpload()async{

    var rng = new Random();

    String randomName="";
    for (var i = 0; i < 20; i++) {
      print(rng.nextInt(100));
      randomName += rng.nextInt(100).toString();
    }
    FilePickerResult? result = await FilePicker.platform.pickFiles(
    );
    File file=File(result!.files.first.path.toString());
    print(result.files.first.extension);
    String fileName = '${randomName}.glb';
    print(fileName);
    print('${file.readAsBytesSync()}');
    savePdf(file.readAsBytesSync(), fileName);
  }

  Future savePdf(Uint8List asset, String name) async {
    Reference reference = await FirebaseStorage.instance
        .ref()
        .child('owner')
        //.child(FirebaseAuth.instance.currentUser!.uid)
        .child(DateTime.now().toString()+".glb");
    SettableMetadata metadata =
    SettableMetadata(
      cacheControl: 'max-age=60',
    );

    UploadTask uploadTask = reference.putData(asset,metadata);
    String url = await (await uploadTask).ref.getDownloadURL();
    print(url);
    return  url;
  }

}
