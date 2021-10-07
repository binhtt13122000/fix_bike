import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/models/FeatureBike.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePurchaseScreen extends StatefulWidget {
  @override
  _UpdatePurchaseScreenState createState() => _UpdatePurchaseScreenState();
}

List<FeatureBike> listProblem = [
  new FeatureBike(name: "Lưới tản nhiệt", price: 500000),
  new FeatureBike(name: "Cần sang số", price: 250000),
  new FeatureBike(name: "Nắp ca-pô", price: 150000),
  new FeatureBike(name: "Gương chiếu hậu", price: 100000),
  new FeatureBike(name: "Tay ga", price: 80000),
  new FeatureBike(name: "Khoá yên", price: 50000),
  new FeatureBike(name: "Bàn đạp thắng sau", price: 60000),
  new FeatureBike(name: "Cao su giảm chấn yên xe", price: 70000),
];

class _UpdatePurchaseScreenState extends State<UpdatePurchaseScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  static List<FeatureBike> friendsList = [listProblem[0], listProblem[1]];
  final StatusAppController statusAppController =
      Get.put(StatusAppController());
  static double totalPrice = 850000;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Cập nhật thanh toán'),
        centerTitle: true,
        backgroundColor: Color(0xFFF9AA33),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Thêm link kiện',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                ..._getItems(),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Tiền sửa xe: 100.000vnđ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      Text(
                        "Tổng hóa đơn: ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        totalPrice.toStringAsFixed(0) + "vnđ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          // minimumSize: Size(double.infinity, 40),
                          // double.infinity is the width and 30 is the height
                          primary: Color(0xFFF9AA33),
                          onPrimary: Colors.black),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          statusAppController.setTotalPrice(totalPrice);
                          statusAppController.setUpdatePurchase(true);
                          Get.back();
                        }
                      },
                      child: Text('Thanh toán', style: TextStyle(color: Colors.black),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _getItems() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < friendsList.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: FriendTextFields(i)),
            SizedBox(
              width: 16,
            ),
            // we need add button at last friends row
            _addRemoveButton(i == friendsList.length - 1, i),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  /// add / remove button
  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          totalPrice += friendsList[0].price;
          friendsList.insert(0, listProblem[0]);
          setState(() {

          });
        } else
          friendsList.removeAt(index);
        totalPrice -= friendsList[index].price;
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FriendTextFields extends StatefulWidget {
  final int index;

  FriendTextFields(this.index);

  @override
  _FriendTextFieldsState createState() => _FriendTextFieldsState();
}

class _FriendTextFieldsState extends State<FriendTextFields> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _nameController.text = _UpdatePurchaseScreenState.friendsList[widget.index].name ?? '';
    });
    String _myStateProblem = listProblem[widget.index].name;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              // isExpanded: true,
              value: _myStateProblem,
              iconSize: 30,
              icon: null,
              style: TextStyle(color: Colors.black54, fontSize: 16),
              onChanged: (String? newValue) {
                setState(() {
                  _myStateProblem = newValue!;
                });
              },
              hint: Text("Select state"),
              items: listProblem
                  .map((item) => new DropdownMenuItem(
                        child: Text(item.name),
                        value: item.name,
                      ))
                  .toList(),
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(
              "Giá tiền: " + listProblem[widget.index].price.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )),
      ],
    );
    // return TextFormField(
    //   controller: _nameController,
    //   onChanged: (v) => _MyFormState.friendsList[widget.index].name = v,
    //   decoration: InputDecoration(hintText: 'Enter your friend\'s name'),
    //   validator: (v) {
    //     if (v!.trim().isEmpty) return 'Please enter something';
    //     return null;
    //   },
    // );
  }
}
