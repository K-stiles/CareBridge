import 'package:flutter/material.dart';
import 'package:the_rock_mobile/utility/parse_auth_userid.dart';

import '../constants/app_images.dart';

class ChatModel {
  String id;
  String patientName;
  String message;
  String time;
  String image;

  ChatModel({
    required this.id,
    required this.patientName,
    required this.message,
    required this.time,
    required this.image,
  });
}

class Message {
  Colors? background;
  Colors? msgColor;
  String sender;
  bool iamSender;
  String message;
  String time;

  Message({
    this.background,
    this.msgColor,
    required this.sender,
    required this.iamSender,
    required this.message,
    required this.time,
  });
}

List<ChatModel> localChats = [
  ChatModel(
    id: "d69f438e-08c1-4eb0-93c3-c0017c5d68c9",
    patientName: "Ester Howard",
    message: "Hi Doc",
    time: "5:30pm",
    image: AppImages.patient1,
  ),
  ChatModel(
    id: "0a3736b4-8ac6-4946-994e-ba25e0f94bb8",
    patientName: "Annette Black",
    message: "In this article, we will examine how to gyvtfcgvbjk",
    time: "5:30pm",
    image: AppImages.patient2,
  ),
  ChatModel(
    id: "7fc47964-77a2-48a4-b263-f0ab4137725e",
    patientName: "Devon Lane",
    message: "the Screen Capture API varies. General yugytuhjg",
    time: "5:30pm",
    image: AppImages.patient3,
  ),
  ChatModel(
    id: "4f44049f-a8d8-466d-8062-1e7fdba0ec87",
    patientName: "Floy Miles",
    message: "A logical display surface is onbvhu buijkn",
    time: "5:30pm",
    image: AppImages.patient4,
  ),
  ChatModel(
    id: "27afeb5e-b486-4880-8676-784cfeea31d3",
    patientName: "Theressa Web",
    message: "For the purposes of the Screen Capture ijbuyvhjkh",
    time: "5:30pm",
    image: AppImages.patient5,
  ),
];

List<Message> chatMessages = [
  Message(
    iamSender: false,
    message:
        "Good evening Doc. I hope you are well.  I have been experiencing a really bad headache since yesterday. I feel it mostly behind my eyes sockets",
    sender: "Dr. Alexander",
    time: "12:30 pm",
  ),
  Message(
    iamSender: true,
    message:
        "Good evening Doc. I hope you are well.  I have been experiencing a really bad headache since yesterday. I feel it mostly behind my eyes sockets",
    sender: "me",
    time: "10:00 am",
  ),
  Message(
    iamSender: false,
    message: "Were you able for finish the work i gave you?",
    sender: "Dr. Alexander",
    time: "2:30 pm",
  ),
  Message(
    iamSender: false,
    message: "Yhea! How are you doing?",
    sender: "Dr. Alexander",
    time: "1:00 pm",
  ),
  Message(
    iamSender: true,
    message: "hi 🖐🏽",
    sender: "me",
    time: "10:00 am",
  ),
];
