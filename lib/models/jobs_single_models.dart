import 'package:flutter/material.dart';

import 'package:skupal/models/jobs.dart';

class Jobs_Single extends Jobs {
  String? picture;
  String? name;
  String? price;
  String? title;
  String? descrption;
  String tag1;
  String tag2;
  String tag3;
  String tag4;
  String priceLabel;
  String durationLabel;
  String? daysLabel;
  String milestoneLabel;
  String milestone;
  String? files;
  String? bids;
  String? minPosted;
  String? days;
  String location;
  Icon? dot;
  Icon? daysIcon;
  Icon? fileIcon;
  Icon? bidIcons;
  List<Jobs>? jobSingles;

  Jobs_Single(
    this.picture,
    this.name,
    this.price,
    this.title,
    this.descrption,
    this.tag1,
    this.tag2,
    this.tag3,
    this.tag4,
    this.priceLabel,
    this.location,
    this.durationLabel,
    this.milestoneLabel,
    this.milestone,
    this.files,
    this.bids,
    this.minPosted,
    this.days,
    this.dot,
    this.daysIcon,
    this.fileIcon,
    this.bidIcons,
    this.jobSingles,
  ) : super(
          bidIcons: bidIcons,
          picture: picture,
          name: name,
          price: price,
          title: title,
          descrption: descrption,
          files: files,
          bids: bids,
          minPosted: minPosted,
          days: days,
          dot: dot,
          daysIcon: daysIcon,
          fileIcon: fileIcon,
          jobSingles: jobSingles,
        );
}
