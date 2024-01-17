import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:point_of_sale/constants/constants.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> choose = [
    'This week',
    'This month',
    'This year',
  ];
  int current = 1;
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;
  late List<BarChartGroupData> rawBarGroups2;
  late List<BarChartGroupData> showingBarGroups2;
  late List<BarChartGroupData> rawBarGroups3;
  late List<BarChartGroupData> showingBarGroups3;
  final double width = 15.w;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 100, 500, 300);
    final barGroup2 = makeGroupData(1, 200, 150, 400);
    final barGroup3 = makeGroupData(2, 600, 350, 280);
    final barGroup4 = makeGroupData(3, 500, 120, 240);

    final barGroup21 = makeGroupData(0, 100, 500, 300);
    final barGroup22 = makeGroupData(1, 300, 150, 700);
    final barGroup23 = makeGroupData(2, 700, 1000, 280);
    final barGroup24 = makeGroupData(3, 500, 1200, 2140);

    final barGroup31 = makeGroupData(0, 1030, 5600, 3040);
    final barGroup32 = makeGroupData(1, 2100, 1540, 4700);
    final barGroup33 = makeGroupData(2, 600, 3150, 2380);
    final barGroup34 = makeGroupData(3, 5600, 1820, 2540);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
    ];

    final items2 = [
      barGroup21,
      barGroup22,
      barGroup23,
      barGroup24,
    ];

    final items3 = [
      barGroup31,
      barGroup32,
      barGroup33,
      barGroup34,
    ];

    rawBarGroups = items;

    rawBarGroups2 = items2;

    rawBarGroups3 = items3;

    showingBarGroups = rawBarGroups;

    showingBarGroups2 = rawBarGroups2;

    showingBarGroups3 = rawBarGroups3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 52.w,
              height: 52.h,
            ),
            const Spacer(),
            Text(
              '28 October 2021 Thursday | 17:30',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
              ),
            ),
            const Spacer(),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Image.asset(
              'assets/images/menu.png',
              width: 24.w,
              height: 24.h,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 20.h,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                itemList(
                  'assets/images/revenue.png',
                  'Revenue',
                  '\$123 456',
                ),
                itemList(
                  'assets/images/menu.png',
                  'Orders',
                  '1039',
                ),
                itemList(
                  'assets/images/walk-ins.png',
                  'Walk-ins',
                  '840',
                ),
                itemList(
                  'assets/images/online-order.png',
                  'Online Orders',
                  '199',
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5.w, top: 20.h, right: 5.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(white.value),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Ordered',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ' Items',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        dataTable(),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 5.w, right: 5.w, top: 5.h, bottom: 60.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 17.w, vertical: 20.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(white.value),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Overall',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Statistics',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/settings.png',
                              width: 20.w,
                              height: 20.h,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 30.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: choose.length,
                            separatorBuilder: (context, index) => SizedBox(
                              width: 8.w,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.r),
                                    color: current == index
                                        ? Color(darkBlue.value)
                                        : Color(white.value),
                                  ),
                                  child: Text(
                                    choose[index],
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: current == index
                                          ? Color(white.value)
                                          : Color(black.value),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        listStatistic(showingBarGroups,
                            'assets/images/mcmeal.png', 'Meals'),
                        listStatistic(showingBarGroups2,
                            'assets/images/pounder.png', 'Burgers'),
                        listStatistic(showingBarGroups3,
                            'assets/images/ice_cream.png', 'Desserts'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dataTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 15.w,
        dataRowMaxHeight: 50.h,
        headingTextStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        columns: const [
          DataColumn(
            label: Expanded(
              child: Text(
                'Item',
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Orders',
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'PPU',
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Revenue',
              ),
            ),
          ),
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/pounder.png',
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 140.w,
                      child: const Text(
                        'Quater Pounder with Cheese',
                      ),
                    ),
                  ],
                ),
              ),
              const DataCell(
                Text(
                  '5310',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const DataCell(
                Text(
                  '\$113.99',
                ),
              ),
              const DataCell(
                Text(
                  '\$212214.70',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: [
              DataCell(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/large_soda.png',
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 140.w,
                      child: const Text(
                        'Large Soda',
                      ),
                    ),
                  ],
                ),
              ),
              const DataCell(
                Text(
                  '520',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const DataCell(
                Text(
                  '\$2.99',
                ),
              ),
              const DataCell(
                Text(
                  '\$1554.80',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: [
              DataCell(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/mcmeal.png',
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 140.w,
                      child: const Text(
                        'Big Mac McMeal',
                      ),
                    ),
                  ],
                ),
              ),
              const DataCell(
                Text(
                  '502',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const DataCell(
                Text(
                  '\$6.99',
                ),
              ),
              const DataCell(
                Text(
                  '\$3508.98',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: [
              DataCell(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/pounder.png',
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 140.w,
                      child: const Text(
                        'Big Mac',
                      ),
                    ),
                  ],
                ),
              ),
              const DataCell(
                Text(
                  '502',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const DataCell(
                Text(
                  '\$3.99',
                ),
              ),
              const DataCell(
                Text(
                  '\$3508.98',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: [
              DataCell(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/mcchicken.png',
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 140.w,
                      child: const Text(
                        'McChicken Deluxe',
                      ),
                    ),
                  ],
                ),
              ),
              const DataCell(
                Text(
                  '492',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const DataCell(
                Text(
                  '\$3.99',
                ),
              ),
              const DataCell(
                Text(
                  '\$1963.08',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: [
              DataCell(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/ice_cream.png',
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 140.w,
                      child: const Text(
                        'Orea McFlurry',
                      ),
                    ),
                  ],
                ),
              ),
              const DataCell(
                Text(
                  '450',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const DataCell(
                Text(
                  '\$3.99',
                ),
              ),
              const DataCell(
                Text(
                  '\$1795.59',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: [
              DataCell(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/pounder.png',
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    SizedBox(
                      width: 140.w,
                      child: const Text(
                        'McDouble',
                      ),
                    ),
                  ],
                ),
              ),
              const DataCell(
                Text(
                  '450',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const DataCell(
                Text(
                  '\$1.99',
                ),
              ),
              const DataCell(
                Text(
                  '\$895.50',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget itemList(String icon, String title, String subtitle) {
    return Container(
      width: 75.w,
      height: 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: Color(darkBlue.value),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              icon,
              width: 20.w,
              height: 20.h,
              color: Colors.white,
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                  maxLines: 2,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget barChart(List<BarChartGroupData> showData) {
    return SizedBox(
      height: 100.h,
      child: BarChart(
        BarChartData(
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Color(lightBlue2.value),
              tooltipRoundedRadius: 8.r,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  rod.toY.round().toString(),
                  TextStyle(
                    color: Color(darkBlue.value),
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: bottomTitles,
                reservedSize: 42,
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: showData,
          gridData: const FlGridData(show: false),
        ),
      ),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Week 1', 'Week 2', 'Week 3', 'Week 4'];

    final Widget text = Text(
      titles[value.toInt()],
      style: TextStyle(
        color: Color(darkBlue.value),
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2, double y3) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Color(darkBlue.value),
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: Color(blue.value),
          width: width,
        ),
        BarChartRodData(
          toY: y3,
          color: Color(lightBlue.value),
          width: width,
        ),
      ],
    );
  }

  Widget barDetail(Color color, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 29.w,
            height: 4.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: color,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget listStatistic(
      List<BarChartGroupData> showData, String image, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                image,
                width: 25.w,
                height: 25.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          barChart(showData),
          SizedBox(
            height: 15.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              barDetail(Color(darkBlue.value), 'Big Mac McMeal'),
              barDetail(Color(blue.value), 'Quarter Pounder McMeal'),
              barDetail(Color(lightBlue.value), 'Chicken Deluxe McMeal'),
            ],
          )
        ],
      ),
    );
  }
}
