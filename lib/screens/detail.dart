import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewRepairManScreen extends StatefulWidget {
  const ViewRepairManScreen({Key? key}) : super(key: key);

  @override
  _ViewRepairManScreenState createState() => _ViewRepairManScreenState();
}

class _ViewRepairManScreenState extends State<ViewRepairManScreen> {
  double _initialRating = 5.0;
  bool _isVertical = false;

  IconData? _selectedIcon;

  @override
  Widget build(BuildContext context) {
    StatusAppController controller = Get.put(StatusAppController());
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 350,
                    color: Color(0xFFF9AA33),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 40, 330, 0),
                          child: GestureDetector(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 30,
                            ),
                            onTap: () => {Get.back()},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            width: MediaQuery.of(context).size.width / 2,
                            height: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 5),
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(avatar),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 250),
                          child: Text(
                            "Lê Trọng Nhân",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 300),
                    child: Container(
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(50.0),
                            topRight: const Radius.circular(50.0),
                          )),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 25),
                            child: RatingBar.builder(
                              initialRating: _initialRating,
                              minRating: 1,
                              direction:
                                  _isVertical ? Axis.vertical : Axis.horizontal,
                              allowHalfRating: true,
                              unratedColor: Colors.amber.withAlpha(50),
                              itemCount: 5,
                              itemSize: 40.0,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                _selectedIcon ?? Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                setState(() {});
                              },
                              updateOnDrag: true,
                            ),
                          ),
                          Column(
                            children: [
                              // Padding(
                              //   padding: const EdgeInsets.fromLTRB(35, 0, 35, 35),
                              //   child: Text("Cá nhân",
                              //       style: TextStyle(
                              //         fontSize: 22,
                              //         fontWeight: FontWeight.bold,
                              //         color: Colors.black,
                              //       )),
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(35, 0, 35, 35),
                                child: Row(
                                  children: [
                                    Text(
                                      "Địa chỉ: ",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      " 283C Đ. Cây Trâm, Phường 8",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(35, 0, 35, 35),
                                child: Row(
                                  children: [
                                    Text(
                                      "Số xe đã sửa: ",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      " 53",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(35, 0, 35, 35),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      child: Text(
                                        "Một số đánh giá",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(30, 10, 30, 10),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Tâm: ",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Tốt",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(30, 10, 30, 10),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Nhân: ",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Sửa xe nhanh, nhiệt tình",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(30, 10, 30, 10),
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Danh: ",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Vui vẻ dễ nói chuyện",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 30, bottom: 10, right: 30, top: 10),
                                height: 80,
                                width: double.infinity,
                                color: Colors.white,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty.all(6),
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed))
                                        return Colors.white70;
                                      return Colors
                                          .red; // Defer to the widget's default.
                                    }),
                                  ),
                                  onPressed: () {
                                    controller.setStatus(1);
                                    Get.back();
                                  },
                                  child: Text(
                                    'Hủy sửa xe',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(
    String labelText, String placeholder, bool isPasswordTextField) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(35, 0, 35, 35.0),
    child: TextField(
      readOnly: true,
      decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    ),
  );
}
