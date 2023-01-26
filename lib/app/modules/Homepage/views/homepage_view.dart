import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_ai/app/data/threeDots.dart';

import '../controllers/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  const HomepageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomepageController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('CHAT-GPT',
            style: TextStyle(fontSize: 25, color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
            child: Obx(
              () => ListView.builder(
                  reverse: true,
                  itemCount: controller.messages.length,
                  itemBuilder: (BuildContext context, index) {
                    return controller.isTyping.value == true
                        ? ThreeDots()
                        : controller.messages[index];
                  }),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Container(
                  height: 38,
                  child: TextField(
                    onSubmitted: (value) => controller.sendMessage(),
                    controller: controller.textMessage,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter Question",
                        contentPadding: EdgeInsets.only(left: 10)),
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.sendMessage();
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.black,
                    size: 35,
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.generateImage();
                  },
                  child: Icon(
                    Icons.image,
                    color: Colors.black,
                    size: 35,
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
