import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int _selectedIndex = 0;
    int selectdTopBarIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return mainBody();
  }
    appbar() {
    return AppBar(
      title: Text('Top Rated',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),
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
      onTap: (value){
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
    var temp = ["Armchair", "Bed","Lamp"];
    List<Widget> tab = [];
    int i = 0;
    for (var tempMenutype in temp) {
      tab.add(Tab(
        child: Container(
          padding: EdgeInsets.fromLTRB(21, 14, 21, 14),
          height: 48,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: selectedIndex == i?
          Color.fromRGBO(25, 27, 36, 1):
           Color.fromRGBO(248, 248, 248, 1)),
          child: Row(
            children: [
              Icon(Icons.king_bed),
              SizedBox(width: 5,),
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appbar(),
        bottomNavigationBar: bottomNavigationBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.shopping_bag_outlined),
          backgroundColor: Colors.black,
        ),
        body: Container(),
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
      onTap: (){
        print("**********************");
        print(MediaQuery.of(context).size.width);
      print(MediaQuery.of(context).size.height);},
      child: Center(
        child: IconButton(
              icon: Icon(Icons.tune,color: Colors.black,),
              onPressed: () {print("**********************");
        print(MediaQuery.of(context).size.width);
      print(MediaQuery.of(context).size.height);}),
      ),
    );
  }
}
