import 'package:centersource/DetailsPage/detailsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int selectdTopBarIndex = 0;
  bool detailsSelected = false;
  Map<String, dynamic> furniture = {};
  var childern = [
    Container(
      child: Image.asset('assets/1.png'),
    ),
    Container(
      child: Image.asset('assets/1.png'),
    ),
    Container(
      child: Image.asset('assets/1.png'),
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return mainBody();
  }

  appbar() {
    return AppBar(
      title: Text(
        'Top Rated',
        style: TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.grey),
      actions: [
        cartIcon(),
        SizedBox(
          width: 10,
        ),
      ],
      bottom: tabBar(),
    );
  }

  Widget tabBar() {
    return TabBar(
        onTap: (value) {
          selectdTopBarIndex = value;
          setState(() {});
        },
        isScrollable: true,
        indicatorColor: Colors.transparent,
        labelStyle: TextStyle(fontSize: 12, color: Colors.white),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
        tabs: tabbarList(selectdTopBarIndex));
  }

  List<Widget> tabbarList(int selectedIndex) {
    var temp = ["Armchair", "Bed", "Lamp"];
    List<Widget> tab = [];
    int i = 0;
    for (var tempMenutype in temp) {
      tab.add(Tab(
        child: Container(
          padding: EdgeInsets.fromLTRB(21, 14, 21, 14),
          height: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: selectedIndex == i
                  ? Color.fromRGBO(25, 27, 36, 1)
                  : Color.fromRGBO(248, 248, 248, 1)),
          child: Row(
            children: [
              Icon(Icons.king_bed),
              SizedBox(
                width: 5,
              ),
              Text(tempMenutype),
            ],
          ),
        ),
      ));
      i++;
    }
    return tab;
  }

  Widget mainBody() {
    return Stack(
      children: [
        DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: detailsSelected ?appbarDetails() : appbar(),
            bottomNavigationBar: bottomNavigationBar(),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.shopping_bag_outlined),
              backgroundColor: Colors.black,
            ),
            body: body(),
          ),
        ),
        Positioned.fill(
          top: 90,
          bottom: 100,
          child: Visibility(
            visible: detailsSelected,
            child: DetailsPage()),
        ),
      ],
    );
  }
  appbarDetails() {
    return AppBar(
      title: Text(
        'Point your camera at a furniture',
        style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
      ),
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: Icon(Icons.camera_alt, color: Colors.white),
        onPressed: () => null,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(
        color: Colors.red,
      ),
    );
  }

  bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '',
          backgroundColor: Colors.white,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
          backgroundColor: Colors.white,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );
  }

  Widget cartIcon() {
    return GestureDetector(
      onTap: () {
        print("**********************");
        print(MediaQuery.of(context).size.width);
        print(MediaQuery.of(context).size.height);
      },
      child: Center(
        child: IconButton(
            icon: Icon(
              Icons.tune,
              color: Colors.black,
            ),
            onPressed: () {
              print("**********************");
              print(MediaQuery.of(context).size.width);
              print(MediaQuery.of(context).size.height);
            }),
      ),
    );
  }

  body() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 45),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [topRow(), gridview()],
        ),
      ),
    );
  }

  Widget topRow() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "147 products",
                style: TextStyle(
                    color: Color.fromRGBO(25, 27, 36, 0.6),
                    fontWeight: FontWeight.w600),
              )),
          Container(
            padding: EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Text(
                  "Most popular",
                  style: TextStyle(
                      color: Color.fromRGBO(25, 27, 36, 1),
                      fontWeight: FontWeight.w600),
                ),
                Icon(Icons.keyboard_arrow_down_outlined)
              ],
            ),
          ),
        ],
      ),
    );
  }

  gridview() {
    return Container(
      height: MediaQuery.of(context).size.height -
          (MediaQuery.of(context).size.height / 2.8),
      width: MediaQuery.of(context).size.width,
      child: MasonryGridView.count(
          physics: AlwaysScrollableScrollPhysics(),
          // padding: const EdgeInsets.all(12.0),
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 8,
          itemCount: furniture.keys.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){    
                setState(() {
                    detailsSelected = true;                 
                  });
              },
              child: Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(23)),
                  color: Color.fromRGBO(248, 248, 248, 1),
                ),
                margin: index % 2 == 0
                    ? EdgeInsets.only(
                        top: 0,
                      )
                    : EdgeInsets.only(
                        top: 20,
                      ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 31, right: 30, top: 13),
                        child: Image.asset(
                            furniture[furniture.keys.toList()[index]]
                                ["image"])),
                    Container(
                      padding: EdgeInsets.only(left: 16, top: 10),
                      child: Text(
                        furniture.keys.toList()[index].toString(),
                        style:
                            TextStyle(color: Color.fromRGBO(25, 27, 36, 0.8)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 13, left: 16, right: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.attach_money_outlined,
                                color: Color.fromRGBO(224, 188, 29, 1),
                              ),
                              Text(
                                furniture[furniture.keys.toList()[index]]
                                    ["price"],
                                style: TextStyle(
                                    color: Color.fromRGBO(25, 27, 36, 1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color.fromRGBO(224, 188, 29, 1),
                              ),
                              Text(
                                furniture[furniture.keys.toList()[index]]
                                    ["rating"],
                                style: TextStyle(
                                    color: Color.fromRGBO(25, 27, 36, 1),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  void loadData() {
    furniture = {
      "Tortor Chair": {
        "image": "assets/1.png",
        "price": "256.00",
        "rating": "4.5"
      },
      "Morbi Chair": {
        "image": "assets/2.png",
        "price": "284.00",
        "rating": "4.8"
      },
      "Pretium Chair": {
        "image": "assets/3.png",
        "price": "232.00",
        "rating": "4.3"
      },
      "Blandit Chair": {
        "image": "assets/4.png",
        "price": "224.00",
        "rating": "4.1"
      }
    };
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light));
  }
}
