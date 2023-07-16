import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_learn/common/entities/course.dart';
import 'package:we_learn/common/entities/routes/routes.dart';
import 'package:we_learn/common/entities/value/colors.dart';
import 'package:we_learn/home/bloc/home_page_blocs.dart';
import 'package:we_learn/home/bloc/home_page_state.dart';
import 'package:we_learn/home/home_controller.dart';
import 'package:we_learn/home/widgets/home_page_widget.dart';

import '../common/entities/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late HomeController _homeController;
  late UserItem userProfile;

  @override
  void initState() {
    super.initState();
    // _homeController = HomeController(context: context);
    // _homeController.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(userProfile.avatar.toString()),
      body:
          BlocBuilder<HomePageBlocs, HomePageStates>(builder: (context, state) {
        // print("Check my status ${state.courseItem}");
        if (state.courseItem.isEmpty) {
          HomeController(context: context).init();
        }
        return Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: homePageText(
                  'Hello',
                  color: AppColors.primaryThirdElementText,
                ),
              ),
              SliverToBoxAdapter(
                  child: homePageText(userProfile.name!, top: 5)),
              SliverPadding(padding: EdgeInsets.only(top: 20.h)),
              SliverToBoxAdapter(child: searchView()),
              SliverToBoxAdapter(child: slidersView(context, state)),
              SliverToBoxAdapter(
                child: menuView(),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.6),
                  delegate: SliverChildBuilderDelegate(
                      childCount: state.courseItem.length,
                      (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.COURSE_DETAIL, arguments: {
                            "id": state.courseItem.elementAt(index).id
                          });
                        },
                        child: courseGrid(state.courseItem[index]));
                  }),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
