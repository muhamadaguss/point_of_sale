import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_of_sale/constants/constants.dart';

class DetailPending extends StatefulWidget {
  const DetailPending({super.key});

  @override
  State<DetailPending> createState() => _DetailPendingState();
}

class _DetailPendingState extends State<DetailPending> {
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
            child: ListView.separated(
              itemCount: order.length,
              separatorBuilder: (context, index) => SizedBox(
                height: 10.h,
              ),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
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
                  child: CheckboxListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                    value: order[index]['isChecked'],
                    onChanged: (bool? value) {
                      setState(() {
                        order[index]['isChecked'] = value;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              height: 40.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  backgroundColor:
                      order.every((element) => element['isChecked'] == true)
                          ? Color(darkBlue.value)
                          : Color(lightGrey.value),
                ),
                onPressed: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Complete',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(order.every(
                                (element) => element['isChecked'] == true)
                            ? white.value
                            : grey.value),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Color(
                          order.every((element) => element['isChecked'] == true)
                              ? white.value
                              : grey.value),
                      size: 25.sp,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
