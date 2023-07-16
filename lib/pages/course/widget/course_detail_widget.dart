import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_learn/common/entities/value/colors.dart';
import 'package:we_learn/common/entities/widgets/base_text_widget.dart';

AppBar buildAppBard() {
  return AppBar(
    centerTitle: true,
    title: reuseableText('Course Detail'),
  );
}

Widget thumbnail() {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: const BoxDecoration(
        image: DecorationImage(
      image: AssetImage('assets/icons/Image1.png'),
    )),
  );
}

Widget menuViewd() {
  return Container(
    width: 325.w,
    child: Row(children: [
      GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(7.w)),
          child: reuseableText(
            'Author Page',
            color: AppColors.primaryElementText,
            fontWeight: FontWeight.normal,
            fontSize: 10.sp,
          ),
        ),
      ),
      _iconAndNum("assets/icons/people.png", 0),
      _iconAndNum("assets/icons/star.png", 0)
    ]),
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 20.w,
          height: 20.h,
        ),
        reuseableText(num.toString(),
            color: AppColors.primaryThirdElementText,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal)
      ],
    ),
  );
}

Widget goBuyButton(String buttonName) {
  return Container(
    padding: EdgeInsets.only(top: 13.h),
    width: 330.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: AppColors.primaryElement,
      borderRadius: BorderRadius.circular(10.w),
      border: Border.all(color: AppColors.primaryElement),
    ),
    child: Text(
      buttonName,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.primaryElementText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}

Widget descriptionText() {
  return reuseableText(
      "Course Description Course DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse Description",
      color: AppColors.primaryThirdElementText,
      fontWeight: FontWeight.normal,
      fontSize: 11.sp);
}

Widget courseSummaryTitle(BuildContext context) {
  return reuseableText(" The Course Includes", fontSize: 14.sp);
}

var imageInfo = <String, String>{
  '26 Hours Video': 'video_detail.png',
  'Payment details': 'file_detail.png',
  'Achievement': 'download_detail.png',
};

Widget courseSummaryView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
          imageInfo.length,
          (index) => GestureDetector(
                onTap: () => Null,
                child: Container(
                  margin: EdgeInsets.only(top: 15.h),
                  child: Row(
                    children: [
                      Container(
                        width: 30.w,
                        height: 30.h,
                        // padding: EdgeInsets.all(7.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: AppColors.primaryElement,
                        ),
                        child: Image.asset(
                            'assets/icons/${imageInfo.values.elementAt(index)}'),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(imageInfo.keys.elementAt(index),
                          style: TextStyle(
                              color: AppColors.primarySecondaryElementText,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp)),
                    ],
                  ),
                ),
              ))
    ],
  );
}

Widget courseLessonList() {
  return Container(
    width: 325.w,
    height: 80.h,
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(10.w),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 1))
        ]),
    child: InkWell(
      onTap: () {},
      child: Row(children: [
        // For Image and text
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.h),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/icons/Image1.png'),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // List item title

                _listContainer(),
                // List Item Description
                _listContainer(
                    fontSize: 10,
                    color: AppColors.primaryThirdElementText,
                    fontWeight: FontWeight.normal),
              ],
            )
          ],
        ),
        //  For Showing the right arrow
        Container(
          child: Image(
              width: 24.w,
              height: 24.h,
              image: AssetImage('assets/icons/arrow_right.png')),
        )
      ]),
    ),
  );
}

Widget _listContainer(
    {double fontSize = 13,
    Color color = AppColors.primaryText,
    fontWeight = FontWeight.bold}) {
  return Container(
    width: 200.w,
    margin: EdgeInsets.only(left: 6.w),
    child: Text(
      'UI Design',
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
          color: color, fontSize: fontSize.sp, fontWeight: FontWeight.bold),
    ),
  );
}
