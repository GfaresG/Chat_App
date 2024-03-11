import 'package:crisp_chat/crisp_chat.dart';
import 'package:flutter/material.dart';

class CripChat extends StatefulWidget {
  const CripChat({super.key});

  @override
  State<CripChat> createState() => _CripChatState();
}
class _CripChatState extends State<CripChat> {
  final String websiteID = '35b20071-3116-4047-a765-a180fb08889f';
  late CrispConfig config;

  @override
  void initState() {
    super.initState();
    config = CrispConfig(
      websiteID: websiteID,
    );
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(

        appBar: AppBar(
          title: const Text('[faris Chat'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await FlutterCrispChat.openCrispChat(
                config: config,
              );
            },
            child: const Text('Open Faris Chat'),
          ),
        ),
      )
    ;
  }
}

