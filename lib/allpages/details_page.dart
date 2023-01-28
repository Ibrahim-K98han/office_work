import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:office_work/model/info_model.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../pdf.dart';
import '../provider/info_provider.dart';

class DetailsPage extends StatelessWidget {
  final StudentInfo task;
   DetailsPage({super.key, required this.task});
   final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Details Page'),
      actions: [Padding(
        padding: EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: ()async{
            var appDocDir = await getApplicationDocumentsDirectory();
            String appDocPath = appDocDir.path;
            var byte  = await pdfFile(task);
            final file = File('$appDocPath/pdf');
            await file.writeAsBytes(byte);
           Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PdfView(pdfFile: byte,)));

          },
          child: Icon(Icons.print)))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.green,
            width: 2
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
              child: Container(
              width: double.infinity,
              //height: 150,
              height: MediaQuery.of(context).size.height / 4.5,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(child: Text('${task.id}',style: TextStyle(color: Colors.white,fontSize: 20,),)),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded( flex: 2,
                            child: Text('Name',style: TextStyle(color: Colors.black,fontSize: 20,),)),
                            Expanded( flex: 1,
                            child: Text(':',style: TextStyle(color: Colors.black),),
                            ),
                          Expanded( flex: 4,
                            child: Text('${task.name}',style: TextStyle(color: Colors.black,fontSize: 20),)),
                        ],
                        
                      ),
                      Row(
                        children: [
                          Expanded( flex: 2,
                            child: Text('Email ',style: TextStyle(color: Colors.black),),
                            ),
                            Expanded( flex: 1,
                            child: Text(':',style: TextStyle(color: Colors.black),),
                            ),
                          Expanded( flex: 4,
                            child: Text('${task.email}',style: TextStyle(color: Colors.black,),)),
                        ],
                        
                      ),
                      Row(
                        children: [
                          Expanded( flex: 2,
                            child: Text('Mobile',style: TextStyle(color: Colors.black),),
                            ),
                            Expanded( flex: 1,
                            child: Text(':',style: TextStyle(color: Colors.black),),
                            ),
                          Expanded( flex: 4,
                            child: Text('${task.mobile}',style: TextStyle(color: Colors.black,),)),
                        ],
                        
                      ),
                      Row(
                        children: [
                          Expanded( flex: 2,
                            child: Text('Address',style: TextStyle(color: Colors.black),),
                            ),
                            Expanded( flex: 1,
                            child: Text(':',style: TextStyle(color: Colors.black),),
                            ),
                          Expanded( flex: 4,
                            child: Text('${task.address}',style: TextStyle(color: Colors.black,),)),
                        ],
                        
                      ),       
                    
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}



class PdfView extends StatelessWidget {
  const PdfView({super.key, required this.pdfFile});
 final Uint8List pdfFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pdf')),
      body: PdfPreview(
        build: (format) => pdfFile,
      ),
    );
  }
}