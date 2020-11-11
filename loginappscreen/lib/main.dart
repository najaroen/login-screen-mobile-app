import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: Text(
              "Skip",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              pageViewer(
                  content:
                      "สวัสดีครับเรามาร่วมสนุกกับการ Coding กันเถอะ! พิเศษทำวันนี้ปวดหลังวันนี้ ทำวันหน้าปวดหลังวันหน้า",
                  image: "assets/images/step-one.png",
                  title: "Hi guys"),
              pageViewer(
                  content:
                      "ร่วมงานกับเรานอกจากงานแล้วยังมีกิจกรรมสนุกมากมาย ทั้งกิน ปาตี้ ตั้งแคมป์ให้เราๆได้ผ่อนคลาย",
                  image: "assets/images/step-two.png",
                  title: "Twin Synergy Camping",
                  reserve: true),
              pageViewer(
                  content:
                      "กิจกรรมค่ายอาสาก็เป็นส่วนหนึ่งของงาน การเป็นผู้ให้มีความสุขเสมอ ส่งต่อความสุข ส่งต่อการให้",
                  image: "assets/images/step-three.png",
                  title: "The Volunteer")
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }
   Widget _indicatior(bool isActive) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 8,
        width: isActive ? 30 : 8,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(5)),
      );
    }

    List<Widget> _buildIndicator() {
      List<Widget> indicators = [];
      for (var i = 0; i < 3; i++) {
        if (currentIndex == i) {
          indicators.add(_indicatior(true));
        } else {
          indicators.add(_indicatior(false));
        }
      }
      return indicators;
    }
  Widget pageViewer({image, title, content, reserve = false}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !reserve
              ? Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(image)),
                    SizedBox(height: 30),
                  ],
                )
              : SizedBox(),
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          reserve
              ? Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(image)),
                    SizedBox(height: 30),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
