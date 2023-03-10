import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:office_work/allpages/view_page.dart';
import 'package:provider/provider.dart';

import '../provider/info_provider.dart';
import '../style/style.dart';

class HomePage extends StatelessWidget {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<InfoDataProvider>(
        builder: (context, infoDataProvider, child) {
      return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: idController,
                          decoration: AppInputDecoration('Enter Id'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter id';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: nameController,
                          decoration: AppInputDecoration('Enter Name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: AppInputDecoration('Enter Email'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: mobileController,
                          decoration: AppInputDecoration('Enter mobile'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter mobile number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: addressController,
                          decoration: AppInputDecoration('Enter Address'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: [
                           ElevatedButton(
                             onPressed: () {
                               if (_formKey.currentState!.validate()) {infoDataProvider.addData(int.tryParse(idController.text)!, nameController.text, emailController.text,
                               mobileController.text,
                                     addressController.text);
                                 ScaffoldMessenger.of(context).showSnackBar(
                                   const SnackBar(
                                    backgroundColor: Colors.green,
                                       content: Text('Successfull Data Inserted')),
                                 );
                               }
                               infoDataProvider.clearInfo(idController, nameController, emailController, mobileController, addressController);
                             },
                             child: Text('ADD'),
                             style: ElevatedButton.styleFrom(
                                 minimumSize: Size(100, 40)),
                           ),
                           ElevatedButton(onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPage()));
                           }, child: Text('View Info'), style: ElevatedButton.styleFrom(
                               minimumSize: Size(100, 40)),),
                         ],
                       )
                      ],
                    ),
                    ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
