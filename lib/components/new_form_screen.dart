import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'secondary_button.dart';
import '../utils/auth.dart';
import '../screens/timeline/controller/timeline_controller.dart';

class NewScreen extends StatelessWidget {
  NewScreen({Key? key}) : super(key: key);

  final _timelineController = Get.find<TimelineController>();
  final _key = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SizedBox(
              width: 50,
            ),
            Text(
              "投稿",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 50,
            ),
            Text("完了"),
          ],
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
            color: Colors.white,
            size: 24.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset("assets/nice.svg"),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset("assets/sun.svg"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormBuilder(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                "U10（選手）グループに投稿",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 2,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              FormBuilderTextField(
                                name: 'message',
                                key: _key,
                                maxLines: 10,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      SecondaryButton(
                          callback: () {
                            FormBuilderFieldState? state = _key.currentState;
                            if (state != null) {
                              _timelineController.createTimeLine(
                                data: {
                                  "sessionId": Auth.sessionId,
                                  'group': Auth.groupId,
                                  'message': state.value,
                                },
                              );
                            }
                          },
                          name: "登録"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
