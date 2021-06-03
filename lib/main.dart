import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insabelle_task/core/providers/category_brand_provider.dart';
import 'package:insabelle_task/core/providers/product_list_provider.dart';
import 'package:insabelle_task/core/theme_colors.dart';
import 'package:insabelle_task/pages/filter.dart';
import 'package:insabelle_task/pages/home.dart';
import 'package:insabelle_task/pages/product_list_page.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CategoryBrandProvider(),
          child: HomePage(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProductListProvider(),
          child: ProductListPage(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Insabelle',
        builder: (context, child) {
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          );
        },
        theme: ThemeData(
            primaryColor: ThemeColors.primary,
            accentColor: ThemeColors.accent,
            textTheme: GoogleFonts.openSansTextTheme(
              Theme.of(context).textTheme,
            ),
            scaffoldBackgroundColor: ThemeColors.scaffoldColor,
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                      (states) => const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                    ),
                    shape: MaterialStateProperty.resolveWith(
                        (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ))))),
        home: HomePage(),
        routes: {
          ProductListPage.routeName: (ctx) => ProductListPage(),
          FilterPage.routeName: (ctx) => FilterPage(),
        },
      ),
    );
  }
}
