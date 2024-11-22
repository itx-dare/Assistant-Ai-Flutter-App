import '../main.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';
import '../model/onboard.dart';
import '../widget/custom_btn.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();

    final list = [
      // Onboarding Screen 1
      Onboard(
          title: 'Ask Anything to me',
          subtitle:
              'I\'m here to be your best friend! Ask me anything, and I\'ll do my best to help, guide, or just chat with you. Whether you need answers, advice, or a friendly conversation, I\'m here for you!',
          lottie: 'animation1'),

      // Onboarding Screen 2
      Onboard(
        title: 'Imagination to Reality World',
        lottie: 'animation5',
        subtitle:
            'Let your imagination run wild! Share your ideas with me, and I\'ll create something truly wonderful just for you!',
      ),
    ];

    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (ctx, ind) {
          final isLast = ind == list.length - 1;

          return Column(
            children: [
              Lottie.asset('assets/lottie/${list[ind].lottie}.json',
                  height: mq.height * .7, width: isLast ? mq.width * .8 : null),
              Text(
                list[ind].title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: .5),
              ),
              SizedBox(height: mq.height * .015),
              SizedBox(
                width: mq.width * .7,
                child: Text(
                  list[ind].subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13.5,
                      letterSpacing: .5,
                      color: Theme.of(context).lightTextColor),
                ),
              ),
              const Spacer(),
              Wrap(
                spacing: 10,
                children: List.generate(
                    list.length,
                    (i) => Container(
                          width: i == ind ? 15 : 10,
                          height: 8,
                          decoration: BoxDecoration(
                              color: i == ind ? Colors.orangeAccent : Colors.grey,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        )),
              ),
              const Spacer(),
              CustomBtn(
                  onTap: () {
                    if (isLast) {
                      Get.off(() => const HomeScreen());
                    } else {
                      c.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease);
                    }
                  },
                  text: isLast ? 'Finish' : 'Next'),
              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}
