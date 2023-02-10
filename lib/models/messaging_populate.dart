import 'package:skupal/models/messaging_model.dart';

class Messaging_Populate {
  static List<Messaging_Model> messagingFnc() {
    return [
      Messaging_Model(
          img: 'david_collen.png',
          title: 'Davide Collen',
          sub: 'How are you?',
          mark: 'mark_double.png',
          time: '6:55AM',
          no_of_msgs: '5'),
      Messaging_Model(
          img: 'Flyd.png',
          title: 'Floyd Miles',
          sub: 'I just sent you the files',
          mark: 'mark_double.png',
          time: '6:55AM',
          no_of_msgs: ''),
      Messaging_Model(
          img: 'theresa.png',
          title: 'Theresa Webb',
          sub: 'When can you deliver?',
          mark: 'mark_double.png',
          time: '6:55AM',
          no_of_msgs: '')
    ];
  }
}
