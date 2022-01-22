import 'package:centersource/HomePage/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 6,
                    bottom: MediaQuery.of(context).size.height / 9),
                child: Image.asset('assets/bg.png')),
          ),
          Column(
            children: [
              closeContainer(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  plusButton(13.5),
                  SizedBox(
                    width: 32,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 32,
                  ),
                  plusButton(11.5),
                ],
              )
            ],
          ),
          Positioned(bottom: 50, child: productDetails())
        ],
      ),
    );
  }

  Widget closeContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Container(
            padding: EdgeInsets.only(left: 5, right: 16),
            height: 50,
            // width: MediaQuery.of(context).size.width/1.74,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(53.5)),
                color: Color.fromRGBO(71, 71, 77, 0.6)),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 19,
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      homePageState.setState(() {
                        homePageState.detailsSelected = false;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 11,
                ),
                Text("Elementum Chair: 88.47%",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget plusButton(double radius) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius,
      child: Icon(
        Icons.add,
        size: 18,
        color: Colors.black,
      ),
    );
  }

  Widget circularArrow(){
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 21.5,
        child: Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget productDetails() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(27)),
          color: Color.fromRGBO(71, 71, 77, 0.6)),
          padding: EdgeInsets.only(left: 31, right: 30, top: 13, bottom: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 50,
              width: 50,
              // padding: EdgeInsets.only(left: 31, right: 30, top: 13),
              child: Image.asset('assets/bg.png')),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 16, top: 10),
                child: Text(
                  'Elementum Chair',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ratingAndPrice()
            ],
          ),
          SizedBox(width: 29,),
          circularArrow()
        ],
      ),
    );
  }

  ratingAndPrice() {
    return Container(
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
                "224",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(width: 10,),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Color.fromRGBO(224, 188, 29, 1),
              ),
              Text(
                "4.6",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
