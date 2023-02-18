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
                return Text(bm.title);
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
