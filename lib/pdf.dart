import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'model/info_model.dart';

  Future<Uint8List> pdfFile(StudentInfo task) async {
    final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Column(
         children: [
          pw.Column(
            children: [
              pw.Text(task.id.toString(),style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
          pw.Text(task.name,style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold)),
          pw.Text(task.email,style: pw.TextStyle(fontSize: 18)),
          pw.Text(task.mobile,style: pw.TextStyle(fontSize: 18)),
          pw.Text(task.address,style: pw.TextStyle(fontSize: 18)),
            ]
          )
        ]
        ),
      ),
    ),
  );
  return await pdf.save();
}
