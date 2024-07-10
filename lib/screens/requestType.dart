
import 'package:flutter/material.dart';
import 'package:mdina1/screens/requestNewStepper.dart';
import 'package:mdina1/screens/requestStepper.dart';

import '../widgets/textTabBar.dart';

class RequestType extends StatefulWidget {
  const RequestType({Key? key}) : super(key: key);

  @override
  State<RequestType> createState() => _RequestTypeState();
}

class _RequestTypeState extends State<RequestType> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff003c70),
          centerTitle: true,
          title: const Text('تقديم طلب الالتحاق ',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Color(0xffac8600),
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none, // Remove underline
          ),
          ),
          bottom: const TabBar(

            indicatorColor: Color(0xffac8600),
            indicatorWeight: 8,
            labelColor: Color(0xffac8600),
            unselectedLabelColor : Colors.white,

            tabs: [
              Tab(
                child: TextTabBar(text:'الطلاب المستجدين',),
              ),
              Tab(
                child:
                TextTabBar(text:'الطلاب القدامى',),
              ),

            ],
          ),
        ),
           //floatingActionButton: FloatingActionButton(onPressed: (){OldStudentCubit.get(context).submitOldStudent();}),
        body: const TabBarView(
         children: [
           RequestNewStepper(),  // القدامى
           RequestStepper(), // المستجدين


         ],

          ),
      ),
    );
  }
}

