import 'package:flutter/material.dart';
import 'package:ineed_app/constants/colorConstants.dart';
import 'package:ineed_app/model/comment.dart';
import 'package:ineed_app/provider/appState.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class DetailPage extends StatefulWidget {

final name;

final text;
final time;
final location;
final price;

DetailPage({this.name, this.price, this.text, this.time, this.location});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  AppState  appState;
  bool open = false;
    TextEditingController _controller = TextEditingController();
  var newComment;
  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 20, right: 20, left: 20, top: 20),
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(

                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,

                                image: DecorationImage(
                                  image: AssetImage("images/avi.png"),
                                  fit: BoxFit.cover,

                                )
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.name, style: TextStyle(color: Colors.grey[900], fontSize: 18, fontWeight: FontWeight.bold),),
                              SizedBox(height: 4,),
                              Text(widget.time,style: TextStyle(color: kFaded, fontSize:13, ) )
                            ],
                          ),

                        ],
                      ),


                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.location_on, size: 15, color: Colors.red,),
                              Text(widget.location, style: TextStyle(color: kFaded, fontSize:13, )),
                            ],
                          ),
                          Text("NGN ${widget.price}", style: TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        child: Text(widget.text, style: TextStyle(color: Colors.grey[800], fontSize: 15, height: 1.5, ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
//          Container(
//
//            height: 200,
//            decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(10),
//
//                image: DecorationImage(
//                  image: AssetImage("images/landMarkIcon.png"),
//                  fit: BoxFit.contain,
//
//                )
//            ),
//          ),

                  SizedBox(height: 5,),
                  Divider(),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                  InkWell(
                  onTap: (){
                      setState(() {
                        open = true;
                      });
    },
                      child: Visibility(
                        visible: open ?  false : true,
                          child: Text("start negotiations", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w100, fontSize: 20, height: 1.5, ),)))

                    ],
                  ),
                  SizedBox(height: 10,),
                  Divider(),
                  SizedBox(height: 5,),
                  Text("Today", style: TextStyle(color: kPrimaryColor),),
                  Divider(),

                Container(
                  height: 500,
                  child: ListView.builder(
                    itemCount: appState.comment.length,
                      itemBuilder: (BuildContext context, int index){
                        return CommentWidget(
                          name: appState.comment[index].name,
                          text:  appState.comment[index].text,
                        );

                  }),
                )



                ],
              ),
            ),
          ),

          SlidingUpPanel(

            backdropEnabled: true,

            maxHeight: MediaQuery.of(context).size.height * 0.7,
            minHeight:open ? 150 : 0,
            panel: Column(
              children: <Widget>[
                SizedBox(height: 10,),
                Container(
                  height: 5.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller:_controller  ,
                    autofocus: open ? true :false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          focusedBorder:UnderlineInputBorder(
                            borderSide:  BorderSide(color: kPrimaryColor, width: 1.0),
                          ),
                          labelText: 'Add a comment' ,
                          labelStyle: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w100, fontSize: 15, height: 1.5, )
//                    hintText: 'Full na
//                    hintStyle: (
                      ),
//                    onChanged: (value){
//                      newComment = value;
//                    },


                  ),
                ),

                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.send),onPressed: (){

                        addNewComment();
                        _controller.clear();
                    },)
                  ],
                )
              ],
            )


          )
        ],
      ),

    );
  }

  void addNewComment() {
    if(_controller.text.isNotEmpty){
      setState(() {
        appState.comment.add(
          Comment(
            name: "Bola",
            text: _controller.text
          )
        );
      });
    }
  }
}

class CommentWidget extends StatelessWidget {


  final  name;
  final text;
  CommentWidget({this.text, this.name});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Card(
          elevation: 0.0,
          child: Container(
            height: 80,
            child:


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        image: DecorationImage(
                          image: AssetImage("images/avi.png"),
                          fit: BoxFit.cover,

                        )
                    ),
                  ),
                  SizedBox(width: 20,),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(name, style: TextStyle(color: Colors.grey[900], fontSize: 18, fontWeight: FontWeight.bold),),
                          SizedBox(width: 5,),

                          Text("11:02 pm", style: TextStyle(color: kFaded, fontWeight: FontWeight.w100),)
                        ],
                      ),
                      SizedBox(height: 4,),
                      Text(text,style: TextStyle(color: kFaded, fontSize:18, ) )
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
    SizedBox(height: 10,)
      ],
    );
  }
}
