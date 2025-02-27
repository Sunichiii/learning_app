import 'package:e_learning/common/routes/names.dart';
import 'package:e_learning/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          Text(
            "Profile",
            style: TextStyle(
                color: AppColors.primaryText, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 24.w,
            height: 24.w,
            child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ],
      ),
    ),
  );
}

//profile icon and edit button
Widget profileIconAndEditButton() {
  return Container(
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: DecorationImage(
        image: AssetImage("assets/icons/headpic.png"),
      ),
    ),
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w, bottom: 3.w),
    child: Image(
        height: 25.w,
        width: 25.w,
        image: AssetImage("assets/icons/edit_3.png")),
  );
}

//settings section buttons

var imagesInfo =<String, String>{
  // aagadi ko call garda keys bhanne ani images lai call garda values bahnne
  "Settings":"settings.png",
  "Payment Details":"credit-card.png",
  "Achievement":"award.png",
  "Love":"heart(1).png",
  "Reminders":"cube.png",
};
Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(imagesInfo.length, (index) => GestureDetector(
        onTap: ()=>Navigator.of(context).pushNamed(AppRoutes.SETTINGS),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15.h),
              width: 40.w,
              height: 40.h,
              padding: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: AppColors.primaryElement),
              child: Image.asset("assets/icons/${imagesInfo.values.elementAt(index)}"),
            ),
            SizedBox(width: 15.w),
            Text(
              imagesInfo.keys.elementAt(index),
              style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
              ),
            )
          ],
        ),
      ))
    ],
  );
}
