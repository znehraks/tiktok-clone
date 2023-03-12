import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          // TODO leading에 로그인 중일때 나오는 초록색 동그라미 추가
          leading: Stack(
            children: [
              const CircleAvatar(
                radius: Sizes.size24,
                foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/48117986?s=400&u=dc7f1e49122f3eb850245e0805628223ed584b4e&v=4"),
                child: Text('Jay'),
              ),
              Positioned(
                width: Sizes.size16,
                height: Sizes.size16,
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                      width: Sizes.size2,
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        Sizes.size12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: const Text(
            "Jay",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text('Active now'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
              horizontal: Sizes.size14,
            ),
            itemBuilder: (context, index) {
              final isMine = index % 2 == 0;
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(
                      Sizes.size14,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(
                          Sizes.size20,
                        ),
                        topRight: const Radius.circular(
                          Sizes.size20,
                        ),
                        bottomLeft: Radius.circular(
                          isMine ? Sizes.size20 : Sizes.size5,
                        ),
                        bottomRight: Radius.circular(
                          isMine ? Sizes.size5 : Sizes.size20,
                        ),
                      ),
                      color:
                          isMine ? Colors.blue : Theme.of(context).primaryColor,
                    ),
                    child: const Text(
                      "this is a message!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Gaps.v10,
            itemCount: 10,
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            // TODO dm 메시지 input 완성하기
            child: BottomAppBar(
              // color: Colors.grey.shade100,
              color: Colors.grey.shade100,
              padding: const EdgeInsets.all(
                Sizes.size8,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Sizes.size10),
                              topRight: Radius.circular(Sizes.size10),
                              bottomLeft: Radius.circular(Sizes.size10),
                            ),
                            borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.only(
                          left: Sizes.size20,
                          right: Sizes.size10,
                        ),
                        hintText: "Send a message...",
                        suffix: FaIcon(
                          FontAwesomeIcons.faceSmile,
                          color: Colors.grey.shade600,
                          size: Sizes.size24,
                        ),
                      ),
                    ),
                  ),
                  Gaps.h8,
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: Sizes.size4,
                      right: Sizes.size10,
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.paperPlane,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
