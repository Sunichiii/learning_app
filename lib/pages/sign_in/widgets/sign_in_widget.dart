import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';


//we need context for accessing bloc

Widget buildThirdPartyLogin(BuildContext context) {
  return Center(
    child: Container(
        margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
        padding: EdgeInsets.only(left: 25.w, bottom: 25.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _reusableIcons("google"),
            _reusableIcons("apple"),
            _reusableIcons("facebook"),
          ],
        )),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 50.w,
      height: 50.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey[500],
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String value)?func
    ) {
  return Container(
    height: 50.h,
    width: 325.w,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value)=> func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintStyle: TextStyle(color: Colors.grey[500])),
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return SizedBox(
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot Password?",
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 12.sp,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryText),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(String buttonName, String buttonType, void Function()? func) {
  return GestureDetector(
    onTap: func,
    child: Container(
      width: 330.w,
      height: 50.h,
      margin: EdgeInsets.only(
          left: 10.w, right: 10.w, top: buttonType == "login" ? 30.h : 10.h),
      decoration: BoxDecoration(
        color: buttonType == "login"
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(
            //check for registration button color
            color: buttonType == "login"
                ? Colors.transparent
                : AppColors.primaryBackground),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
            color: Colors.grey,
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: buttonType == "login"
                  ? AppColors.primaryBackground
                  : AppColors.primaryText),
        ),
      ),
    ),
  );
}
