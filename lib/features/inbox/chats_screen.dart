import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _globalKey =
      GlobalKey<AnimatedListState>();

  final List<int> _items = [];
  void _addItem() {
    var currentState = _globalKey.currentState;
    if (currentState != null) {
      currentState.insertItem(
        _items.length,
        duration: const Duration(
          milliseconds: 500,
        ),
      );
      _items.add(_items.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 1,
        title: const Text('Direct messages'),
      ),
      body: AnimatedList(
        key: _globalKey,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        initialItemCount: 0,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            key: UniqueKey(),
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: SizeTransition(
                sizeFactor: animation,
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: Sizes.size28,
                    foregroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/48117986?s=400&u=dc7f1e49122f3eb850245e0805628223ed584b4e&v=4",
                    ),
                    child: Text('J'),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Jay ($index)',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '2:16 PM',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: Sizes.size12,
                        ),
                      ),
                    ],
                  ),
                  subtitle: const Text("Don't forget to make video"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
