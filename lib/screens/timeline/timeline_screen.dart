import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/new_form_screen.dart';
import '../../utils/auth.dart';
import 'controller/timeline_controller.dart';

class TimelineScreen extends StatelessWidget {
  TimelineScreen({Key? key}) : super(key: key);
  final _timelineController = Get.find<TimelineController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextButton.icon(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          ),
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          label: const Text('ホーム'),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(children: [
            SvgPicture.asset(
              "assets/new3.svg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Auth.groupName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "メンバー：１０",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        child: const Text('招待'),
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          overlayColor: MaterialStateProperty.all<Color>(
                              Colors.grey.withOpacity(0.3)),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      ElevatedButton(
                        child: const Text('投稿'),
                        onPressed: () {
                          Get.to(() => NewScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '',
                    ),
                    maxLines: 5,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Obx(
              () => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _timelineController.timelines.length,
                itemBuilder: (context, index) => Container(
                  color: Colors.blue[200],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    _timelineController
                                        .timelines[index].groupName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                    size: 30,
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.account_circle,
                                      color: Colors.grey,
                                      size: 40,
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _timelineController
                                              .timelines[index].groupName
                                              .toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 4.0,
                                        ),
                                        Text(
                                          _timelineController
                                              .timelines[index].uploadedById
                                              .toString(),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              (_timelineController.timelines[index].message !=
                                      "")
                                  ? Text(_timelineController
                                      .timelines[index].message)
                                  : const SizedBox(),
                              const SizedBox(height: 8.0),
                              (_timelineController.timelines[index].file != "")
                                  ? Image.network(
                                      "http://kichu-test1-backend1.herokuapp.com/Media/" +
                                          _timelineController
                                              .timelines[index].file)
                                  : const SizedBox(),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/like_bw.svg",
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      _timelineController
                                          .timelines[index].likeCount
                                          .toString(),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 64,
                                    ),
                                    SvgPicture.asset(
                                      "assets/comment_bw.svg",
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      _timelineController
                                          .timelines[index].commentCount
                                          .toString(),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                indent: 9,
                                endIndent: 9,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            _timelineController.likeTimeline(
                                                data: {
                                                  'id': _timelineController
                                                      .timelines[index].id,
                                                  'sessionId': Auth.sessionId
                                                });
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/like_bw.svg",
                                              ),
                                              const SizedBox(
                                                width: 8.0,
                                              ),
                                              const Text(
                                                "Nice!",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 64),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/comment_bw.svg",
                                        ),
                                        const SizedBox(
                                          width: 8.0,
                                        ),
                                        const Text(
                                          "コメント",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
          ]),
        ),
      ),
    );
  }
}
