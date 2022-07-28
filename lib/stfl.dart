import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterapibloc1/main.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class Alice extends StatefulWidget {
  const Alice({Key? key}) : super(key: key);

  @override
  State<Alice> createState() => aliceState();
}

class aliceState extends State<Alice> {
  late Dio _dio;
  Color _primaryColor = Color(0xffff5e57);
  Color _accentColor = Color(0xffff3f34);
  Color _buttonColor = Color(0xff008000);

  @override
  void initState() {
    _dio = Dio(BaseOptions(
      followRedirects: false,
    ));
    _dio.interceptors.add(alice.getDioInterceptor());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle _buttonStyle = ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(_buttonColor));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Alice HTTP Inspector - Example'),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: [
              const SizedBox(height: 8),
              _getTextWidget(
                  "Welcome to example of Alice Http Inspector. Click buttons below to generate sample data."),
              ElevatedButton(
                child: Text("Run Dio Requests"),
                onPressed: _runDioRequests,
                style: _buttonStyle,
              ),
              const SizedBox(height: 240),
              _getTextWidget(
                  "After clicking on buttons above, you should receive notification."
                      " Click on it to show inspector. You can also shake your device or click button below."),
              ElevatedButton(
                child: Text("Run Inspector"),
                onPressed: _runInspector,
                style: _buttonStyle,
              )
            ],
          ),
        ),
      );
  }

  Widget _getTextWidget(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 14),
      textAlign: TextAlign.center,
    );
  }
  
  void _runDioRequests() async {
    Map<String, dynamic> body = <String, dynamic>{
      "title": "foo",
      "body": "bar",
      "userId": "1"
    };
    _dio.get<void>(
        "https://httpbin.org/redirect-to?url=https%3A%2F%2Fhttpbin.org");
    _dio.delete<void>("https://httpbin.org/status/500");
    _dio.delete<void>("https://httpbin.org/status/400");
    _dio.delete<void>("https://httpbin.org/status/300");
    _dio.delete<void>("https://httpbin.org/status/200");
    _dio.delete<void>("https://httpbin.org/status/100");
    _dio.post<void>("https://jsonplaceholder.typicode.com/posts", data: body);
    _dio.get<void>("https://jsonplaceholder.typicode.com/posts",
        queryParameters: <String, dynamic>{"test": 1});
    _dio.put<void>("https://jsonplaceholder.typicode.com/posts/1", data: body);
    _dio.put<void>("https://jsonplaceholder.typicode.com/posts/1", data: body);
    _dio.delete<void>("https://jsonplaceholder.typicode.com/posts/1");
    _dio.get<void>("http://jsonplaceholder.typicode.com/test/test");

    _dio.get<void>("https://jsonplaceholder.typicode.com/photos");
    _dio.get<void>(
        "https://icons.iconarchive.com/icons/paomedia/small-n-flat/256/sign-info-icon.png");
    _dio.get<void>(
        "https://images.unsplash.com/photo-1542736705-53f0131d1e98?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80");
    _dio.get<void>(
        "https://findicons.com/files/icons/1322/world_of_aqua_5/128/bluetooth.png");
    _dio.get<void>(
        "https://upload.wikimedia.org/wikipedia/commons/4/4e/Pleiades_large.jpg");
    _dio.get<void>("http://techslides.com/demos/sample-videos/small.mp4");

    _dio.get<void>("https://www.cse.wustl.edu/~jain/cis677-97/ftp/e_3dlc2.pdf");

    final directory = await getApplicationDocumentsDirectory();
    File file = File("${directory.path}/test.txt");
    file.create();
    file.writeAsStringSync("123456789");

    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap(<String, dynamic>{
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    _dio.post<void>("https://jsonplaceholder.typicode.com/photos",
        data: formData);

    _dio.get<void>("http://dummy.restapiexample.com/api/v1/employees");
  }


  void _runInspector() {
    alice.showInspector();
  }
}
