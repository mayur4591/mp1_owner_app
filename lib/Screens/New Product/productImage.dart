import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
 bool isImageSelected=false;
  int _currentStep = 0;
  bool isloding=false;
  var image_2d;
  Future get_2d_Image() async {

  setState(() {

  });
      image_2d=
      await ImagePicker().pickImage(source: ImageSource.gallery);
      // ignore: deprecated_member_use
      // Reference ref = FirebaseStorage.instance
      //     .ref()
      //     .child('room_owner')
      //     .child(auth.currentUser!.uid)
      //     .child('profile_image');
      // await ref.putFile(File(profile!.path));
      // ref.getDownloadURL().then((value) {
      //   setState(() {
      //     // ignore: deprecated_member_use
      //     Map<String, dynamic> map = {'profile_image': value};
      //     FirebaseDatabase.instance
      //         .reference()
      //         .child(
      //         'Users/all_users/${FirebaseAuth.instance.currentUser!.uid}')
      //         .update(map)
      //         .then((value) {
      //       FirebaseDatabase.instance
      //           .reference()
      //           .child(
      //           'Users/room_owners/${FirebaseAuth.instance.currentUser!.uid}')
      //           .update(map);
      //       FirebaseDatabase.instance
      //           .reference()
      //           .child(
      //           'Users/all_users/${FirebaseAuth.instance.currentUser!.uid}/profile_image')
      //           .once()
      //           .then((value) {
      //         setState(() {
      //           url = value.snapshot.value as String?;
      //           image = url;
      //         });
      //       });
      //     });
      //     print(value);
      //   });
      // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
          backgroundColor: Color.fromRGBO(44, 53, 57, 1),
        ),
        body: SafeArea(
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

                        )):GestureDetector(
                      onTap: (){
                        get_2d_Image().then((value) => {
                        setState(() {
                        isImageSelected=true;
                        })
                        });

                      },
                      child: Container(
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
                    title: const Text('Upload GLB file of product (Optional)'),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'This will be used for Augumented Reality purpose.',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
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

                        SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'This will help user for better understanding of product,we recommend you to upload this but it is optional so you can think about it.',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
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
                              color: Colors.blueGrey),),



                      ],
                    )),
              ],
              onStepTapped: (newStep) {
                setState(() {
                  _currentStep = newStep;
                });
                print(_currentStep);
              },
              onStepContinue: () {
                if (_currentStep != 6) {
                  _currentStep++;
                  setState(() {});
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
