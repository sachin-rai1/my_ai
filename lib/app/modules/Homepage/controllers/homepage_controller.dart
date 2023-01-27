import 'dart:async';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_ai/app/modules/ChatMessage/views/chat_message_view.dart';

import '../../../data/constants.dart';

class HomepageController extends GetxController {
  final textMessage = TextEditingController();
  RxBool isTyping = false.obs;

  final RxList messages = <ChatMessageView>[].obs;

  void sendMessage() {
    if (textMessage.text.isNotEmpty) {
      ChatMessageView message =
          ChatMessageView(text: textMessage.text, sender: "user");
      print(textMessage.text);
      messages.insert(0, message);

      final request = CompleteReq(
          prompt: textMessage.text, model: kTranslateModelV3, max_tokens: 500);
      subscription = chatGPT!
          .onCompleteStream(request: request)
          .asBroadcastStream()
          .listen((response) {
        ChatMessageView botMessage =
            ChatMessageView(text: response!.choices[0].text, sender: "bot");
        messages.insert(0, botMessage);
      });
      textMessage.clear();
    } else {
      Get.showSnackbar(GetSnackBar(
        title: "Please Enter Data",
        message: "No question asked",
        duration: Duration(seconds: 2),
        backgroundColor: Color(0xFFFCC962),
        borderRadius: 15,
        margin: EdgeInsets.all(10),
        snackPosition: SnackPosition.TOP,
      ));
    }
  }

  void generateImage() {
    // isTyping.value = true;

    ChatMessageView message =
        ChatMessageView(text: textMessage.text, sender: "user");

    messages.insert(0, message);
    final request = GenerateImage(
      textMessage.text,
      2,
    );

    chatGPT!.generateImageStream(request).asBroadcastStream().listen((it) {
      ChatMessageView botMessage = ChatMessageView(
        image: it.data?.last?.url,
        sender: "Bot",
      );
      messages.insert(0, botMessage);
    });
    textMessage.clear();
    // isTyping.value;
  }

  ChatGPT? chatGPT;
  StreamSubscription? subscription;

  @override
  void onInit() {
    super.onInit();
    chatGPT = ChatGPT.instance
        .builder(apiKey, baseOption: HttpSetup(receiveTimeout: 50000));
  }

  void onDispose() {
    super.onClose();
    subscription?.cancel();
  }
}
