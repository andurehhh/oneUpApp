import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  List<GoalGroup> goalGroups = [];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Goals',
            style: GoogleFonts.fredoka(
              color :Theme.of(context).colorScheme.secondary,
              shadows: [
                Shadow(
                  color: Colors.white,
                  blurRadius: 2,
                  offset: Offset(0,2),
                )
              ],
              fontWeight: FontWeight.bold,
              fontSize: 30
            )
        ),
      ),
      body: Center(
        child: Column(
          spacing: 10,
          children: <Widget>[
            Container(
              // color: Colors.red,
              // color: Theme.of(context).colorScheme.tertiary,
              // margin: const EdgeInsets.all(20.0),
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0,5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Skills 👾",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    // color: Colors.red,
                    height: 200,
                    width: double.infinity,
                    child: ListView(
                      padding: const EdgeInsets.all(2),
                      children: [
                        ListTile(
                          leading: Icon(Icons.access_alarm),
                          title: Text('Learn Time Management'),
                        ),
                        ListTile(
                          leading: Icon(Icons.adb),
                          title: Text('Learn Flutter'),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: (){
          print("renzo ugle thonking");
          final snackbar = SnackBar(
              content: Text('Renzo Dum'),
              duration: Duration(seconds: 3),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        },
        shape: CircleBorder(),
        child: Icon(Icons.catching_pokemon_outlined, color: Theme.of(context).colorScheme.onPrimary),

            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).colorScheme.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.person, color: Theme.of(context).colorScheme.secondary),
              onPressed: (){
                print("Home");
              },
            ),
            IconButton(
              icon: Icon(Icons.home_max,color: Theme.of(context).colorScheme.secondary ),
              onPressed: (){
                print("Home");
              },
            ),
            IconButton(
              icon: Icon(Icons.list, color: Theme.of(context).colorScheme.secondary),
              onPressed: (){
                print("Home");
              },
            ),
            IconButton(
              icon: Icon(Icons.settings, color: Theme.of(context).colorScheme.secondary),
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