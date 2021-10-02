import 'package:fa_stepper/fa_stepper.dart';
import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../home.dart';

class StepOneScreen extends StatefulWidget {
  const StepOneScreen({Key? key}) : super(key: key);

  @override
  _StepOneScreenState createState() => _StepOneScreenState();
}

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

List<String> listProblem = [
  "Không khởi động được",
  "Tôi bị tai nạn",
  "Tôi cần vá săm lốp",
  "Tôi cần thay ắc quy",
  "Tôi cần xe cứu hộ",
  "Khác",
];

List<String> listProducts = [
  "Honda",
  "Toyota",
  "Suzuki",
  "Wave",
  "Sirius",
  "Kawashaki",
  "BMW",
];

List<String> listProductsCar = [
  "VinFast",
  "BMW",
  "Toyota",
  "Lamborghini",
  "Range Rover",
  "Chevrolet",
  "Mazda",
  "Ford"
];

List<String> listProductsCarT = [
  "Vinfast Lux",
  "Vinfast Fadil",
  "Vinfast President",
  "Vinfast VF e34",
  "Vinfast Lux SA2.0",
];

List<String> listProductsCarType = [
  "Xe 2 chỗ",
  "Xe 4 chỗ",
  "Xe 5 chỗ",
  "Xe 10 chỗ",
];

List<String> listProductVersion = [
  "Honda Future",
  "Wave",
  "Air Blade",
  "Blade",
  "Vision",
  "Winner",
  "Dream"
];

class _StepOneScreenState extends State<StepOneScreen> {
  String _myStateProblem = listProblem[0],
      _myStateProduct = listProducts[0],
      _myStateCar = listProductsCar[0],
      _myStateVersion = listProductVersion[0],
      _myStateCarType = listProductsCarType[0],
      _myStateCarT = listProductsCarT[0];

  bool checkedValue = false;

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
                  statusAppController.setStatus(2);
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

  FAStepperType stepperType = FAStepperType.horizontal;

  int currentStep = 0;
  bool complete = false;

  goTo(int step) {
    setState(() {
      currentStep = step;
    });
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  int groupValue = 0, groupValueType = 0;

  changeSelect(int? value) {
    setState(() {
      groupValue = value!;
    });
  }

  changeSelectType(int? value) {
    setState(() {
      groupValueType = value!;
    });
  }

  final _items =
      listProblem.map((item) => MultiSelectItem<String>(item, item)).toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thông tin khách hàng',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
      ),
      bottomNavigationBar: BottomNav(),
      body: FAStepper(
        physics: ClampingScrollPhysics(),
        steps: [
          FAStep(
            title: const Text("Thông tin khách hàng"),
            isActive: currentStep >= 0,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TileItem(
                  prefixIcon: Icons.account_box_rounded,
                  value: 'Trương Thanh Bình',
                  hintText: "Tên người dùng",
                ),
                SizedBox(
                  height: 10,
                ),
                TileItem(
                  prefixIcon: Icons.phone_android_outlined,
                  value: "0123456789",
                  hintText: "Số điện thoại",
                ),
                SizedBox(
                  height: 10,
                ),
                TileItem(
                  prefixIcon: Icons.location_on,
                  value: "12 Nguyễn Thị Minh Khai, Quận 1, tp Hồ Chí Minh",
                  hintText: "Địa chỉ",
                  maxLines: 2,
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Bạn gặp vấn đề gì?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    isExpanded: true,
                    value: _myStateProblem,
                    iconSize: 30,
                    icon: null,
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                    hint: Text("Select state"),
                    onChanged: (String? newValue) {
                      setState(() {
                        _myStateProblem = newValue!;
                      });
                    },
                    items: listProblem
                        .map((item) => new DropdownMenuItem(
                              child: Text(item),
                              value: item,
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
          FAStep(
            title: const Text("Mô tả phương tiện"),
            isActive: currentStep >= 1,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Loại xe bạn muốn sửa',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: groupValue,
                            onChanged: changeSelect,
                          ),
                          Text("Xe máy"),
                        ],
                      ),
                    ),
                    Container(
                        child: Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: groupValue,
                          onChanged: changeSelect,
                        ),
                        Text("Ô tô"),
                      ],
                    ))
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  'Nhãn hiệu sản phẩm',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffeeeff0)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: "Biển số xe",
                        filled: true,
                        fillColor: Colors.white,
                        prefixStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      isExpanded: true,
                      value: groupValue == 0 ? _myStateProduct : _myStateCar,
                      iconSize: 30,
                      icon: null,
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                      hint: Text("Select state"),
                      onChanged: (String? newValue) {
                        setState(() {
                          groupValue == 0
                              ? _myStateProduct = newValue!
                              : _myStateCar = newValue!;
                        });
                      },
                      items: groupValue == 0
                          ? listProducts
                              .map((item) => new DropdownMenuItem(
                                    child: Text(item),
                                    value: item,
                                  ))
                              .toList()
                          : listProductsCar
                              .map((item) => new DropdownMenuItem(
                                    child: Text(item),
                                    value: item,
                                  ))
                              .toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                groupValue == 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: groupValueType,
                                  onChanged: changeSelectType,
                                ),
                                Text("Xe tay ga"),
                              ],
                            ),
                          ),
                          Container(
                              child: Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: groupValueType,
                                onChanged: changeSelectType,
                              ),
                              Text("Xe số"),
                            ],
                          ))
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 4,
                ),
                groupValue == 1
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButton(
                            isExpanded: true,
                            value: _myStateCarType,
                            iconSize: 30,
                            icon: null,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 16),
                            hint: Text("Loại xe"),
                            onChanged: (String? newValue) {
                              setState(() {
                                _myStateCarType = newValue!;
                              });
                            },
                            items: listProductsCarType
                                .map((item) => new DropdownMenuItem(
                                      child: Text(item),
                                      value: item,
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 4,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      isExpanded: true,
                      value: groupValue == 0 ? _myStateVersion : _myStateCarT,
                      iconSize: 30,
                      icon: null,
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                      hint: Text("Select state"),
                      onChanged: (String? newValue) {
                        setState(() {
                          groupValue == 0
                              ? _myStateVersion = newValue!
                              : _myStateCarT = newValue!;
                        });
                      },
                      items: groupValue == 0
                          ? listProductVersion
                              .map((item) => new DropdownMenuItem(
                                    child: Text(item),
                                    value: item,
                                  ))
                              .toList()
                          : listProductsCarT
                              .map((item) => new DropdownMenuItem(
                                    child: Text(item),
                                    value: item,
                                  ))
                              .toList(),
                    ),
                  ),
                ),
                groupValue == 1
                    ? CheckboxListTile(
                        title: Text("Yêu cầu xe kéo?"),
                        value: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity
                            .leading, //  <-- leading Checkbox
                      )
                    : Container()
              ],
            ),
          ),
          FAStep(
            title: const Text("Tình trạng phương tiện"),
            isActive: currentStep >= 2,
            content: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        height: 150,
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
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.grey,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.width * 0.25,
                              child: Image(
                                image: AssetImage(bike_1),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.grey,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.width * 0.25,
                              child: Image(
                                image: AssetImage(bike_2),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.grey,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.width * 0.25,
                              child: Image(
                                image: AssetImage(bike_1),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),

              ],
            ),
          ),
          // FAStep(
          //   title: const Text("Hình ảnh và ghi chú"),
          //   isActive: currentStep >= 3,
          //   content: Column(
          //     children: [
          //       Container(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               'Hình ảnh: ',
          //               style: TextStyle(
          //                 fontSize: 18,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //             ),
          //             SizedBox(
          //               height: 10,
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 RawMaterialButton(
          //                   onPressed: () {},
          //                   elevation: 2.0,
          //                   fillColor: Colors.grey,
          //                   child: Container(
          //                     width: MediaQuery.of(context).size.width * 0.25,
          //                     height: MediaQuery.of(context).size.width * 0.25,
          //                     child: Image(
          //                       image: AssetImage(bike_1),
          //                       fit: BoxFit.fill,
          //                     ),
          //                   ),
          //                 ),
          //                 RawMaterialButton(
          //                   onPressed: () {},
          //                   elevation: 2.0,
          //                   fillColor: Colors.grey,
          //                   child: Container(
          //                     width: MediaQuery.of(context).size.width * 0.25,
          //                     height: MediaQuery.of(context).size.width * 0.25,
          //                     child: Image(
          //                       image: AssetImage(bike_2),
          //                       fit: BoxFit.fill,
          //                     ),
          //                   ),
          //                 ),
          //                 RawMaterialButton(
          //                   onPressed: () {},
          //                   elevation: 2.0,
          //                   fillColor: Colors.grey,
          //                   child: Container(
          //                     width: MediaQuery.of(context).size.width * 0.25,
          //                     height: MediaQuery.of(context).size.width * 0.25,
          //                     child: Image(
          //                       image: AssetImage(bike_1),
          //                       fit: BoxFit.fill,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(
          //               height: 20,
          //             ),
          //             Text(
          //               'Ghi chú: ',
          //               style: TextStyle(
          //                 fontSize: 18,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //             ),
          //             Container(
          //               height: 220,
          //               margin:
          //                   EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //               color: Colors.white,
          //               child: TextFormField(
          //                 textAlignVertical: TextAlignVertical.center,
          //                 initialValue: "Cần mua xăng",
          //                 maxLines: null,
          //                 keyboardType: TextInputType.multiline,
          //                 style: TextStyle(
          //                   fontSize: 18,
          //                 ),
          //                 decoration: InputDecoration(
          //                   labelStyle: TextStyle(
          //                       fontSize: 22,
          //                       fontWeight: FontWeight.w500,
          //                       color: Colors.black),
          //                   border: InputBorder.none,
          //                   filled: true,
          //                   fillColor: Colors.white,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
        type: stepperType,
        currentStep: currentStep,
        onStepContinue: () {
          currentStep + 1 != 3 ? goTo(currentStep + 1) : _delete(context);
        },
        onStepCancel: cancel,
        onStepTapped: (step) => goTo(step),
        controlsBuilder: (BuildContext context,
            {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
          return Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: onStepContinue,
                    child: Text(
                      'Tiếp theo',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.primaries.first),
                    onPressed: onStepCancel,
                    child: Text(
                      'Trở về',
                      style: TextStyle(fontSize: 17),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TileItem extends StatelessWidget {
  TileItem(
      {required this.prefixIcon,
      required this.hintText,
      required this.value,
      this.maxLines = 1});

  final IconData prefixIcon;
  final String value, hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      initialValue: value,
      keyboardType: TextInputType.multiline,
      style: TextStyle(
        fontSize: 16,
      ),
      maxLines: maxLines,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffeeeff0)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12.0),
            child: Icon(prefixIcon),
          ),
          prefixStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
