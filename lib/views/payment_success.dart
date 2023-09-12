import 'package:flutter/material.dart';
import 'dart:math';

import 'package:tz_hotel/components/common_button.dart';
import 'package:tz_hotel/views/home_page.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    int randomNumber = Random().nextInt(888888) + 100000;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Заказ оплачен',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            height: 1.20,
          ),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 94,
                height: 94,
                decoration: const BoxDecoration(
                  color: Color(0xFFF6F6F9),
                  shape: BoxShape.circle,
                ),
                child:
                    Center(child: Image.asset('assets/icons/party-popper.png')),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Ваш заказ принят в работу',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  height: 1.20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Подтверждение заказа №$randomNumber может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF828796),
                  fontSize: 16,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  height: 1.20,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: 50,
          child: CommonButton(
            text: 'Супер!',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
