import 'package:elibrary/application/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../general_widgets/custom_button.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  TextEditingController title = TextEditingController();

  TextEditingController content = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text("Add Book", style: TextStyle(fontSize: 20.sp)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  const Text("Title"),
                  SizedBox(height: 5.h),
                  TextField(
                      decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          )),
                      style: const TextStyle(color: Colors.black),
                      controller: title),
                  SizedBox(height: 20.h),
                  const Text("Content"),
                  SizedBox(height: 5.h),
                  TextField(
                      decoration: const InputDecoration(
                        hintText: 'Content',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      style: TextStyle(color: Colors.black),
                      maxLines: null,
                      controller: content),
                  // Spacer(),
                  SizedBox(height: 100.h),

                  model.isBusy
                      ? Center(child: const CircularProgressIndicator())
                      : CustomButton(
                          "Add Book",
                          onPressed: () {
                            model.addBook(
                                title: title.text, content: content.text);
                          },
                        )
                ],
              ),
            ),
          )),
    );
  }
}
