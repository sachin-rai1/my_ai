import 'package:flutter/material.dart';

class ChatMessageView extends StatefulWidget {
  final String? text;
  final String? sender;
  final String? image;

  const ChatMessageView({Key? key, this.text, this.sender, this.image})
      : super(key: key);

  @override
  State<ChatMessageView> createState() => _ChatMessageViewState();
}

class _ChatMessageViewState extends State<ChatMessageView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    widget.sender!,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.sender!),
                    Container(
                      child: widget.text == null
                          ? Image.network(widget.image!)
                          : Text(
                              widget.text!,
                              style: TextStyle(color: Colors.black),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(indent: 2)
        ],
      ),
    );
  }
}
