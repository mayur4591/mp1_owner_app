import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelViewerScreen extends StatefulWidget {

  String url;

  @override
  State<ModelViewerScreen> createState() => _ModelViewerScreenState();

  ModelViewerScreen(this.url);
}

class _ModelViewerScreenState extends State<ModelViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
      appBar: AppBar(
        title: const Text('3D Model'),
        backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
      ),
      body:  Column(

        children: [
          SizedBox(
            height: 500,
            child:ModelViewer(
              src: widget.url,
              alt: "A 3D model of an astronaut",
              ar: true,
              autoRotate: true,
              cameraControls: true,
            ),
          ),
          const SizedBox(height: 20,),
          const Center(child: Text('This is the 3D model of this product',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)),
          Container(
              padding: EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 20,right: 20),
              child: const Center(child: Text('Click on button given right-bottom corner to experience it in Augumented Reality.',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),)))

        ],
      ),
    );
  }
}
