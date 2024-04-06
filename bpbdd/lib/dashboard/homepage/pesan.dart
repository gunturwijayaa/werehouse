import 'package:flutter/material.dart';

void main() {
  runApp(Pesan());
}

class Pesan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pesan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.insert(0, {'type': 'text', 'content': text});
    });
  }

  void _startChatWithUser(String userName) {
    // Implement logic to start chat with the selected user
    // For now, let's print the selected user's name
    print('Chatting with $userName');
  }

  void _sendImage() {
    // Implement logic to send image
    // For now, let's print a message
    print('Image sent');
  }

  void _makeCall() {
    // Implement logic to make a call
    // For now, let's print a message
    print('Call initiated');
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: "Send a message",
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {
                    _startChatWithUser('User Name');
                  },
                ),
                Text('User Name'),
              ],
            ),
            IconButton(
              icon: Icon(Icons.phone),
              onPressed: _makeCall,
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    if (message['type'] == 'text') {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Text("User"),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "User",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(message['content']),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (message['type'] == 'image') {
      // Here you can define how to display images in chat
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                child: Text("User"),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "User",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text("Image message"),
                  ),
                  // Display the image here
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(); // Handle other types of messages
    }
  }
}
