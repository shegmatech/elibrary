import 'package:auto_route/auto_route.dart';
import 'package:elibrary/application/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../infrastructure/auth/models/book_model.dart';
import '../../general_widgets/custom_button.dart';

class BookDetails extends StatefulWidget {
  final BookModel book;
  final bool isAdmin;
  const BookDetails({super.key, required this.book, required this.isAdmin});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text("Book Details", style: TextStyle(fontSize: 20.sp)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text("Book Tile",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(widget.book.title,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text("Book Content",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(widget.book.content,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text("Book Author",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(widget.book.author,
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: 100.h,
                  ),
                  if (widget.isAdmin && !widget.book.isApproved)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                      child: widget.book.isRequested
                          ? Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.w),
                                  child: const Text(
                                      "This book has been requested"),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          model.acceptRequest(
                                              bookTitle: widget.book.title);
                                        },
                                        child: Text("Accept")),
                                    ElevatedButton(
                                        onPressed: () {
                                          AutoRouter.of(context).pop();
                                        },
                                        child: Text("Deny"))
                                  ],
                                )
                              ],
                            )
                          : Container(),
                    )
                  else if (!widget.isAdmin)
                    model.isBusy
                        ? Center(child: CircularProgressIndicator())
                        : CustomButton(
                            "Request Book",
                            onPressed: () {
                              model.requestBook(bookTitle: widget.book.title);
                            },
                          )
                ],
              ),
            ),
          )),
    );
  }
}
