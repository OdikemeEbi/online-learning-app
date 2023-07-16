import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_learn/pages/course/widget/course_detail_widget.dart';

import '../../../common/entities/widgets/base_text_widget.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late var id;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as Map;
    print(id.values.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBard(),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  first Big image
                    thumbnail(),
                    SizedBox(height: 15.h),
                    // three button or image
                    menuViewd(),
                    SizedBox(height: 15.h),
                    // course description title
                    reuseableText("Course Description"),

                    SizedBox(height: 15.h),
                    // course Description
                    descriptionText(),
                    SizedBox(height: 20.h),
                    // course but button
                    Center(
                      child: goBuyButton("Go Buy "),
                    ),
                    SizedBox(height: 20.h),

                    // course Summery title
                    courseSummaryTitle(context),
                    // course Summary
                    courseSummaryView(context),
                    SizedBox(height: 15.h),

                    reuseableText(" Lesson List"),
                    courseLessonList()
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
