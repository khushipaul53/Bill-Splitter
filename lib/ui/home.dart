import 'package:flutter/material.dart';

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  int _tipPercentage=0;
  int _personCounter=1;
  double _billAmount=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Bill Splitter"),
        backgroundColor: Colors.red,
        centerTitle: false,

      ),
      body:Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20),
          children:<Widget> [
            Container(
              width: 150,
              height: 150,
              // margin:EdgeInsets.fromLTRB(0, 40, 0, 0),
              decoration: BoxDecoration(
                  color:Colors.red.shade50,
                borderRadius:BorderRadius.circular(20.0)
              ),
                 child:Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Text("Total Per Person",
                       style: TextStyle(
                         color: Colors.red,
                         fontSize: 20,

                       ),

                     ),


                     Text("\$ ${calculateTotalPerPerson(_billAmount, _personCounter,_tipPercentage)}",
                       style: TextStyle(
                       color: Colors.red,
                       fontSize: 40,
                         fontWeight: FontWeight.w500,
                     ),
                     )
                   ],

                 )





            ),
          Container(
            margin:EdgeInsets.only(top:20),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black45,
                width: 1,
                style: BorderStyle.solid,



              )
            ),


              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color:Colors.grey),
                    decoration: InputDecoration(
                      labelText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money)


                    ),
                    onChanged: (String value){
                      try{
                        _billAmount=double.parse(value);
                        
                      }catch(exception){
                        _billAmount=0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Split",
                          style:TextStyle(
                            color: Colors.grey
                          )
                      ),
                      Row(
                        children: <Widget>[

                          InkWell(
                            
                            onTap: (){
                              setState(() {
                                if(_personCounter>1)
                                  {
                                    _personCounter--;
                                  }
                                else{

                                }
                              });
                            },
                            child:Container(
                              width: 40,
                              height: 40,
                              margin:EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade50,
                                  borderRadius: BorderRadius.circular(5)

                                ),
                              child:Center(
                                child: Text("-",
                                  style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,

                                ),
                                ),
                              )
                            ),

                          ),
                          Text("$_personCounter",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,

                            ),),

                          InkWell(
                            onTap: (){
                              setState(() {

                                  _personCounter++;


                              });
                            },
                            child:Container(
                                width: 40,
                                height: 40,
                                margin:EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.red.shade50,
                                    borderRadius: BorderRadius.circular(5)

                                ),
                                child:Center(
                                  child: Text("+",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                )
                            ),

                          ),


                        ],

                      ),



                    ],


                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      Text("Tip",

                        style:TextStyle(
                            color: Colors.grey
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text("\$ ${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,

                            )
                        ),
                      )
                    ],
                  ),

                  Column(
                    children: <Widget>[
                      Text("$_tipPercentage%",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,

                          )
                      ),
                      Slider(
                          min:0,
                          max:100,
                          activeColor: Colors.red,
                          inactiveColor: Colors.grey,
                          divisions: 10,
                          value: _tipPercentage.toDouble(), onChanged: (double value){

                        setState(() {

                          _tipPercentage=value.round();

                        });
                      })
                    ],
                  )

                ],
                
              ),
          )


          ],

        ),
      )
    );
  }
  calculateTotalPerPerson(double billAmount,int splitBy,int tipPercentage)
  {
    var totalPerPerson=(calculateTotalTip(billAmount, splitBy, tipPercentage)+billAmount)/splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }
  calculateTotalTip(double billAmount, int splitby,int tipPercentage )
  {
    double totalTip=0.0;
    if(billAmount<0 || billAmount.toString().isEmpty || billAmount==null)
      {

      }else{
      totalTip=(billAmount * tipPercentage)/100;
    }
    return totalTip;

  }
}
