import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdownSearch extends StatefulWidget {
  final String title;
  final List<SelectedListItem> listdata;
  final TextEditingController dropdownSelectedName;
  final TextEditingController dropdownSelectedID;
  const CustomDropdownSearch(
      {super.key,
      required this.title,
      required this.listdata,
      required this.dropdownSelectedName,
      required this.dropdownSelectedID});

  @override
  State<CustomDropdownSearch> createState() => _CustomDropdownSearchState();
}

class _CustomDropdownSearchState extends State<CustomDropdownSearch> {
  showDropdownSearch(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: Text(
          '155'.tr,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata,
        selectedItems: (List<dynamic> selectedList) {
          widget.dropdownSelectedName.text = selectedList[0].name;
          widget.dropdownSelectedID.text = selectedList[0].value;
          print("============================================");
          print(widget.dropdownSelectedName.text);
          print(widget.dropdownSelectedID.text);
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: widget.dropdownSelectedName,
        cursorColor: Colors.black,
        onTap: () {
          FocusScope.of(context).unfocus();
          showDropdownSearch(context);
        },
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
                showDropdownSearch(context);
              },
              child: const Icon(Icons.arrow_drop_down),
            ),
            // label: Container(
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     child: Text(widget.title)),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            hintText: widget.title,
            hintStyle: const TextStyle(fontSize: 13),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            )),
        // decoration: InputDecoration(
        //   filled: true,
        //   fillColor: Colors.black12,
        //   contentPadding:
        //       const EdgeInsets.only(left: 8, bottom: -1, top: -1, right: 15),
        //   hintText: widget.title,
        //   border: const OutlineInputBorder(
        //     borderSide: BorderSide(
        //       width: 0,
        //       style: BorderStyle.none,
        //     ),
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(3.0),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
