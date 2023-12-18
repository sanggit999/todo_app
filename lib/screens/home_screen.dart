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
            ],
          ),
          Positioned(
              top: 200,
              bottom: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: devices.width,
                      height: devices.height * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colors.primaryContainer),
                      child: ListView.builder(
                          itemCount: 8,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Text("OK OK");
                          }),
                    ),
                    const Gap(20),
                    Text(
                      "Đã hoàn thành ",
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    Container(
                      width: devices.width,
                      height: devices.height * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colors.primaryContainer),
                      child: ListView.builder(
                          itemCount: 8,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Text("Home");
                          }),
                    ),
                    const Gap(20),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: DisplayWhiteText(
                            text: "Thêm nhiệm vụ mới",
                            fontSize: 18,
                          ),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
