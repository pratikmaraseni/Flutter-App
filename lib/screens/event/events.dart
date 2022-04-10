import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';

import '../home/components/top_bar.dart';
import 'controller/event_controller.dart';
import '../../utils/hex_color.dart';

class Events extends StatelessWidget {
  Events({Key? key}) : super(key: key);
  final _eventController = Get.find<EventController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: TopBar(
            title: 'ホーム',
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.grey,
                child: CalendarCarousel<Event>(
                  weekFormat: false,
                  daysTextStyle: const TextStyle(color: Colors.black),
                  dayCrossAxisAlignment: CrossAxisAlignment.start,
                  dayMainAxisAlignment: MainAxisAlignment.start,
                  dayButtonColor: Colors.white,
                  daysHaveCircularBorder: false,
                  dayPadding: 0.0,
                  todayBorderColor: Colors.cyan,
                  todayButtonColor: Colors.cyan,
                  weekdayTextStyle: const TextStyle(color: Colors.white),
                  weekDayBackgroundColor: Colors.grey,
                  weekDayMargin: EdgeInsets.zero,
                  weekDayPadding: const EdgeInsets.all(8.0),
                  weekendTextStyle: const TextStyle(color: Colors.black),
                  headerMargin: const EdgeInsets.all(8.0),
                  headerTextStyle: const TextStyle(color: Colors.white),
                  leftButtonIcon: const Icon(
                    Icons.arrow_left_rounded,
                    color: Colors.white,
                  ),
                  rightButtonIcon: const Icon(
                    Icons.arrow_right_rounded,
                    color: Colors.white,
                  ),
                  height: 350,
                  customGridViewPhysics: const NeverScrollableScrollPhysics(),
                  pageSnapping: true,
                  showOnlyCurrentMonthDate: false,
                  markedDatesMap: _eventController.cevents.value,
                ),
              ),
              const SizedBox(height: 16.0),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _eventController.events.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _eventController.events[index].eventDate
                                    .toIso8601String(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 4.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: HexColor(_eventController
                                            .events[index].color),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          _eventController
                                              .events[index].groupIdId
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    _eventController.events[index].dateObj
                                        .toIso8601String(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "場所： " + _eventController.events[index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "詳細：",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Expanded(
                                      child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    enabled: false,
                                    textAlign: TextAlign.start,
                                    initialValue: _eventController
                                        .events[index].description,
                                    maxLines: 5,
                                    decoration: const InputDecoration(
                                      fillColor: Colors.red,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 8.0),
                                      hintText: "",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                    ),
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        )
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
