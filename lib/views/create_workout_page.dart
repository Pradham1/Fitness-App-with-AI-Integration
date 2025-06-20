import 'package:flutter/material.dart';
import 'package:workout_app/targets.dart';


class CreateWorkoutPage extends StatefulWidget {
  const CreateWorkoutPage({super.key});

  @override
  State<CreateWorkoutPage> createState() => _CreateWorkoutPageState();
}

class _CreateWorkoutPageState extends State<CreateWorkoutPage> {

  late final TextEditingController cont;

  @override
  void initState() {
    cont = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    cont.dispose();
    super.dispose();
  }

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
      backgroundColor: Color.fromARGB(255, 250, 237, 205),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255,204,213,174),
        title: const Text('Select Target Muscle Groups'),
      ),
      body: 
        
        SingleChildScrollView(          
          padding: EdgeInsets.all(16),
          child: Column(            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
              const Text('Abs',style: TextStyle(fontSize: 24),),
                ListTile(               
                  tileColor: Color.fromARGB(255, 189, 224, 254),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/abs/external_oblique.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('external oblique',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('external oblique');
                    },
                  onLongPress: () {
                    onTileDelete('external oblique');
                  },
                ),
              
                
              //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
              const Text('Arms',style: TextStyle(fontSize: 24),),
              ListTile(
                tileColor: Color.fromARGB(255, 189, 224, 254),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/arms/biceps_brachii.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
          
                    contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: Text('biceps brachii', style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('biceps brachii');           
                    },
                  onLongPress: () {
                    onTileDelete('biceps brachii');
                  },                                                                            
                ),
          
                ListTile(               
                  tileColor: Color.fromARGB(255, 189, 224, 254),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/arms/brachioradialis.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('brachioradialis',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('brachioradialis');
                    },
                  onLongPress: () {
                    onTileDelete('brachioradialis');
                  },
                ),
          
                ListTile(               
                  tileColor: Color.fromARGB(255, 189, 224, 254),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/arms/deltoid.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('deltoid',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('deltoid');
                    },
                  onLongPress: () {
                    onTileDelete('deltoid');
                  },
                ),
          
                ListTile(               
                  tileColor: Color.fromARGB(255, 189, 224, 254),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/arms/extensor_digitorum.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('extensor digitorum',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('extensor digitorum');
                    },
                  onLongPress: () {
                    onTileDelete('extensor digitorum');
                  },
                ),
          
                ListTile(              
                  tileColor: Color.fromARGB(255, 189, 224, 254), 
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/arms/flexor_carpi_radialis.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('flexor carpi radialis',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('flexor carpi radialis');
                    },
                  onLongPress: () {
                    onTileDelete('flexor carpi radialis');
                  },
                ),
          
                ListTile(           
                  tileColor: Color.fromARGB(255, 189, 224, 254),    
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/arms/flexor_carpi_ulnaris.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('flexor carpi ulnaris',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('flexor carpi ulnaris');
                    },
                  onLongPress: () {
                    onTileDelete('flexor carpi ulnaris');
                  },
                ),
          
                ListTile(             
                  tileColor: Color.fromARGB(255, 189, 224, 254),  
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/arms/triceps_brachii.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('triceps brachii',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('triceps brachii');
                    },
                  onLongPress: () {
                    onTileDelete('triceps brachii');
                  },
                ),
          
              //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
              const Text('Back',style: TextStyle(fontSize: 24),),
              ListTile(               
                tileColor: Color.fromARGB(255, 189, 224, 254),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/back/infraspinatus.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('infraspinatus',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('infraspinatus');
                    },
                  onLongPress: () {
                    onTileDelete('infraspinatus');
                  },
                ),
          
                ListTile(               
                  tileColor: Color.fromARGB(255, 189, 224, 254),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/back/latissimus_dorsi.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('latissimus dorsi',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('latissimus dorsi');
                    },
                  onLongPress: () {
                    onTileDelete('latissimus dorsi');
                  },
                ),
          
                ListTile(               
                  tileColor: Color.fromARGB(255, 189, 224, 254),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/back/trapezius.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('trapezius',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('trapezius');
                    },
                  onLongPress: () {
                    onTileDelete('trapezius');
                  },
                ),
          
              //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
              const Text('Chest',style: TextStyle(fontSize: 24),),
              ListTile(               
                tileColor: Color.fromARGB(255, 189, 224, 254),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/chest/pectoralis_major.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('pectoralis major',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('pectoralis major');
                    },
                  onLongPress: () {
                    onTileDelete('pectoralis major');
                  },
                ),
          
              //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
              const Text('Legs',style: TextStyle(fontSize: 24),),
              ListTile(               
                tileColor: Color.fromARGB(255, 189, 224, 254),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/legs/lateral_head_of_gastrocnemius.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('lateral head of gastrocnemius',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('lateral head of gastrocnemius');
                    },
                  onLongPress: () {
                    onTileDelete('lateral head of gastrocnemius');
                  },
                ),
                ListTile(              
                  tileColor: Color.fromARGB(255, 189, 224, 254), 
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/legs/medial_head_of_gastrocnemius.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('medial head of gastrocnemius',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('medial head of gastrocnemius');
                    },
                  onLongPress: () {
                    onTileDelete('medial head of gastrocnemius');
                  },
                ),
          
                ListTile(       
                  tileColor: Color.fromARGB(255, 189, 224, 254),        
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/legs/rectus_femoris.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('rectus femoris',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('rectus femoris');
                    },
                  onLongPress: () {
                    onTileDelete('rectus femoris');
                  },
                ),
          
                ListTile(         
                  tileColor: Color.fromARGB(255, 189, 224, 254),      
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ), 
                  trailing: 
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),  
                          width: 2,            
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/muscle_groups/legs/tibialis_anterior.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    
                  contentPadding: EdgeInsets.all(8),
                  leading: 
                    Title(color: Colors.black, child: const Text('tibialis anterior',style: TextStyle(fontSize: 16),),
                    ),
                  onTap: () {
                    onTileTap('tibialis anterior');
                    },
                  onLongPress: () {
                    onTileDelete('tibialis anterior');
                  },
                ),
                Text('Injuries(if any)',style: TextStyle(fontSize: 24),),
                TextField(
                  controller: cont,
                  decoration: InputDecoration(
                    
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
                    hintText: 'leave blank if it does not apply'
                    
                  ),
                ),
                ElevatedButton(
                  onPressed: () { 
                    showSelected.add(cont.text);
                    }, 
                  child: const Text('submit')),
            ],
          ),
        ),

            bottomNavigationBar: selectedText != null ? Container(
              
              color: Color.fromARGB(255,204,213,174),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
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
              ),
            )
          : null,
    );
  }  
}