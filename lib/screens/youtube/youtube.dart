import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_parser/youtube_parser.dart';

import '../home/components/top_bar.dart';
import '../../components/new_form_screen.dart';
import 'controller/youtube_controller.dart';

class Youtube extends StatelessWidget {
  Youtube({Key? key}) : super(key: key);
  final _youtubeController = Get.find<YoutubeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: TopBar(
            title: 'ホーム',
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    "assets/new3.svg",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                "U10（選手）",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "メンバー：１０",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => NewScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey,
                          ),
                          margin: const EdgeInsets.all(16.0),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "投稿 ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: textField,
                  ),
                ],
              ),
            ),
            Obx(
              () => ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _youtubeController.youtubeVideos.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Material(
                      color: Colors.white,
                      child: InkWell(
                        highlightColor: Colors.grey.withOpacity(0.3),
                        splashColor: Colors.blue.withOpacity(0.3),
                        onTap: () async {
                          if (await canLaunch(
                              _youtubeController.youtubeVideos[index].url)) {
                            launch(_youtubeController.youtubeVideos[index].url);
                          }
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              "https://img.youtube.com/vi/" +
                                  (getIdFromUrl(_youtubeController
                                          .youtubeVideos[index].url) ??
                                      "") +
                                  "/mqdefault.jpg",
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _youtubeController
                                        .youtubeVideos[index].uploadedById
                                        .toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    _youtubeController
                                        .youtubeVideos[index].uploadedOn
                                        .toIso8601String(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              indent: 10,
                              endIndent: 10,
                              color: Colors.grey,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    _youtubeController
                                        .youtubeVideos[index].groupIdId
                                        .toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  final textField = TextFormField(
    maxLines: 3,
    autofocus: false,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
        hintText: "説明文",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        )),
  );
}
