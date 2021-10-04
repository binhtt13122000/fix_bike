import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/screens/steps/camera.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class BikeStatus extends StatefulWidget {
  const BikeStatus({Key? key}) : super(key: key);

  @override
  _BikeStatusState createState() => _BikeStatusState();
}

List<String> listProblem = [
  "Không khởi động được",
  "Tôi bị tai nạn",
  "Tôi cần vá săm lốp",
  "Tôi cần thay ắc quy",
  "Tôi cần xe cứu hộ",
  "Khác",
];

class _BikeStatusState extends State<BikeStatus> {
  int currentIndex = 0;
  List<String> _path = ['', '', ''];
  final _items =
  listProblem.map((item) => MultiSelectItem<String>(item, item)).toList();

  Future _showPhotoLibrary() async {
    final file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _path[currentIndex] = file.path;
    });
  }

  void _showCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.first;

    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => CameraScreen(camera: camera)));
    setState(() {
      _path[currentIndex] = result;
    });
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 150,
              child: Column(children: <Widget>[
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _showCamera();
                    },
                    leading: Icon(Icons.photo_camera),
                    title: Text("Take a picture from camera")),
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _showPhotoLibrary();
                    },
                    leading: Icon(Icons.photo_library),
                    title: Text("Choose from photo library"))
              ]));
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text(
              'Thông tin chi tiết',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          bottomNavigationBar: BottomNav(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Tình trạng xe',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MultiSelectDialogField(
                    items: _items,
                    title: Text("Tình trạng xe"),
                    selectedColor: Colors.blue,
                    buttonText: Text(
                      "Chọn",
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 16,
                      ),
                    ),
                    onConfirm: (results) {
                      //_selectedAnimals = results;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chi tiết: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    height: 180,
                    margin:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      initialValue: "Xe bị bể bánh",
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  // SizedBox(height: 20),
                  Text(
                    'Hình ảnh: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            currentIndex = 0;
                            _showOptions(context);
                          });
                        },
                        elevation: 2.0,
                        fillColor: Colors.grey,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.width * 0.25,
                          child: _path[0] == ''
                              ? Image(
                            image: AssetImage(bike_1),
                            fit: BoxFit.fill,
                          )
                              : Image.file(
                            File(_path[0]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            currentIndex = 1;
                            _showOptions(context);
                          });
                        },
                        elevation: 2.0,
                        fillColor: Colors.grey,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.width * 0.25,
                          child: _path[1] == ''
                              ? Image(
                            image: AssetImage(bike_2),
                            fit: BoxFit.fill,
                          )
                              : Image.file(
                            File(_path[1]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          setState(() {
                            currentIndex = 2;
                            _showOptions(context);
                          });
                        },
                        elevation: 2.0,
                        fillColor: Colors.grey,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.width * 0.25,
                          child: _path[2] == ''
                              ? Icon(Icons.camera_alt_outlined,
                              size: 18, color: Colors.white)
                              : Image.file(
                            File(_path[2]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {  },
                            child: Text(
                              'Tiếp theo',
                              style: TextStyle(color: Colors.white, fontSize: 17),
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.primaries.first),
                            onPressed: () {},
                            child: Text(
                              'Trở về',
                              style: TextStyle(fontSize: 17),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
