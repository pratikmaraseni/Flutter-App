import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart' as cevent;
import 'package:get/get.dart';

import '../model/event.dart';
import '../service/event_service.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/hex_color.dart';

class EventController extends GetxController {
  final EventService _eventService = serviceLocator<EventService>();
  RxList<Event> events = <Event>[].obs;
  Rx<EventList<cevent.Event>> cevents = EventList<cevent.Event>(events: {}).obs;

  getEvents({required Map<String, dynamic> data}) async {
    await _eventService.getAllEvents(data).then((value) {
      if (value != null) {
        events.value = value.events;
        for (int i = 0; i < value.events.length; i++) {
          cevents.value.add(
            value.events[i].dateObj,
            cevent.Event(
                title: value.events[i].title,
                date: value.events[i].dateObj,
                dot: Container(
                  height: 3,
                  color: HexColor(value.events[i].color),
                )),
          );
          if (i > 9) {
            return;
          }
        }
      }
    });
  }
}
