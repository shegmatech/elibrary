import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../application/home/home_view_model.dart';
import '../../../infrastructure/auth/models/book_model.dart';
import '../../routes/app_router.gr.dart';
// import '../../add_book/add_book.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (h) {
        h.fetchForUser();
      },
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Home", style: TextStyle(fontSize: 20.sp)),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0.w, horizontal: 20.w),
              child: Text("List of Available Books",
                  style: TextStyle(fontSize: 15.sp, color: Colors.grey[500])),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: model.bookList.length,
                itemBuilder: (context, index) {
                  BookModel bm = model.bookList[index];
                  return InkResponse(
                    onTap: bm.isApproved && bm.isRequested
                        ? () {}
                        : () {
                            AutoRouter.of(context)
                                .push(BookDetails(book: bm, isAdmin: false));
                          },
                    child: Card(
                        color: bm.isApproved && bm.isRequested
                            ? Colors.grey[300]
                            : Colors.transparent,
                        // color: Colors.amber[0],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: size.height * 0.08,
                              color: Colors.amber[0],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(bm.title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.sp,
                                            fontStyle: FontStyle.italic)),
                                    Text(bm.author,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15.sp,
                                            fontStyle: FontStyle.italic)),
                                  ],
                                ),
                              )),
                        )),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
