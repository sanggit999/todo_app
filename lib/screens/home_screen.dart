import 'package:flutter/material.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/widgets/display_white_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final devices = context.deviceSize;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: devices.width,
                height: devices.height * 0.3,
                color: colors.primary,
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DisplayWhiteText(
                        text: "Ngày 18 Tháng 12 Năm 2023",
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      Gap(20),
                      DisplayWhiteText(
                        text: "Danh Sách Làm Việc",
                        fontSize: 40,
                      )
                    ]),
              ),
              Positioned(
                  child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      width: devices.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colors.primaryContainer),
                      child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Text("OK OK");
                          }),
                    )
                  ],
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
