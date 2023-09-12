import 'package:flutter/material.dart';
import 'custom_textfield.dart';

class TutistCard extends StatefulWidget {
  const TutistCard({super.key, required this.name});

  final String name;

  @override
  State<TutistCard> createState() => _TutistCardState();
}

class _TutistCardState extends State<TutistCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.name} турист ',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w500,
                              height: 1.20,
                            ),
                          ),
                          Container(
                            decoration: ShapeDecoration(
                              color: const Color.fromARGB(
                                30,
                                13,
                                114,
                                255,
                              ),
                              //rgba(13, 114, 255, 0.1)
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                              },
                              icon: isSelected
                                  ? const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Color.fromARGB(
                                        100,
                                        13,
                                        114,
                                        255,
                                      ),
                                    )
                                  : const Icon(
                                      Icons.keyboard_arrow_up_rounded,
                                      color: Color.fromARGB(
                                        100,
                                        13,
                                        114,
                                        255,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: isSelected,
                        child: const Column(
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            CustomTextField(
                              lable: 'Имя',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomTextField(
                              lable: 'Фамилия',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomTextField(
                              lable: 'Дата рождения',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomTextField(
                              lable: 'Гражданство',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomTextField(
                              lable: 'Номер загранпаспорта',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomTextField(
                              lable: 'Срок действия загранпаспорта',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}