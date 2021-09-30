import 'package:fa_stepper/fa_stepper.dart';
import 'package:fix_bike/components/BottomNav.dart';
import 'package:flutter/material.dart';
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
  "Lamborghini",
  "Mercerdes",
  "Range Rover",
];

class _StepOneScreenState extends State<StepOneScreen> {
  String _myStateProblem = listProblem[0], _myStateProduct = listProducts[0];

  FAStepperType stepperType = FAStepperType.horizontal;

  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != 4
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

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
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 8,
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
            title: const Text("Mô tả sản phẩm"),
            isActive: currentStep >= 1,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Nhãn hiệu sản phẩm',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton(
                      isExpanded: true,
                      value: _myStateProduct,
                      iconSize: 30,
                      icon: null,
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                      hint: Text("Select state"),
                      onChanged: (String? newValue) {
                        setState(() {
                          _myStateProduct = newValue!;
                        });
                      },
                      items: listProducts
                          .map((item) => new DropdownMenuItem(
                                child: Text(item),
                                value: item,
                              ))
                          .toList(),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        hintText: "Năm sản xuất",
                        filled: true,
                        fillColor: Colors.white,
                        prefixStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
                Divider(
                  height: 1,
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4)),
                        hintText: "Model",
                        filled: true,
                        fillColor: Colors.white,
                        prefixStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
              ],
            ),
          ),
          FAStep(
            title: const Text("Tình trạng sản phẩm"),
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
                          fontSize: 20,
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
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
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
                  height: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chi tiết: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        height: 220,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black54,
                              width: 2,
                            )),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          FAStep(
            title: const Text("Hình ảnh và ghi chú"),
            isActive: currentStep >= 3,
            content: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hình ảnh: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.grey,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            padding: EdgeInsets.all(28.0),
                          ),
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.grey,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            padding: EdgeInsets.all(28.0),
                          ),
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.grey,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            padding: EdgeInsets.all(28.0),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Ghi chú: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        height: 220,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black54,
                              width: 2,
                            )),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          initialValue: "Cần mua xăng",
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        type: stepperType,
        currentStep: currentStep,
        onStepContinue: next,
        onStepCancel: cancel,
        onStepTapped: (step) => goTo(step),
        controlsBuilder: (BuildContext context,
            {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
          return Container(
            margin: EdgeInsets.only(top: 60),
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
