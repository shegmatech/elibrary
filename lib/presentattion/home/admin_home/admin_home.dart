import 'package:auto_route/auto_route.dart';
import 'package:elibrary/application/home/home_view_model.dart';
import 'package:elibrary/presentattion/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../infrastructure/auth/models/book_model.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (h) {
        h.fetchBooksForAdmin();
      },
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Home", style: TextStyle(fontSize: 20.sp)),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: model.filteredBooList.length,
              itemBuilder: (context, index) {
                BookModel bm = model.filteredBooList[index];
                return InkResponse(
                  onTap: () {
                    AutoRouter.of(context)
                        .push(BookDetails(book: bm, isAdmin: true));
                  },
                  child: Card(
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
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              AutoRouter.of(context).push(const AddBook());
            }),
      ),
    );
  }
}
