import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:office_work/allpages/home_page.dart';
import 'package:office_work/model/info_model.dart';
import 'package:provider/provider.dart';

import '../provider/info_provider.dart';
import 'details_page.dart';


class ViewPage extends StatelessWidget {
  final idController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<InfoDataProvider>(
        builder: (context,infoDataProvider,child) {
          return Scaffold(
            appBar: AppBar(title: Text('View Page'),),
            body: Column(
              children: [
                SizedBox(height: 10,),
                SizedBox(
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: infoDataProvider.info.length,
                      itemBuilder: (context, index){
                        final contact = infoDataProvider.info[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Stack(
                            children: [
                              Card(
                               color: index.isEven ? Colors.amber.withOpacity(0.8) : Colors.red.withOpacity(0.8),
                                child: ListTile(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailsPage(task: infoDataProvider.info[index],)));
                                  },
                                  contentPadding: EdgeInsets.all(15),
                                  leading: CircleAvatar(child: Text('${infoDataProvider.info[index].id}',style: TextStyle(color: Colors.green),),backgroundColor: Colors.white,),
                                  subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('${infoDataProvider.info[index].name}',style: TextStyle(color: Colors.white)),
                                        Text('${infoDataProvider.info[index].email}',style: TextStyle(color: Colors.white)),
                                      ]
                                      ),
                                    trailing: Column(children: [
                                      InkWell(
                                         onTap: (){
                                        infoDataProvider.deleteData(infoDataProvider.info[index]);
                                      },
                                        child: Icon(Icons.close,color: Colors.white,)),
                                      InkWell(
                                        onTap: (){
                                        infoDataProvider.textCotrollerUpdate(idController,nameController,emailController,mobileController,addressController,contact);
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AlertDialog(
            title: const Text('Update Info'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                  children: [
                TextFormField(
                   controller: idController,
                   decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Id : ',
                ),
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
                ),
                SizedBox(height: 10,),
                 TextFormField(
                   controller: nameController,
                   decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Name : ',
                ),
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
                ),
                SizedBox(height: 10,),
                 TextFormField(
                   controller: emailController,
                   decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Email : ',
                ),
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
                ),
                SizedBox(height: 10,),
                 TextFormField(
                   controller: mobileController,
                   decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Mobile : ',
                ),
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
                ),
                SizedBox(height: 10,),
                 TextFormField(
                   controller: addressController,
                   decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Address : ',
                ),
                validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
                )
                  ],
                )
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()) {infoDataProvider.updateInfo(index,contact);
                                 ScaffoldMessenger.of(context).showSnackBar(
                                   const SnackBar(
                                    backgroundColor: Colors.green,
                                       content: Text('Successfull Data Update')),
                                 );
                               }
                  infoDataProvider.updateInfo(index,StudentInfo(id: int.parse(idController.text), name: nameController.text, email: emailController.text, mobile: mobileController.text, address: addressController.text));
                   
                  Navigator.pop(context);
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
                                              );
                                        },
                                        child: Icon(Icons.edit,color: Colors.white,)
                                        ),
                                    ],)
                                ),
                              ),
                             
                            ],
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}