// // import 'package:chatApp/constants.dart';
// // import 'package:chatApp/screens/welcome_screen.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';



// // final _firestore = Firestore.instance;
// // FirebaseUser loggedInUser;

// // class ChatScreen extends StatefulWidget {
// //   double width, height;
// //   static const String id = 'chat_screen';

// //   final messageTextController = TextEditingController();
// //   final _auth = FirebaseAuth.instance;
// //   String messageText;
// //   String text;
  
// //  @override
// //   void initState() {
// //     super.initState();
// //     getCurrentUser();
// //   }

// //   // void getCurrentUser() async {
// //   //   try {
// //   //     final User user = await _auth.currentUser();
// //   //     if (user != null) {
// //   //       loggedInUser = user;
// //   //     }
// //   //   } catch (e) {
// //   //     print(e);
// //   //   }
// //   // }

// // Future<void> getCurrentUser() async {
// //   final User user = FirebaseAuth.instance.currentUser;
// //   var email = user.email;
// //   print(email.toString());
// //   setState(() {
// //       text = email.toString();
// //     });
// // }
   
// //   @override
// //   _ChatScreenState createState() => _ChatScreenState();
// // }

// // class _ChatScreenState extends State<ChatScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //        leading: Row(
// //          children: [
// //            IconButton(
// //              onPressed: (){
// //                Navigator.push(
// //                       context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
// //              },
// //              icon:  Icon(Icons.arrow_back, color: Colors.blue)),
// //              CircleAvatar(
// //   backgroundImage: NetworkImage("https://img.etimg.com/thumb/msid-67322344,width-650,imgsize-92467,,resizemode-4,quality-100/angelina-jolie_ap.jpg"),
// // ),
// // Text("Angelina"),
// //          ],
// //        ),
// //        actions: [
// //          IconButton(
// //            onPressed: (){},
// //            icon: Icon(Icons.call_made)
// //          )
// //        ],
// //       ),
// //       body: SafeArea(
// //       child: Container(
// //         decoration: BoxDecoration(
// //           color: Colors.white
// //         ),
// //         child: Column(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             crossAxisAlignment: CrossAxisAlignment.stretch,
// //             children: <Widget>[
// //               MessagesStream(),
// //               Container(
// //                 decoration: kMessageContainerDecoration,
// //                 child: Row(
// //                   crossAxisAlignment: CrossAxisAlignment.center,
// //                   children: <Widget>[
// //                     Expanded(
// //                       child: TextField(
// //                         controller: messageTextController,
// //                         onChanged: (value) {
// //                           messageText = value;
// //                         },
// //                         decoration: kMessageTextFieldDecoration,
// //                       ),
// //                     ),
// //                     FlatButton(
// //                       onPressed: () {
// //                         messageTextController.clear();
// //                         _firestore.collection('messages').add({
// //                           'text': messageText,
// //                           'sender': text,
// //                           //  "timestamp": DateTime.now().millisecondsSinceEpoch
// //                         });
// //                       },
// //                       child: Text(
// //                         'Post',
// //                         style: kSendButtonTextStyle,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
              
// //             ],
// //           ),
// //       ),
// //       ),
// //     );
// //   }
// // }
// // class MessagesStream extends StatelessWidget {
// //   String text;
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder<QuerySnapshot>(
// //       stream: _firestore.collection('messages').snapshots(),
// //       builder: (context, snapshot) {
// //         if (!snapshot.hasData) {
// //           return Center(
// //             child: CircularProgressIndicator(
// //               backgroundColor: Colors.lightBlueAccent,
// //             ),
// //           );
// //         }
// //         final messages = snapshot.data.documents.reversed;
// //         List<MessageBubble> messageBubbles = [];
// //         for (var message in messages) {
// //           final messageText = message.data()['text'];
// //           final messageSender = message.data()['sender'];

// //           final currentUser = text;

// //           final messageBubble = MessageBubble(
// //             sender: messageSender,
// //             text: messageText,
// //             isMe: currentUser == messageSender,
// //           );

// //           messageBubbles.add(messageBubble);
// //         }
// //         return Expanded(
// //           child: ListView(
// //             reverse: true,
// //             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
// //             children: messageBubbles,
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // class MessageBubble extends StatelessWidget {
// //   MessageBubble({this.sender, this.text, this.isMe});

// //   final String sender;
// //   final String text;
// //   final bool isMe;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: EdgeInsets.all(10.0),
// //       child: Column(
// //         crossAxisAlignment:
// //             isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
// //         children: <Widget>[
// //           Text(
// //             sender,
// //             style: TextStyle(
// //               fontSize: 12.0,
// //               color: Colors.black54,
// //             ),
// //           ),
// //           Material(
// //             borderRadius: isMe
// //                 ? BorderRadius.only(
// //                     topLeft: Radius.circular(30.0),
// //                     bottomLeft: Radius.circular(30.0),
// //                     bottomRight: Radius.circular(30.0))
// //                 : BorderRadius.only(
// //                     bottomLeft: Radius.circular(30.0),
// //                     bottomRight: Radius.circular(30.0),
// //                     topRight: Radius.circular(30.0),
// //                   ),
// //             elevation: 5.0,
// //             color: isMe ? Colors.lightBlueAccent : Colors.white,
// //             child: Padding(
// //               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
// //               child: Text(
// //                 text,
// //                 style: TextStyle(
// //                   color: isMe ? Colors.white : Colors.black54,
// //                   fontSize: 15.0,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:chatApp/screens/welcome_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../constants.dart';


// final _firestore = Firestore.instance;
// FirebaseUser loggedInUser;

// class ChatScreen extends StatefulWidget {
//   static const String id = 'chat_screen';
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   double width, height;
//   final messageTextController = TextEditingController();
//   final _auth = FirebaseAuth.instance;
   
//   String messageText;
//   String text;
  
//   @override
//   void initState() {
//     super.initState();

//     getCurrentUser();
//   }

//   // void getCurrentUser() async {
//   //   try {
//   //     final User user = await _auth.currentUser();
//   //     if (user != null) {
//   //       loggedInUser = user;
//   //     }
//   //   } catch (e) {
//   //     print(e);
//   //   }
//   // }

// Future<void> getCurrentUser() async {
//   final User user = FirebaseAuth.instance.currentUser;
//   var email = user.email;
//   print(email.toString());
//   setState(() {
//       text = email.toString();
//     });
// }

//   @override
//   Widget build(BuildContext context) {
//       width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//     return Scaffold(
//        appBar: AppBar(
//       //  toolbarHeight: height*0.1,
//         backgroundColor: Colors.white,
//         elevation: 2.0,
//        leading: Row(
//          children: [
//            IconButton(
//              onPressed: (){
//                Navigator.push(
//                       context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
//              },
//              icon:  Icon(Icons.arrow_back, color: Colors.pink)),
//             //  SizedBox(width: 20,),
// //              CircleAvatar(
// //                radius: 10,
// //   backgroundImage: NetworkImage("https://img.etimg.com/thumb/msid-67322344,width-650,imgsize-92467,,resizemode-4,quality-100/angelina-jolie_ap.jpg"),
// // ),
//          ],
//        ),
//        title: Text("Tinku", style: TextStyle(color: Colors.pink, fontSize: 18)),
//        actions: [
//          IconButton(
//            onPressed: (){},
//            icon: Icon(Icons.call, color: Colors.pink,)
//          )
//        ],
//       ),
//       // appBar: 
//       //  AppBar(
//       //   toolbarHeight: height * 0.1,
//       //   backgroundColor: Colors.white,
//       //   elevation: 0.0,
//       //   title: Container(
//       //     width: width * 0.65,
//       //     child: Center(
//       //       child: Text(
//       //         "Your Voice",
//       //         style: GoogleFonts.montserrat(
//       //           fontSize: 19,
//       //           color: Colors.black,
//       //         ),
//       //       ),
//       //     ),
//       //     decoration: BoxDecoration(
//       //       color: Color(0xFFB9DA8F), //0xFFB9DA8F
//       //       boxShadow: [
//       //         BoxShadow(
//       //             color: Colors.grey.withOpacity(0.45),
//       //             blurRadius: 3,
//       //             offset: Offset(0, 5)),
//       //       ],
//       //     ),
//       //     padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//       //   ),
//       //   leading: Padding(
//       //     padding: const EdgeInsets.all(8.0),
//       //     child: IconButton(
//       //       icon: Icon(
//       //         Icons.arrow_back,
//       //         color: Colors.black,
//       //       ),
//       //       onPressed: () {
//       //         Navigator.push(
//       //             context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
//       //       },
//       //     ),
//       //   ),
//       // ),
//       // AppBar(
//       //   leading: null,
//       //   actions: <Widget>[
//       //     IconButton(
//       //         icon: Icon(Icons.close),
//       //         onPressed: () {
//       //           _auth.signOut();
//       //           Navigator.pop(context);
//       //         }),
//       //   ],
//       //   title: Text('⚡️Chat'),
//       //   backgroundColor: Colors.lightBlueAccent,
//       // ),
//       body: SafeArea(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.purpleAccent[50]
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               MessagesStream(),
//               Container(
//                 decoration: kMessageContainerDecoration,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: <Widget>[
//                     IconButton(
//                       onPressed: (){},
//                       icon: Icon(Icons.add, color: Colors.pink)
//                     ),
//                     Expanded(
//                       child: TextField(
//                         controller: messageTextController,
//                         onChanged: (value) {
//                           messageText = value;
//                         },
//                         decoration: kMessageTextFieldDecoration,
//                       ),
//                     ),
//                     FlatButton(
//                       onPressed: () {
//                         messageTextController.clear();
//                         _firestore.collection('messages').add({
//                           'text': messageText,
//                           'sender': text,
//                           //  "timestamp": DateTime.now().millisecondsSinceEpoch
//                         });
//                       },
//                       child: Icon(
//                         // 'Post',
//                         // style: kSendButtonTextStyle,
//                         Icons.send, color: Colors.pink
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MessagesStream extends StatelessWidget {
//   String text;
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _firestore.collection('messages').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(
//             child: CircularProgressIndicator(
//               backgroundColor: Colors.lightBlueAccent,
//             ),
//           );
//         }
//         final messages = snapshot.data.documents.reversed;
//         List<MessageBubble> messageBubbles = [];
//         for (var message in messages) {
//           final messageText = message.data()['text'];
//           final messageSender = message.data()['sender'];

//           final currentUser = text;

//           final messageBubble = MessageBubble(
//             sender: messageSender,
//             text: messageText,
//             isMe: currentUser == messageSender,
//           );

//           messageBubbles.add(messageBubble);
//         }
//         return Expanded(
//           child: ListView(
//             reverse: true,
//             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//             children: messageBubbles,
//           ),
//         );
//       },
//     );
//   }
// }

// class MessageBubble extends StatefulWidget {
//   MessageBubble({this.sender, this.text, this.isMe});
//   final String sender;
//   final String text;
//   final bool isMe;

//   @override
//   _MessageBubbleState createState() => _MessageBubbleState();
// }

// class _MessageBubbleState extends State<MessageBubble> {
 

//   @override
//   Widget build(BuildContext context) {
       
//     return Padding(
//       padding: EdgeInsets.all(10.0),
//       child: Column(
//         crossAxisAlignment:
//             widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//             // CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             children: [
//               Text(
//                 widget.sender,
//                 style: TextStyle(
//                   fontSize: 12.0,
//                   color: Colors.black54,
//                 ),
//               ),
             
//             ],
//           ),
//           Material(
//             borderRadius: widget.isMe
//                  ? BorderRadius.only(
//                     topLeft: Radius.circular(30.0),
//                     bottomLeft: Radius.circular(30.0),
//                     bottomRight: Radius.circular(30.0))
//                 : BorderRadius.only(
//                     bottomLeft: Radius.circular(30.0),
//                     bottomRight: Radius.circular(30.0),
//                     topRight: Radius.circular(30.0),
//                   ),
//             elevation: 5.0,
//                 color: widget.isMe ? Colors.lightBlueAccent : Colors.pinkAccent,
//           // color: Color(0xFFB9DA8F),
//             child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//               child: Text(
//                 widget.text,
//                 style: TextStyle(
//                   color: widget.isMe ? Colors.white : Colors.black54,
//                   fontSize: 15.0,
//                 ),
//               ),
//             ),
//           ),

//         ],
//       ),
//     );
//   }
// }
// // class MessagesStream extends StatelessWidget {
// //   String text;
 
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamBuilder<QuerySnapshot>(
// //       stream: _firestore.collection('messages').snapshots(),
// //       builder: (context, snapshot) {
// //         if (!snapshot.hasData) {
// //           return Center(
// //             child: CircularProgressIndicator(
// //               backgroundColor: Colors.lightBlueAccent,
// //             ),
// //           );
// //         }
// //         // final messages = snapshot.data.documents.reversed;
// //         List<MessageBubble> messageBubbles = [];
// //         for (var message in messages) {
// //          final messageText = message.data()['text'];
// //           final messageSender = message.data()['sender'];
// //           final currentUser = text;

// //           final messageBubble = MessageBubble(
// //             sender: messageSender,
// //             text: messageText,
// //             isMe: currentUser == messageSender,
// //           );

// //           messageBubbles.add(messageBubble);
// //         }
// //         return Expanded(
// //           child: ListView(
// //             reverse: true,
// //             padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
// //             children: messageBubbles,
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // class MessageBubble extends StatelessWidget {
// //   MessageBubble({this.sender, this.text, this.isMe});

// //   final String sender;
// //   final String text;
// //   final bool isMe;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: EdgeInsets.all(10.0),
// //       child: Column(
// //         crossAxisAlignment:
// //             isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
// //         children: <Widget>[
// //           Text(
// //             sender,
// //             style: TextStyle(
// //               fontSize: 12.0,
// //               color: Colors.white,
// //             ),
// //           ),
// //           Material(
// //             borderRadius: isMe
// //                 ? BorderRadius.only(
// //                     topLeft: Radius.circular(30.0),
// //                     bottomLeft: Radius.circular(30.0),
// //                     bottomRight: Radius.circular(30.0))
// //                 : BorderRadius.only(
// //                     bottomLeft: Radius.circular(30.0),
// //                     bottomRight: Radius.circular(30.0),
// //                     topRight: Radius.circular(0.0),
// //                   ),
// //             elevation: 5.0,
// //             color: isMe ? Colors.lightBlueAccent : Colors.white,
// //             child: Padding(
// //               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
// //               child: Text(
// //                 text,
// //                 style: TextStyle(
// //                   color: isMe ? Colors.white : Colors.black54,
// //                   fontSize: 15.0,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

