import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/insideoutSection.dart';
import 'package:movie_app/moanaSection.dart';
import 'package:movie_app/screen/movieSection.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSection);
    super.initState();
  }

  _handleTabSection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text("movies streaming"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: ListView(
        children: [
          CarouselSlider(options: CarouselOptions(
            autoPlay: true,
            height: 230,
            enlargeCenterPage: true,
            aspectRatio: 16/19,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds:8
),
viewportFraction: 0.8
,
          ),
          items: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8
),
image: DecorationImage(image:AssetImage("assets/moana.jpeg"),
fit: BoxFit.cover,
 )
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8
),
image: DecorationImage(image:AssetImage("assets/insideout1.jpeg"),
fit: BoxFit.cover,
 )
              ),
            )
          ],
          ),
          SizedBox(height: 30),
          TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            isScrollable: true,
            labelStyle: TextStyle(
              color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            ),
            dividerHeight: 0,
          indicatorColor: Colors.redAccent,
          tabs: [
            Tab(text: "all"),
            Tab(text: "moana"),
            Tab(text: "inside out"), 
            Tab(text: "all"),
          
          ],
          ),
          SizedBox(height: 20,),
          Center(
            child: [
            movieSection(),
           moanaSection(),
           insideoutSection(),
           Container(),
            ][_tabController.index]
          )
        ],
      ),
    );
  }
}
