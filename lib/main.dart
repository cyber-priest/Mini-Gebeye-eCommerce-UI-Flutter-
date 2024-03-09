import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_gebeya/pages/cart.dart';
import 'package:mini_gebeya/pages/explore.dart';
import 'package:mini_gebeya/pages/profile.dart';
import 'package:mini_gebeya/pages/search.dart';
import 'package:mini_gebeya/pages/startScreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Gebeya',
      theme: ThemeData(
        primaryColor: Colors.green.shade300,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.green.shade400,
              secondary: Colors.green.shade200,
            ),
        // scaffoldBackgroundColor: Colors.green[50],
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.green[50],
            titleTextStyle: TextStyle(
              color: Colors.black87,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: IconThemeData(color: Colors.green.shade300)),
      ),
      home: StartScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _selectedPage = 0;

  List<Widget> pages = [ExplorePage(), SearchPage(), CartPage(), ProfilePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) => setState(() {
          _selectedPage = index;
        }),
        controller: _pageController,
        children: [...pages],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedPage,
        height: 60.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.green.shade300,
          ),
          Icon(
            Icons.search,
            size: 30,
            color: Colors.green.shade300,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            size: 30,
            color: Colors.green.shade300,
          ),
          Icon(
            Icons.account_circle_outlined,
            size: 30,
            color: Colors.green.shade300,
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.green.shade300,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) => _onItemTapped(index),
      ),
    );
  }
}
