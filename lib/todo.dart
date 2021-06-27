import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
 var output = " ";
 List<dynamic> lst = [1,2,3];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar
        (
          iconTheme: IconThemeData
          (
            color: Colors.black,
          ),
               title: Center(child: Text("All Tasks",style: TextStyle(fontSize:30, color: Color(0xff000000),fontWeight: FontWeight.bold))),
               actions: [
                           IconButton(
                                        icon:Icon(Icons.menu),
                                         onPressed: (){},
                                      ),
                                      ],
           
            backgroundColor: Colors.white,
            
            ),
           
            body: Column(
              children: [
                Container(padding: EdgeInsets.only(top: 20,left:10,),width:380, height:80, color: Colors.white, child: Text("Today",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                Container(
                  width: 380,
                  height: 500,
                  color: Colors.white,
                  
                  child:  ListView.builder(
                          itemCount: lst.length,
                          itemBuilder: (context,index)
                          {
                            return Container(
                              height:50,
                              color:Color(0xFF958E8E),
                              margin: EdgeInsets.only(top: 10),
                              child: ListTile(
                                title: Text("${lst[index]}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                trailing: Container(
                                  width: 50,
                                  child: Row(
                                    children: [
                                      GestureDetector(onTap:(){
                                        
                                      showDialog(context: context, builder: (context){
                                    return AlertDialog(
                                      title: Text("Edit item"),
                                      content: TextField(
                                        onChanged: (value){
                                          output = value;
                                        
                                        }
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                          primary: Colors.black,
                                         ),
                                          
                                          onPressed: (){
                                          
                                         
                                          setState(() {
                                            lst.replaceRange(index, index+1, {output});
                                          });
                                           Navigator.of(context).pop();
                                        }, child: Text("Add",style: TextStyle(color:Colors.white),))
                                      ],
                                    );
                                     
                                      });

                                      },child: Icon(Icons.edit)),
                                      GestureDetector(onTap:(){
                                        setState(() {
                                          lst.removeAt(index);
                                        });
                                      },child: Icon(Icons.delete)),
                                    ],
                                  ),
                                ),
                                ),
                                );
                                }),
                  
                ),
              ],
            ),
                        floatingActionButton: FloatingActionButton(
                          
                          backgroundColor: Colors.black,
                          child: Text("+"),
                          
                          
                          onPressed: (){
                          
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text("Add item"),
                              content: TextField(
                                onChanged: (value){
                                  output = value;
                                
                                }
                              ),
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                 ),
                                  
                                  onPressed: (){
                                  
                                 
                                  setState(() {
                                    lst.add(output);
                                  });
                                   Navigator.of(context).pop();
                                }, child: Text("Add",style: TextStyle(color:Colors.white),))
                              ],
                            );
                          
                        } );
                        })
                        )
                        );
  }
}