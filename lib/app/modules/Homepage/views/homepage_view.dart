import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_ai/app/data/threeDots.dart';

import '../controllers/homepage_controller.dart';

class HomepageView extends GetView<HomepageController> {
  const HomepageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    Get.put(HomepageController());
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black12,
        title: Text('CHAT-GPT',
            style: TextStyle(fontSize: 25, color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
            child: Obx(
              () => ListView.builder(
                controller: _scrollController,
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
                    child: TextField(
                      cursorColor: Colors.redAccent,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: TextStyle(color: Colors.white),
                      controller: controller.textMessage,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Ask Question",
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: EdgeInsets.only(left: 10)),
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
