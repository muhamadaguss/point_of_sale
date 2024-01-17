import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_of_sale/constants/constants.dart';
import 'package:point_of_sale/features/online_orders/presentation/pages/detail_completed.dart';
import 'package:point_of_sale/features/online_orders/presentation/pages/detail_pending.dart';

class OnlineOrdersPage extends StatefulWidget {
  const OnlineOrdersPage({super.key});

  @override
  State<OnlineOrdersPage> createState() => _OnlineOrdersPageState();
}

class _OnlineOrdersPageState extends State<OnlineOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Online',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Color(black.value),
                  ),
                ),
                TextSpan(
                  text: ' Orders',
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Color(black.value),
                  ),
                ),
              ],
            ),
          ),
          centerTitle: false,
          bottom: TabBar(
            labelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
            labelColor: Color(black.value),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: Color(black.value),
                width: 2.w,
              ),
            ),
            unselectedLabelColor: Color(black.value),
            unselectedLabelStyle: TextStyle(
              fontSize: 12.sp,
            ),
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            indicatorSize: TabBarIndicatorSize.label,
            tabs: const [
              Tab(
                text: 'Pending',
              ),
              Tab(
                text: 'Completed',
              )
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            tabPending(),
            tabCompleted(),
          ],
        ),
      ),
    );
  }

  Widget tabPending() {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 50.h),
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DetailPending(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: Color(white.value),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'order #$index',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        '17:04',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Number of items',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$10.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        width: 67.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: Color(green.value),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: Text(
                            'Paid',
                            style: TextStyle(
                              color: Color(white.value),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget tabCompleted() {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 50.h),
      child: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DetailCompleted(),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: Color(white.value),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'order #$index',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        '17:04',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Number of items',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$10.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        width: 67.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: Color(green.value),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: Text(
                            'Paid',
                            style: TextStyle(
                              color: Color(white.value),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
