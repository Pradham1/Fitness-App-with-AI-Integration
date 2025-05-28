import 'package:flutter/material.dart';
import 'package:workout_app/targets.dart';

class CreateWorkoutPage extends StatefulWidget {
  CreateWorkoutPage({super.key});

  @override
  State<CreateWorkoutPage> createState() => _CreateWorkoutPageState();
}

class _CreateWorkoutPageState extends State<CreateWorkoutPage> {

  String? selectedText;
  Set<String> showSelected = {};

  void onTileDelete(String text) {
    setState(() {
      showSelected.remove(text);
    });
  }

  void onTileTap(String text) {
    setState(() {
      selectedText = text;
      showSelected.add(text);
    });
  }

  void clearBottomBar() {
    setState(() {
      selectedText = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Target Muscle Groups'),
      ),
      body: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Abs'),
              ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ), 
                trailing: 
                  Container(
                    
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 1),
                      // image: DecorationImage(
                      //   image: AssetImage('assets/muscle_groups/external oblique.png'), // Your image path here
                      //   fit: BoxFit.cover, // Optional: fills the container
                      // ),
                    ),
                  ),
                contentPadding: EdgeInsets.all(8),
                leading: 
                  Title(color: Colors.black, child: const Text('external oblique'),
                  ),
                onTap: () {
                  onTileTap('external oblique');
                  },
                onLongPress: () {
                  onTileDelete('external oblique');
                },
                
              ),
              
            
            const Text('Arms'),
            ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ), 
                trailing: 
                  Container(
                    
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 1),
                      //image: DecorationImage(
                       // image: AssetImage('workout_app/assets/muscle_groups/abs/external oblique.png'), // Your image path here
                        //fit: BoxFit.cover, // Optional: fills the container
                      //),
                    ),
                  ),
                contentPadding: EdgeInsets.all(8),
                leading: 
                  Title(color: Colors.black, child: Text('biceps brachii'),
                  ),
                onTap: () {
                  onTileTap('biceps brachii');
                  },
                onLongPress: () {
                  onTileDelete('biceps brachii');
                },
                  
              ),
            const Text('Back'),
            const Text('Chest'),
            const Text('Legs'),
          ],),

            bottomNavigationBar: selectedText != null ? BottomAppBar(
              
              color: Colors.blue.shade100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(showSelected.toString()),
                    ElevatedButton(
                      onPressed: () {
                        targets = showSelected.toList();
                        print('here are the values in targets:$targets');
                        showSelected.clear();
                        clearBottomBar();           
                        Navigator.pushNamed(context, '/api-call');
                        },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }  
}