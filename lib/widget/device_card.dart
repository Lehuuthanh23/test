import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thuc_tap/core/core.dart';
import 'package:thuc_tap/model/device.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({super.key, required this.data});
  final Device data;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          gradient: const LinearGradient(
            colors: [
              Color(0xFFEB6E2C),
              Color(0xFFFABD1D),
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          )),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/image/maychieu.png",
                        width: 50,
                        height: 50,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.id,
                          style: const TextStyle(color: Colors.amber),
                        ),
                        Text(data.name),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Trạng thái: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              data.status,
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 13),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Loại: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              data.type,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Thư mục: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              data.directory,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Chủ: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text(
                              data.owner,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Chuyển thư mục',
                    style: TextStyle(fontSize: 13),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Chia sẻ',
                    style: TextStyle(fontSize: 13),
                  ),
                  Icon(
                    Icons.share,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Xóa thiết bị',
                    style: TextStyle(fontSize: 13),
                  ),
                  Icon(
                    Icons.close,
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
