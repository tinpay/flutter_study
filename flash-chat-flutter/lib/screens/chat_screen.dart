import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static String id = "chat_screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

FirebaseUser loggedInUser;

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  Firestore _firestore = Firestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
//    getMessage();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(user.email);
      }
    } catch (e) {
      print(e);
    }
  }

//  void getMessage() async {
//    final messages = await _firestore.collection("messages").getDocuments();
//    for (var message in messages.documents) {
//      print(message.data);
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MessageStream(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        controller: messageTextController,
                        onChanged: (value) {
                          //Do something with the user input.
                          messageText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        _firestore.collection("messages").add({
                          "text": messageText,
                          "sender": loggedInUser.email,
                        });
                        messageTextController.clear();
                      },
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection("messages").snapshots(),
      builder: (context, snapshots) {
        if (snapshots.hasData) {
          final messages = snapshots.data.documents.reversed;

          List<Widget> messagesWidget = [];
          for (var message in messages) {
//                      messagesWidget.add(Text(
//                        "${message.data["text"]} ${message.data["sender"]}",
//                        style: TextStyle(fontSize: 30),
//
//                      ));
            messagesWidget.add(
              MessageBubble(
                text: message.data["text"],
                sender: message.data["sender"],
              ),
            );
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: messagesWidget,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;

  MessageBubble({this.sender, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: (loggedInUser.email == sender)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 10,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: (loggedInUser.email == sender)
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            elevation: 5,
            color: (loggedInUser.email == sender) ? Colors.teal : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                this.text,
                style: TextStyle(
                  color: (loggedInUser.email == sender)
                      ? Colors.white
                      : Colors.black87,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
