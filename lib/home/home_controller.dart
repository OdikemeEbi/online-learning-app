import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_learn/common/entities/apis/course_api.dart';
import 'package:we_learn/common/entities/user.dart';
import 'package:we_learn/global.dart';
import 'package:we_learn/home/bloc/home_page_blocs.dart';

import 'bloc/home_page_events.dart';

class HomeController {
  late BuildContext context;

  UserItem get userProfile => Global.storageService.getUserProfile();

  // Singleton Class
  static final HomeController _singleton = HomeController._internal();
  HomeController._internal();
//  This is a factory constructor
// Makes sure the original only one instance
  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }

  // HomeController({required this.context});

  Future<void> init() async {
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseAPI.courseList();
      if (result.code == 200) {
        if (result.data!.isNotEmpty) {
          if (context.mounted) {
            context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
          }
          print(result.data![0].name);
        } else {
          print("Result data is empty.");
        }
      } else {
        print(result.code);
      }
    }
  }
}
