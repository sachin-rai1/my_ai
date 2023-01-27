import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_network/image_network.dart';

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment:(widget.sender != "user")?MainAxisAlignment.start:MainAxisAlignment.end,
            children: [
              Flexible(
                child: Card(
                  color: (widget.sender != "user") ?Colors.lightBlueAccent:Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: widget.text == null
                      ? ImageNetwork(image: widget.image!, height: Get.mediaQuery.size.height / 2, width: Get.mediaQuery.size.width/2 , fitWeb: BoxFitWeb.fill,fitAndroidIos: BoxFit.fill,)
                      : Padding(
                        padding: (widget.sender != "user")? EdgeInsets.only(top :0 ,left: 10 , right: 10 , bottom: 30):EdgeInsets.only(top: 10 , left: 10 , right: 10 , bottom: 10),
                        child: Text(
                            widget.text!,
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.black),
                          ),
                      ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }


}
