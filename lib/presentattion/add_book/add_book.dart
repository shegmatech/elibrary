import 'dart:io';

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
  TextEditingController author = TextEditingController();
  late File image1;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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

                  SizedBox(height: 20.h),
                  const Text("Author"),
                  SizedBox(height: 5.h),
                  TextField(
                      decoration: const InputDecoration(
                        hintText: 'Author',
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
                      controller: author),

                  GestureDetector(
                    onTap: () async {
                      image1 = await model.selextImage();
                      setState(() {
                        model.isImageSelected = true;
                      });
                    },
                    child: Card(
                      child: SizedBox(
                          height: size.height * 0.1,
                          child: model.isImageSelected
                              ? Image.file(image1, fit: BoxFit.cover)
                              : const Icon(Icons.camera_alt,
                                  size: 60, color: Colors.grey)),
                    ),
                  ),
                  // Spacer(),
                  SizedBox(height: 100.h),

                  model.isBusy
                      ? Center(child: const CircularProgressIndicator())
                      : CustomButton(
                          "Add Book",
                          onPressed: () {
                            model.addBook(
                                bookCover: image1,
                                author: author.text,
                                title: title.text,
                                content: content.text);
                          },
                        )
                ],
              ),
            ),
          )),
    );
  }
}
