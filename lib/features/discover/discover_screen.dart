import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

// TODO 01. Tab 이동 시, 키보드 가리기
// TODO 02. Input을 사진과 동일하게

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textEditingController =
      TextEditingController(text: "Initial Text");

  bool _isTextEmpty = false;

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(_onDismissKeyboard);
  }

// TODO controller를 이용하여 제어
  void _onDismissKeyboard() {
    if (_tabController.indexIsChanging) {
      FocusScope.of(context).unfocus();
    }
  }

  void _onSearchChanged(String value) {
    print(value);
    setState(() {
      _isTextEmpty = value.isEmpty;
    });
  }

  void _onSearchSubmitted(String value) {
    print(value);
  }

  void _onDeleteCurrentText() {
    _textEditingController.clear();
    setState(() {
      _isTextEmpty = true;
    });
  }

// TODO onTap 방식으로 제어
  // void _onTapBarTap(int value) {
  //   FocusScope.of(context).unfocus();
  // }

  @override
  void dispose() {
    _textEditingController.dispose();
    _tabController.removeListener(_onDismissKeyboard);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.arrow_back_ios,
          //   ),
          // ),
          elevation: 1,
          // title: CupertinoSearchTextField(
          //   controller: _textEditingController,
          //   onChanged: _onSearchChanged,
          //   onSubmitted: _onSearchSubmitted,
          // ),
          title: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                child: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: Sizes.size36,
                child: Container(
                  color: Colors.grey.shade200,
                  child: TextField(
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                        decoration: TextDecoration.none,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefix: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: Sizes.size10,
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: Sizes.size16,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        suffix: _isTextEmpty
                            ? null
                            : GestureDetector(
                                onTap: _onDeleteCurrentText,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: Sizes.size10,
                                  ),
                                  child: FaIcon(
                                    FontAwesomeIcons.solidCircleXmark,
                                    size: Sizes.size16,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                      ),
                      controller: _textEditingController,
                      onChanged: _onSearchChanged,
                      onSubmitted: _onSearchSubmitted),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
                child: Container(
                  margin: const EdgeInsets.only(
                    left: Sizes.size20,
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.sliders,
                    size: Sizes.size20,
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
          bottom: TabBar(
              controller: _tabController,
              // onTap: _onTapBarTap,
              splashFactory: NoSplash.splashFactory,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              isScrollable: true,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.shade500,
              tabs: [
                for (var tab in tabs)
                  Tab(
                    text: tab,
                  )
              ]),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 20,
              padding: const EdgeInsets.all(
                Sizes.size6,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                // 축 개수
                crossAxisCount: 2,
                // 가로 Gap
                crossAxisSpacing: Sizes.size10,
                // 세로 Gap
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.size12,
                      ),
                    ),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: "assets/images/chicken.jpeg",
                        image:
                            "https://images.unsplash.com/photo-1626074353765-517a681e40be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
                      ),
                    ),
                  ),
                  Gaps.v10,
                  const Text(
                    "This is a very long long long long long lonlong lonlong lonlong lonlong lonlong lon",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.size18,
                    ),
                  ),
                  Gaps.v5,
                  DefaultTextStyle(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: Sizes.size12,
                          backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/48117986?s=400&u=dc7f1e49122f3eb850245e0805628223ed584b4e&v=4",
                          ),
                        ),
                        Gaps.h4,
                        const Expanded(
                          child: Text(
                            "My avatar is going to be very long",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Gaps.h4,
                        FaIcon(
                          FontAwesomeIcons.heart,
                          size: Sizes.size16,
                          color: Colors.grey.shade600,
                        ),
                        Gaps.h2,
                        const Text(
                          "2.5M",
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: Sizes.size28,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
