import 'package:flutter/material.dart';
import 'package:one_up_app/models/goal_group.dart';

class HomeScreen extends StatefulWidget{
  //the constructor
  const HomeScreen({Key? key}): super(key:key);

  @override
  State<HomeScreen> createState(){
    return _HomeScreenState();
  }
  // can also be written as State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  List<GoalGroup> GoalGroups = [];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Home'),
      ),
      body: Center(
        child: Text('My Home Screen!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("renzo ugle thonking");
          final snackbar = SnackBar(
              content: Text('Renzo Dum'),
              duration: Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        },
        child: Icon(Icons.catching_pokemon_outlined, color: Colors.black),
        backgroundColor: Colors.grey,
        shape: CircleBorder(),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(

        shape: CircularNotchedRectangle(),
        color: Colors.blueGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.person, color: Colors.white70),
              onPressed: (){
                print("Home");
              },
            ),
            IconButton(
              icon: Icon(Icons.home_max, color: Colors.white70),
              onPressed: (){
                print("Home");
              },
            ),
            IconButton(
              icon: Icon(Icons.list, color: Colors.white70),
              onPressed: (){
                print("Home");
              },
            ),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.white70),
              onPressed: (){
                print("Home");
              },
            ),
          ],
        ),
      ),
    );
  }
}