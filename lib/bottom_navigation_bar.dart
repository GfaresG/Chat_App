import 'package:crisp_chat/crisp_chat.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/home.dart';

import 'my_chat.dart';
class BottomNamvigae extends StatefulWidget {
  const BottomNamvigae({super.key});

  @override
  State<BottomNamvigae> createState() => _BottomNamvigaeState();
}

class _BottomNamvigaeState extends State<BottomNamvigae> {
  @override
  int currentIndex=0;
List<Widget> screens=[
  HomeScreen(),
  Center(child: Text("faveroite",style: TextStyle(fontSize: 50),),),
  CripChat(),
];

  final String websiteID = '35b20071-3116-4047-a765-a180fb08889f';
  late CrispConfig config;

  @override
  void initState() {
    super.initState();
    config = CrispConfig(
      websiteID: websiteID,
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:screens[currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "home",),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "faveroite",),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: "chat",),
        ],
        currentIndex: currentIndex,
        onTap: (index)async{
          setState(() {

            currentIndex=index;
          });
          if(index==2){
            await FlutterCrispChat.openCrispChat(
              config: config,
            );
          }
        },
      ),
    );
  }
}
