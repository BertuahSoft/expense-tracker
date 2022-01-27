import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expense_tracker/src/domain/auth/user.dart';
import 'package:expense_tracker/src/domain/auth/value_objects.dart';
import 'package:expense_tracker/src/domain/core/value_object.dart';
import 'package:expense_tracker/src/presentation/pages/core/rounded_gradient_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:expense_tracker/src/application/core/auth_status/cubit/auth_status_cubit.dart';
import 'package:expense_tracker/src/core/theme/light.dart';
import 'package:expense_tracker/src/presentation/routes/app_router.dart';
import 'package:expense_tracker/src/presentation/widgets/drawer/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Daily Report',
          style: TextStyle(fontSize: 10.sp),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.notifications),
            ),
          ),
        ],
      ),
      drawer: MainDrawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            MainDrawerHeader(),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: const Divider(
                color: ColorLight.blackSecond,
                thickness: 0.5,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Transaction History'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: const Divider(
                color: ColorLight.blackSecond,
                thickness: 0.5,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.category_outlined),
              title: Text('Categories'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: const Divider(
                color: ColorLight.blackSecond,
                thickness: 0.5,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: const Divider(
                color: ColorLight.blackSecond,
                thickness: 0.5,
              ),
            ),
            SizedBox(
              height: 180.h,
            ),
            Padding(
              padding: EdgeInsets.all(15.r),
              child: RoundedGradientButton(
                  text: "Logout",
                  width: 220.w,
                  onpressed: () {
                    context.read<AuthStatusCubit>().signedOut();
                  }),
            )
          ],
        ),
      ),
      body: BlocConsumer<AuthStatusCubit, AuthStatusState>(
        listener: (context, state) {
          state.map(
            initial: (_) {},
            authenticated: (_) {},
            unauthenticated: (_) {
              context.router.replaceAll([const SignInRoute()]);
            },
          );
        },
        builder: (context, state) {
          return Container();
        },
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class MainDrawerHeader extends StatelessWidget {
  MainDrawerHeader({
    Key? key,
  }) : super(key: key);

  final dummy = User(
      id: UniqueId(),
      name: StringSingleLine("Adryan Eka Vandra"),
      emailAddress: EmailAddress("john_doe@example.com"),
      photoUrl: "https://i.pravatar.cc/150?img=58");

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3))
          ],
          gradient: lightGradient,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.r)),
          image: DecorationImage(
            alignment: Alignment.topLeft,
            image: Svg(
              'assets/images/drawer_header.svg',
              size: Size(109.w, 109.h),
            ),
          )),
      child: Row(children: [
        CircleAvatar(
          radius: 32.5.r,
          backgroundImage: CachedNetworkImageProvider(dummy.photoUrl),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              dummy.name.getOrElse("Dummy"),
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              dummy.emailAddress.getOrElse("Dummy"),
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 10.sp,
                overflow: TextOverflow.clip,
              ),
            )
          ]),
        )
      ]),
    );
  }
}
