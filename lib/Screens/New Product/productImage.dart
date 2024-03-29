
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner_app/Models/NewProduct.dart';
import 'package:owner_app/Screens/HomeScreens/homeScreen.dart';
import 'package:owner_app/Screens/New%20Product/ProductPublished.dart';

class ProductInfoPage extends StatefulWidget {
  const ProductInfoPage({Key? key}) : super(key: key);

  @override
  State<ProductInfoPage> createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  final productNameController = TextEditingController();
  final productPriceController = TextEditingController();
  final productDetailsController = TextEditingController();
  final productMaterialsUsedController = TextEditingController();
  var product_2d_image;
  var product_glb_file;

  bool isloading=false;
  bool isImageSelected=false;
  bool isglbFileSelected=false;
  bool isPublishing=false;
  bool isGlbloding=false;


  int _currentStep = 0;
  var image_2d;
  var glb_file;

  String image_url="";
  String glb_file_url="";
  String product_id="";

  Future publishProduct(NewProduct newProduct) async  {
    await FirebaseDatabase.instance.reference().child('Users/all_users/${FirebaseAuth.instance.currentUser!.uid}/product_list').push().once().then((value) => {
      setState((){
        product_id=value.snapshot.key!;
        print(product_id);
      })
    }).then((value) async => {
    await FirebaseDatabase.instance.reference().child('Users/all_users/${FirebaseAuth.instance.currentUser!.uid}/product_list/$product_id').set({
      'product_name':newProduct.product_name,
      'product_price':newProduct.price,
      'product_details':newProduct.details,
      'product_materials':newProduct.materials,
      'image_url':newProduct.image_url_2d,
      'glb_file_url':newProduct.glb_file_url,
      'product_id':product_id,
      'owner_id':FirebaseAuth.instance.currentUser!.uid
    }).then((value) async => {
      await FirebaseDatabase.instance.reference().child('posts/$product_id').set({
        'product_name':newProduct.product_name,
        'product_price':newProduct.price,
        'product_details':newProduct.details,
        'product_materials':newProduct.materials,
        'image_url':newProduct.image_url_2d,
        'glb_file_url':newProduct.glb_file_url,
        'owner_id':FirebaseAuth.instance.currentUser!.uid,
        'product_id':product_id,
      })
    }).then((value) async => {
      await FirebaseDatabase.instance.reference().child('Users/owners/${FirebaseAuth.instance.currentUser!.uid}/product_list/$product_id').push().set({
        'product_name':newProduct.product_name,
        'product_price':newProduct.price,
        'product_details':newProduct.details,
        'product_materials':newProduct.materials,
        'image_url':newProduct.image_url_2d,
        'glb_file_url':newProduct.glb_file_url,
        'owner_id':FirebaseAuth.instance.currentUser!.uid,
        'product_id':product_id,
      })
    }).then((value) => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScren())),
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Your product has successfully Published',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),backgroundColor: Colors.white,))

    })
    });



  }
  Future get_2d_Image() async {

  setState(() {
  isloading=true;
  });
      image_2d=
      await ImagePicker().pickImage(source: ImageSource.gallery);
      // ignore: deprecated_member_use
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('owner')
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child(DateTime.now().toString());
      await ref.putFile(File(image_2d!.path));
      ref.getDownloadURL().then((value) {
        setState(() {
          // ignore: deprecated_member_use
          image_url=value;
        });
      });

  }


  Future<void> getGlbFileAndUpload()async{

    var rng = Random();

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
    saveGlb(file.readAsBytesSync(), fileName);
  }

  Future<void> saveGlb(Uint8List asset, String name) async {
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('owner')
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child(name);
    SettableMetadata metadata =
    SettableMetadata(
      cacheControl: 'max-age=60',
      contentType: 'glb'

    );

   await reference.putData(asset,metadata);

        reference.getDownloadURL().then((value) {
          setState(() {
            glb_file_url=value;
            print('Glb modal :- '+glb_file_url);
              isglbFileSelected=true;
              isGlbloding=false;
          });
        });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
          backgroundColor: Color.fromRGBO(44, 53, 57, 1),
        ),
        body: isPublishing? const PublishingScreen():SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stepper(
              currentStep: _currentStep,
              steps: [
                 Step(
                    title: const Text('Product Name'),
                    content: TextField(
                      controller: productNameController,
                      decoration:
                          const InputDecoration(hintText: 'Enter Product Name'),
                    )),
                 Step(
                    title: const Text('Product Price'),
                    content: TextField(
                      controller: productPriceController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.currency_rupee,
                          size: 15,
                        ),
                        hintText: 'Product Price',
                      ),
                    )),
                 Step(
                    title: const Text('Product Details'),
                    content: TextField(
                      controller: productDetailsController,
                      maxLength: 550,
                      maxLines: 20,
                      minLines: 3,
                      decoration: const InputDecoration(
                        hintText: 'Give product discription',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey), //<-- SEE HERE
                        ),
                      ),
                    )),
                 Step(
                    title: const Text('Materials used'),
                    content: TextField(
                      controller: productMaterialsUsedController,
                      maxLength: 550,
                      maxLines: 20,
                      minLines: 3,
                      decoration: const InputDecoration(
                        hintText: 'What materials are used?',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.grey), //<-- SEE HERE
                        ),
                      ),
                    )),
                 Step(
                    title: const Text('Upload 2D image of product'),
                    content:isImageSelected? Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.4,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10)),
                        child:  ListTile(
                          horizontalTitleGap: -15,
                          leading:  const Icon(
                            Icons.verified,
                            color: Colors.blueGrey,
                            size: 15,
                          ),
                          title: const Text(
                            'Product image selected',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12, color: Colors.blueGrey),
                          ),
                          trailing: GestureDetector(
                            onTap: (){
                              setState(() {
                                isImageSelected=false;
                                image_2d="";
                              });
                            },
                              child: const Icon(Icons.cancel,color: Colors.grey,size: 18,)),

                        )
                    ):
                    GestureDetector(
                      onTap: (){
                        get_2d_Image().then((value) => {
                        setState(() {
                        isImageSelected=true;
                        isloading=false;
                        })
                        });

                      },
                      child: isloading?const SpinKitFadingCircle(
                        size: 20,
                        color: Colors.blueGrey,
                      ):Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width / 1.4,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.upload_file_rounded,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Click here',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.blueGrey),
                              )
                            ],
                          )),
                    ),



                 ),
                 Step(
                  title: const Text('Upload 3D modal of product(Optional)'),
                  content:isglbFileSelected? Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.4,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10)),
                      child:  ListTile(
                        horizontalTitleGap: -15,
                        leading:  const Icon(
                          Icons.verified,
                          color: Colors.blueGrey,
                          size: 15,
                        ),
                        title: const Text(
                          'Product modal selected',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12, color: Colors.blueGrey),
                        ),
                        trailing: GestureDetector(
                            onTap: (){
                              setState(() {
                                isglbFileSelected=false;
                                glb_file="";
                              });
                            },
                            child: const Icon(Icons.cancel,color: Colors.grey,size: 18,)),

                      )
                  ):
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isGlbloding=true;
                      });
                      getGlbFileAndUpload().then((value) => {

                      });

                    },
                    child: isGlbloding?const SpinKitThreeBounce(
                      size: 20,
                      color: Colors.blueGrey,
                    ):Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width / 1.4,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.upload_file_rounded,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Click here',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.blueGrey),
                            )
                          ],
                        )),
                  ),
                ),
                 Step(
                    title: const Text('Publish'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.rocket_launch_sharp,color: Colors.blueGrey,),
                        SizedBox(height: 10,),
                        Text(
                          'Congratulations',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey),
                        ),
                        SizedBox(height: 3,),
                        Text('You are ready to publish your Product',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey),)

                      ],
                    )),
              ],
              onStepContinue: () {
                if (_currentStep != 6) {
                  _currentStep++;
                  setState(() {});
                }
                else
                  {
                    if(productNameController.text.isEmpty || productPriceController.text.isEmpty || productDetailsController.text.isEmpty|| productMaterialsUsedController.text.isEmpty || image_url=='')
                      {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Fill all required details')));
                      }
                    else if(isGlbloding || isloading)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wait till 3D modal get uploaded completely...')));
                      }
                    else
                      {
                      setState((){
                      isPublishing=true;
                      });
                        NewProduct newProduct=NewProduct(productNameController.text, productPriceController.text, productDetailsController.text, productMaterialsUsedController.text, image_url, glb_file_url);
                        publishProduct(newProduct).then((value) => {
                          print(glb_file_url),
                      setState((){
                      isPublishing=false;
                      })
                      });

                      }
                  }
                print(_currentStep);
              },
              onStepCancel: () {
                if (_currentStep != 0) {
                  setState(() {
                    _currentStep--;
                  });
                }
                print(_currentStep);
              },
            ),
          ),
        ));
  }
}
class PublishingScreen extends StatefulWidget {
  const PublishingScreen({Key? key}) : super(key: key);

  @override
  State<PublishingScreen> createState() => _PublishingScreenState();
}

class _PublishingScreenState extends State<PublishingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  const [
        SpinKitThreeBounce(
          color: Colors.blueGrey,
          size: 20,
        ),
        SizedBox(height: 20,),
        Text('We are publishing your product...',style: TextStyle(color: Colors.blueGrey,fontSize: 15,fontWeight: FontWeight.w500),),
        SizedBox(height: 10,),
        Text('It will take some time please wait.',style: TextStyle(color: Colors.blueGrey,fontSize: 10,fontWeight: FontWeight.w500),)
      ],
    );
  }
}

