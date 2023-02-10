import 'package:flutter/material.dart';

class Jobs {
  String? picture;
  String? name;
  String? price;
  String? title;
  String? descrption;

  String? files;
  String? bids;
  String? minPosted;
  String? days;
  Icon? dot;
  Icon? daysIcon;
  Icon? fileIcon;
  Icon? bidIcons;
  List<Jobs>? jobSingles;
  // List<Jobs> descriptionModel;

  Jobs({
    this.picture,
    this.name,
    this.price,
    this.title,
    this.descrption,
    this.files,
    this.bids,
    this.days,
    this.dot,
    this.minPosted,
    this.daysIcon,
    this.fileIcon,
    this.bidIcons,
    this.jobSingles,
    l,
    String? tag1,
    String? tag2,
  });
}
