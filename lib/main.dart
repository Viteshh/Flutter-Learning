import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/practice/counter.dart';
import 'package:first_app/dashboard/home_page.dart';

import 'package:first_app/practice/login_screen.dart';
import 'package:first_app/practice/signup_screen.dart';
import 'package:first_app/product_listing/category_view.dart';
import 'package:first_app/product_listing/favourite_provider.dart';
import 'package:first_app/product_listing/product_details.dart';
import 'package:first_app/product_listing/product_list.dart';
import 'package:first_app/product_listing/product_model.dart';
import 'package:first_app/provider/counter_provider.dart';
import 'package:first_app/practice/shared_preference.dart';
import 'package:first_app/user_profile/edit_profile.dart';
import 'package:first_app/user_profile/save_profile.dart';
import 'package:first_app/user_profile/user_profile_page.dart';

import 'package:first_app/todolist/todos_screen.dart';
import 'package:first_app/todolist/todo_screen.dart';
import 'package:first_app/user_profile/sign_in_page.dart';
import 'package:first_app/user_profile/sign_up_page.dart';
import 'package:first_app/user_profile2/user_model.dart';
import 'package:first_app/user_profile2/view_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dashboard/dashboard.dart';
import 'dashboard/splash_screen.dart';
import 'package:first_app/demo/hero_animation.dart';
import 'package:first_app/demo/explicit_animation.dart';
import 'package:first_app/demo/implicit_animation.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Demo App',
        theme: ThemeData(
          useMaterial3: true,
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        ),
        home: SignIn(),
      ),
    );
  }
}
