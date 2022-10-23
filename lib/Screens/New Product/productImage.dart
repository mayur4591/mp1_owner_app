import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  int _currentStep = 0;

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
                    content: Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width / 1.4,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                        ))),
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
                              children: [
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
