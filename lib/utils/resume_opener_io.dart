import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

//The function that converts the asset file to uint8 list and then open it using the package OpenFilex.

Future<void> openResume()async{
  //load the raw file data from asset files
  final data= await rootBundle.load('assets/Rohan Patel Resume November 2025.pdf');
  final bytes= data.buffer.asUint8List();

  //write to a temporary file
  final dir=await getTemporaryDirectory();
  final file=File('${dir.path}/rohan_resume.pdf');

  //write the bytes to the file
  await file.writeAsBytes(bytes,flush: true);

  //open the file using the system default pdf viewer.
  await OpenFilex.open(file.path);

}