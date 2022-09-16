import 'package:bot_toast/bot_toast.dart';

showToastMessage(message) async{
  // bool enableSlideOff = true;
  // bool hideCloseButton = false;
return  BotToast.showText(text:message);
// return BotToast.showSimpleNotification(
//     title: message,
//     enableSlideOff: enableSlideOff,
//     hideCloseButton: hideCloseButton,
//     backgroundColor: Colors.white70,
//   );

}