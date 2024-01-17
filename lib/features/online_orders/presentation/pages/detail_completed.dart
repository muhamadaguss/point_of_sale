import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/constants.dart';

class DetailCompleted extends StatefulWidget {
  const DetailCompleted({super.key});

  @override
  State<DetailCompleted> createState() => _DetailCompletedState();
}

class _DetailCompletedState extends State<DetailCompleted> {
  List<Map<String, dynamic>> order = [
    {
      "id": 0,
      "name": "Quarter Pounder With Cheese Deluxe",
      "quantity": 1,
      "isChecked": false,
    },
    {
      "id": 1,
      "name": "McDouble",
      "quantity": 2,
      "isChecked": false,
    },
    {
      "id": 2,
      "name": "Large Fries",
      "quantity": 1,
      "isChecked": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order #0',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            color: Color(black.value),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(
              black.value,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 20.h,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Item',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Qty',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: order.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 15.h,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(white.value),
                          boxShadow: [
                            BoxShadow(
                              color: Color(black.value).withOpacity(.05),
                              spreadRadius: 0,
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 184.w,
                              child: Text(
                                order[index]['name'],
                                style: TextStyle(
                                  fontSize: 13.sp,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            Text(
                              order[index]['quantity'].toString(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Color(darkBlue.value),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(white.value),
                    ),
                  ),
                  Text(
                    '\$15.30',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(white.value),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
