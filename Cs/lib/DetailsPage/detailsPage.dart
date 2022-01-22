import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            ],
          )
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
            padding: EdgeInsets.only(left: 5,right: 16),
            height: 50,
            // width: MediaQuery.of(context).size.width/1.74,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(53.5)),
              color: Color.fromRGBO(71, 71, 77, 0.6)
            ),
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
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 11,),
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
  plusButton(double radius){
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: radius,
      child: IconButton(
        icon: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
    );
  }
}
