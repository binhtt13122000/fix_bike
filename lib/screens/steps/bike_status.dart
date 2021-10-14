import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/screens/steps/camera.dart';
import 'package:fix_bike/services/database.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../home.dart';

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
  final _items =
      listProblem.map((item) => MultiSelectItem<String>(item, item)).toList();

  Future _showPhotoLibrary() async {
    final file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      StatusAppController().setPath(file.path, currentIndex);
    });
  }

  final StatusAppController statusAppController =
      Get.put(StatusAppController());

  void _delete(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            content: Text(
              'Bạn muốn tìm người sửa xe không?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              // The "Yes" button
              CupertinoDialogAction(
                onPressed: () {
                  DatabaseMethods().updateTodo(1);
                  Navigator.of(context).pop();
                  Get.to(Home());
                },
                child: Text('Có'),
                isDefaultAction: true,
                isDestructiveAction: true,
              ),
              // The "No" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Không'),
                isDefaultAction: false,
                isDestructiveAction: false,
              )
            ],
          );
        });
  }

  void _showCamera(BuildContext context) async {
    final cameras = await availableCameras();
    final camera = cameras.first;
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => CameraScreen(camera: camera)));
    await DatabaseMethods()
        .uploadImageToFirebase(context, new File(result), currentIndex);
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
                      _showCamera(context);
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: Text(
          'Tình trạng phương tiện',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFF9AA33)),
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
                    'Tình trạng phương tiện',
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
                    title: Text("Tình trạng phương tiện"),
                    selectedColor: Color(0xFFF9AA33),
                    // selectedItemsTextStyle: TextStyle(
                    //     backgroundColor: Color(0xFFF9AA33),
                    //     color: Colors.black),

                    searchTextStyle: TextStyle(
                      backgroundColor: Color(0xFFF9AA33),
                    ),
                    buttonText: Text(
                      "Chọn",
                      style: TextStyle(
                        color: Colors.black,
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
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.width * 0.25,
                          child: Obx(
                            () => statusAppController.img1.value == ''
                                ? Image(
                                    image: AssetImage(bike_1),
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(
                                    statusAppController.img1.value,
                                    fit: BoxFit.fill,
                                  ),
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
                          child: Obx(
                            () => statusAppController.img2.value == ''
                                ? Image(
                                    image: AssetImage(bike_2),
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(
                                    statusAppController.img2.value,
                                    fit: BoxFit.fill,
                                  ),
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
                          child: Obx(
                            () => statusAppController.img3.value == ''
                                ? Icon(Icons.camera_alt_outlined,
                                    size: 18, color: Colors.white)
                                : Image.network(
                                    statusAppController.img3.value,
                                    fit: BoxFit.fill,
                                  ),
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
                            style: ElevatedButton.styleFrom(
                                primary: Colors.primaries.first),
                            onPressed: () {},
                            child: Text(
                              'Trở về',
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFF9AA33),
                                onPrimary: Colors.black),
                            onPressed: () {
                              _delete(context);
                            },
                            child: Text(
                              'Tiếp theo',
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
