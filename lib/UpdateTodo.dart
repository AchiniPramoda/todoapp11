import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart'; 

class UpdateTodoRecord extends StatefulWidget {
  
  const UpdateTodoRecord({Key? key, required this.TodoKey}) : super(key: key);
 
  final String TodoKey;
 
  @override
  State<UpdateTodoRecord> createState() => _UpdateTodoRecordState();
}
 
class _UpdateTodoRecordState extends State<UpdateTodoRecord> {
 
  final  TodoidController = TextEditingController();
  final  TodonameController= TextEditingController();
  final  TododescriptionController =TextEditingController();
   bool loading = false ;
 
  late DatabaseReference dbRef;
 
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('todos');
    getTodosData();
  }
 
  void getTodosData() async {
    DataSnapshot snapshot = await dbRef.child(widget.TodoKey).get();
 
    Map student = snapshot.value as Map;
 
    TodoidController.text = student['todoid'];
    TodonameController.text = student['todoname'];
    TododescriptionController.text = student['tododesd'];
 
  }
  
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        
        body:  SingleChildScrollView(
          child: Column(
            children:[ 
              
              Container(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                     
                      color: Color(0x1f000000),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      border: Border.all(color: Color(0xff6ED1BA), width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: const Text(
                            "Todo Update",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      
                      ],
                    ),
                  ),
              
              Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                  
                    TextField(
                      controller: TodoidController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                   ),
                      decoration: InputDecoration(
                      filled: true,
                       fillColor: Color(0xff306f60),     
                       hintStyle: (
                            TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                      hintText: 'Insert Todo ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                        
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                    ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: TodonameController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                   ),
                     decoration: InputDecoration(
                      filled: true,
                       fillColor: Color(0xff306f60),     
                       hintStyle: (
                            TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                      hintText: 'Insert Todo ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                     disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),

                    ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: TododescriptionController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                   ),
                     decoration: InputDecoration(
                      filled: true,
                       fillColor: Color(0xff306f60),   
                         
                       hintStyle: (
                            TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                            ),

                      hintText: 'Insert Todo ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),

                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                       borderSide: BorderSide(color: Color(0xff6ED1BA), width: 2),
                      ),
                    ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MaterialButton(
                      onPressed: () {
           
                        Map<String, String> Todos = {
                          'todoid': TodoidController.text,
                          'todoname': TodonameController.text,
                          'tododesd': TododescriptionController.text
                        };
           
                        dbRef.child(widget.TodoKey).update(Todos)
                        .then((value) => {
                           Navigator.pop(context) 
                        });
           
                      },
                       
                      child: const Text('Update Data',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                     color: Color(0xff003F36),
                      textColor: Colors.white,
                     
                      elevation: 5,
              
                     padding: EdgeInsets.symmetric(horizontal: 28, vertical: 25),
                    shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(16),
                     side: BorderSide(color: Color(0xff6ED1BA), width: 2),
                 
            
              ),
                      
                      minWidth: 250,
                      height: 38,
                    ),
                  ],
                ),
              ),
            ),
            ],
          ),
        ),
      
    );
  }
}