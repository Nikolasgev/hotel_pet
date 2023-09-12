import 'package:flutter/material.dart';
import 'package:tz_hotel/models/booking_info.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tz_hotel/views/payment_success.dart';
import '../components/common_button.dart';
import '../components/custom_textfield.dart';
import '../components/price_line.dart';
import '../components/turist_card.dart';
import '../services/remote_services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({
    super.key,
  });

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<Widget> createdWidgets = [];

  int i = 0;
  List<String> names = [
    'Первый',
    "Второй",
    'Третий',
    'Четвёртый',
    'Пятый',
    'Шестой',
    'Седьмой',
    'Восьмой',
    'Девятый',
    'Десятый',
    'Одиннадцатый',
    'Двенадцатый',
    'Тринадцатый',
    'Четырнадцатый',
    'Пятнадцатый'
  ];

  void addWidget() {
    if (i == 14) {
      i = 0;
    }
    ;
    setState(() {
      createdWidgets.add(
        TutistCard(
          name: names[i],
        ),
      ); // Добавляем новый виджет
    });
    i++;
  }

  BookingInfo? bookingInfo;
  static bool isLoaded = false;

  bool isButtonEnabled = false;

  TextEditingController textFieldNum_controller = TextEditingController();
  TextEditingController textFieldEm_controller = TextEditingController();
  TextEditingController textFieldName_controller = TextEditingController();
  TextEditingController textField2Name_controller = TextEditingController();
  TextEditingController textFieldDate_controller = TextEditingController();
  TextEditingController textFieldCit_controller = TextEditingController();
  TextEditingController textFieldPassNum_controller = TextEditingController();
  TextEditingController textFieldPassVP_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getData();
    });
  }

  getData() async {
    bookingInfo = await RemoteService().getBookingInfo();
    if (bookingInfo != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  isFieldEmty(content, state) {
    if (content != null) {
      state = true;
      if (textFieldNum_controller.text.isNotEmpty &&
          textFieldEm_controller.text.isNotEmpty &&
          textFieldName_controller.text.isNotEmpty &&
          textField2Name_controller.text.isNotEmpty &&
          textFieldDate_controller.text.isNotEmpty &&
          textFieldCit_controller.text.isNotEmpty &&
          textFieldPassNum_controller.text.isNotEmpty &&
          textFieldPassVP_controller.text.isNotEmpty) {
        setState(() {
          isButtonEnabled = true;
        });
      }
    }
  }

  static bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    int bookingSum = (bookingInfo?.tourPrice ?? 0) + (bookingInfo?.fuelCharge ?? 0) + (bookingInfo?.serviceCharge ?? 0);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Бронирование',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            height: 1.20,
          ),
        ),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 8.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: ShapeDecoration(
                            color: const Color(0x33FFC600),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 15,
                                color: Color(0xFFFFA800),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                '${bookingInfo?.horating} ${bookingInfo?.ratingName}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFFFFA800),
                                  fontSize: 16,
                                  fontFamily: 'SF Pro Display',
                                  fontWeight: FontWeight.w500,
                                  height: 1.20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        '${bookingInfo?.hotelName}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w500,
                          height: 1.20,
                        ),
                      ),
                      // const SizedBox(height: 8,),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerLeft,
                        ),
                        child: Text(
                          '${bookingInfo?.hotelAdress}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w500,
                            height: 1.20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Вылет из',
                          style: TextStyle(
                            color: Color(0xFF828796),
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Страна, город',
                          style: TextStyle(
                            color: Color(0xFF828796),
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Даты',
                          style: TextStyle(
                            color: Color(0xFF828796),
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Кол-во ночей',
                          style: TextStyle(
                            color: Color(0xFF828796),
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Отель',
                          style: TextStyle(
                            color: Color(0xFF828796),
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Номер',
                          style: TextStyle(
                            color: Color(0xFF828796),
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          'Питание',
                          style: TextStyle(
                            color: Color(0xFF828796),
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${bookingInfo?.departure}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          '${bookingInfo?.arrivalCountry}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          '${bookingInfo?.tourDateStart} - ${bookingInfo?.tourDateStop}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          '${bookingInfo?.numberOfNights} ночей',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: 240,
                          child: Text(
                            '${bookingInfo?.hotelName}',
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'SF Pro Display',
                              fontWeight: FontWeight.w400,
                              // height: 1.20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          '${bookingInfo?.room}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          '${bookingInfo?.nutrition}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            height: 1.20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Информация о покупателе',
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
                    CustomTextField(
                      controller: textFieldNum_controller,
                      onCanged: (content) {
                        isFieldEmty(content, textFieldNum_controller);
                      },
                      lable: 'Номер телефона',
                      hintText: '+7 (***) ***-**-**',
                      formatters: [
                        MaskTextInputFormatter(mask: "###-###-##-##"),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      controller: textFieldEm_controller,
                      onCanged: (content) {
                        isFieldEmty(content, textFieldEm_controller);
                      },
                      lable: 'Электронная почта',
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
                      style: TextStyle(
                        color: Color(0xFF828796),
                        fontSize: 14,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w400,
                        height: 1.20,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
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
                        const Text(
                          'Первый турист ',
                          style: TextStyle(
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
                            //TODO
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
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            controller: textFieldName_controller,
                            onCanged: (content) {
                              isFieldEmty(content, textFieldName_controller);
                            },
                            lable: 'Имя',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: textField2Name_controller,
                            onCanged: (content) {
                              isFieldEmty(content, textField2Name_controller);
                            },
                            lable: 'Фамилия',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: textFieldDate_controller,
                            onCanged: (content) {
                              isFieldEmty(content, textFieldDate_controller);
                            },
                            lable: 'Дата рождения',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: textFieldCit_controller,
                            onCanged: (content) {
                              isFieldEmty(content, textFieldCit_controller);
                            },
                            lable: 'Гражданство',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: textFieldPassNum_controller,
                            onCanged: (content) {
                              isFieldEmty(content, textFieldPassNum_controller);
                            },
                            lable: 'Номер загранпаспорта',
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextField(
                            controller: textFieldPassVP_controller,
                            onCanged: (content) {
                              isFieldEmty(content, textFieldPassVP_controller);
                            },
                            lable: 'Срок действия загранпаспорта',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              children: createdWidgets,
            ),
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Добавить туриста',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 1.20,
                      ),
                    ),
                    // todo
                    Container(
                      decoration: ShapeDecoration(
                        color: const Color(0xFF0D72FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          addWidget();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
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
                    PriceLine(
                      text: 'Тур',
                      value: bookingInfo?.tourPrice,
                    ),
                    PriceLine(
                      text: 'Топливный сбор',
                      value: bookingInfo?.fuelCharge,
                    ),
                    PriceLine(
                      text: 'Сервисный сбор',
                      value: bookingInfo?.serviceCharge,
                    ),
                    PriceLine(
                      text: 'К оплате',
                      value: bookingSum,
                      varStyle: const TextStyle(
                        color: Color(0xFF0D72FF),
                        fontSize: 16,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                        height: 1.20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 12, bottom: 28),
                child: CommonButton(
                  text:
                      'Оплатить $bookingSum ₽',
                  onTap: () {
                    if (isButtonEnabled) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentSuccess(),
                        ),
                      );
                    } else {
                      Fluttertoast.showToast(
                          msg: "Проверьте корректность введенных данных",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
