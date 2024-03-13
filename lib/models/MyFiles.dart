import 'package:servisify/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalStorage;
  final int? numOfFiles, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Total Revenue",
    numOfFiles: 50000,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Total Transaction",
    numOfFiles: 20000,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: "",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Total Users",
    numOfFiles: 10000,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Total Providers",
    numOfFiles: 5328,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
