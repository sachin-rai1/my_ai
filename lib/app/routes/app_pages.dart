import 'package:get/get.dart';
import 'package:my_ai/app/modules/Homepage/views/homepage_view.dart';

import '../modules/ChatMessage/bindings/chat_message_binding.dart';
import '../modules/ChatMessage/views/chat_message_view.dart';
import '../modules/Homepage/bindings/homepage_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOMEPAGE;

  static final routes = [
    GetPage(
      name: _Paths.CHAT_MESSAGE,
      page: () =>  ChatMessageView(),
      binding: ChatMessageBinding(),
    ),
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => const HomepageView(),
      binding: HomepageBinding(),
    ),
  ];
}
