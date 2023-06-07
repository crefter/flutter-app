import 'dart:async';

import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum ColorEvent { event_red, event_green }

class ColorBloc {
  Color _color = Colors.red;
  // _inPutEventController - это стрим контроллер который будет принимать тип колорэвент

  final _inPutEventController = StreamController<ColorEvent>();

  /* когда мы нажимаем кнопку то событие стрим мы должны отпавить в поток - это сейчас и сделаем
при помощи стрим контроллера смоделируем этот поток данных
делее опишем геттер для вдохного потока для этого воспользуемся потоком стримсинг - гетер бует возвращать инпут евент контроллер с пармаетром
синк - входной поток куда пользователь добавлят события или данные поэтому у _inPutEventController вызываем .sink 
геттер удобно делать так дается осмыслинное название и назначение  
*/
  StreamSink<ColorEvent> get inputEventSink => _inPutEventController.sink;

  // 1 поток StreamController от событий - Event -создали
  //теперь необходим 2 поток StreamController состояния - State -
  //куда будем передвать новое состояние которое будет содержать в себе новое состояние цвета

  final _outputStateController = StreamController<Color>();
  Stream<Color> get outputStateStream => _outputStateController.stream;

  // вызываем метод _outputEventController где stream - выходной поток
  // осталось реализрватиь метод который будет преобразовывать события в новое событие Event -> new State
  // метод будет называться
  void _mapEventToState(ColorEvent event) {
    //в этом методе _mapEventToState мы преобразуем полученный event в данные бизнес логики
    if (event == ColorEvent.event_red) {
      _color = Colors.red; // в данном случае мы получим цвет
    }
    if (event == ColorEvent.event_green) {
      _color = Colors.green;
    }
    // else {
    //   throw Exception('Wrong Event Type');
    // }

    _outputStateController.sink.add(_color);
  } // и после нового состояния в зависимости от собыйтия его нужно добавить в выходной поток используя метод add у sink

  // после преобразования нужно подписаться на прослушивание выходного потока на новое состояние
  // для этого созданим конструктор
  ColorBloc() {
    _inPutEventController.stream.listen(
        _mapEventToState); // подписываемся на поток и обрабатываем события со сторону UI
  } // по окончании потоков их нужно закрыть
  void dispose() {
    _inPutEventController.close();
    _outputStateController.close();
  }
}
