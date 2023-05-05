import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';



@HiveType(typeId: 0)
class PdfModel extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? url;

  @HiveField(2)
  String? path;

  PdfModel({this.name, this.url, this.path});
}



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> pdfUrls = [
    'https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf',
    'https://www.tutorialspoint.com/flutter/flutter_tutorial.pdf'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Example'),
      ),
      body: FutureBuilder(
        future: Hive.openBox<PdfModel>('pdfBox'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final box = Hive.box<PdfModel>('pdfBox');
            final pdfs = box.values.toList().cast<PdfModel>();
            return ListView.builder(
              itemCount: pdfs.length,
              itemBuilder: (context, index) {
                final pdf = pdfs[index];
                return ListTile(
                  title: Text(pdf.name!),
                  subtitle: Text(pdf.path!),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          downloadAndSavePdfFiles(pdfUrls);
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String?> downloadFile(String url, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';

    try {
      final dio = Dio();
      final response = await dio.download(url, filePath);
      return filePath;
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }

  void downloadAndSavePdfFiles(List<String> pdfUrls) async {
    final box = Hive.box<PdfModel>('pdfBox');

    for (String url in pdfUrls) {
      final fileName = url.split('/').last;
      final filePath = await downloadFile(url, fileName);
      if (filePath != null) {
        final pdf = PdfModel(name: fileName, url: url, path: filePath);
        box.add(pdf);
      }
    }
  }
}
