import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  void _handleSubmitted(String value) {
    print('Submitted value: $value');
    FocusScope.of(context).unfocus();
  }

  final fromController = TextEditingController();
  String fromCurrency = 'SAR';
  String toCurrency = 'INR';
  String result = '';
  void _swapValues() {
    setState(() {
      String temp = fromCurrency;
      fromCurrency = toCurrency;
      toCurrency = temp;
    });
  }

  Future<String> convertCurrency() async {
    String apiKey = 'afed1820ffbd97722fbbdb05728fa365';
    String apiUrl =
        'https://api.currencyscoop.com/v1/convert?api_key=$apiKey&from=$fromCurrency&to=$toCurrency&amount=${fromController.text}';

    var response = await http.get(Uri.parse(apiUrl));
    var jsonResponse = json.decode(response.body);

    setState(() {
      result = jsonResponse['response']['value'].toString();
    });
    final formatCurrency = NumberFormat.currency(
      decimalDigits: 2,
      symbol: '',
    );
    String formattedResult = formatCurrency.format(double.parse(result));
    setState(() {
      result = formattedResult;
    });
    return formattedResult;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Sans'),
      title: 'Currency Converter',
      home: Scaffold(
        backgroundColor: Color(0xffe4e4e4),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff004294),
          // backgroundColor: Colors.red,
          title: Text('Convert Currency'),
        ),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('image/Poster 1.png'),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    onSubmitted: _handleSubmitted,
                    controller: fromController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Amount',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      DropdownButton<String>(
                        icon: Icon(
                          Icons.unfold_more,
                          color: Colors.red[700],
                        ),
                        value: fromCurrency,
                        items: <String>[
                          // 'INR', 'USD', 'EUR', 'GBP', 'JPY'
                          'AED',
                          'AFA',
                          'ALL',
                          'AMD',
                          'ANG',
                          'AOR',
                          'ARS',
                          'AUD',
                          'AWG',
                          'AZN',
                          'BBD',
                          'BDT',
                          'BGN',
                          'BHD',
                          'BIF',
                          'BMD',
                          'BND',
                          'BOB',
                          'BRL',
                          'BSD',
                          'BTN',
                          'BWP',
                          'BYN',
                          'BZD',
                          'CAD',
                          'CDF',
                          'CHF',
                          'CLP',
                          'CNY',
                          'COP',
                          'CRC',
                          'CUP',
                          'CVE',
                          'CZK',
                          'DJF',
                          'DKK',
                          'DOP',
                          'DZD',
                          'EEK',
                          'EGP',
                          'ERN',
                          'ETB',
                          'EUR',
                          'FJD',
                          'FKP',
                          'GBP',
                          'GEL',
                          'GHS',
                          'GIP',
                          'GMD',
                          'GNF',
                          'GTQ',
                          'GYD',
                          'HKD',
                          'HNL',
                          'HRK',
                          'HTG',
                          'HUF',
                          'IDR',
                          'ILS',
                          'INR',
                          'IQD',
                          'IRR',
                          'ISK',
                          'JMD',
                          'JOD',
                          'JPY',
                          'KES',
                          'KGS',
                          'KHR',
                          'KMF',
                          'KPW',
                          'KRW',
                          'KWD',
                          'KYD',
                          'KZT',
                          'LAK',
                          'LBP',
                          'LKR',
                          'LRD',
                          'LSL',
                          'LTL',
                          'LVL',
                          'LYD',
                          'MAD',
                          'MDL',
                          'MGA',
                          'MKD',
                          'MMK',
                          'MNT',
                          'MOP',
                          'MRO',
                          'MUR',
                          'MVR',
                          'MWK',
                          'MXN',
                          'MYR',
                          'MZN',
                          'NAD',
                          'NGN',
                          'NIO',
                          'NOK',
                          'NPR',
                          'NZD',
                          'OMR',
                          'PAB',
                          'PEN',
                          'PGK',
                          'PHP',
                          'PKR',
                          'PLN',
                          'PYG',
                          'QAR',
                          'RON',
                          'RSD',
                          'RUB',
                          'RWF',
                          'SAR',
                          'SBD',
                          'SCR',
                          'SDG',
                          'SEK',
                          'SGD',
                          'SHP',
                          'SLL',
                          'SOS',
                          'SRD',
                          'STD',
                          'SVC',
                          'SYP',
                          'SZL',
                          'THB',
                          'TJS',
                          'TMT',
                          'TND',
                          'TOP',
                          'TRY',
                          'TTD',
                          'TWD',
                          'TZS',
                          'UAH',
                          'UGX',
                          'USD',
                          'UYU',
                          'UZS',
                          'VEF',
                          'VND',
                          'VUV',
                          'WST',
                          'XAF',
                          'XAG',
                          'XAU',
                          'XCD',
                          'XDR',
                          'XFO',
                          'XFU',
                          'XOF',
                          'XPD',
                          'XPF',
                          'XPT',
                          'YER',
                          'ZAR',
                          'ZMK',
                          'ZWL'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) async {
                          setState(() {
                            fromCurrency = newValue!;
                          });
                        },
                      ),
                      IconButton(
                          onPressed: _swapValues,
                          icon: Image.asset(
                            'image/switch.png',
                            height: 25,
                            width: 30,
                          )),
                      DropdownButton<String>(
                        icon: Icon(
                          Icons.unfold_more,
                          color: Colors.green[800],
                        ),
                        value: toCurrency,
                        items: <String>[
                          // 'INR', 'USD', 'EUR', 'GBP', 'JPY'
                          'AED',
                          'AFA',
                          'ALL',
                          'AMD',
                          'ANG',
                          'AOR',
                          'ARS',
                          'AUD',
                          'AWG',
                          'AZN',
                          'BBD',
                          'BDT',
                          'BGN',
                          'BHD',
                          'BIF',
                          'BMD',
                          'BND',
                          'BOB',
                          'BRL',
                          'BSD',
                          'BTN',
                          'BWP',
                          'BYN',
                          'BZD',
                          'CAD',
                          'CDF',
                          'CHF',
                          'CLP',
                          'CNY',
                          'COP',
                          'CRC',
                          'CUP',
                          'CVE',
                          'CZK',
                          'DJF',
                          'DKK',
                          'DOP',
                          'DZD',
                          'EEK',
                          'EGP',
                          'ERN',
                          'ETB',
                          'EUR',
                          'FJD',
                          'FKP',
                          'GBP',
                          'GEL',
                          'GHS',
                          'GIP',
                          'GMD',
                          'GNF',
                          'GTQ',
                          'GYD',
                          'HKD',
                          'HNL',
                          'HRK',
                          'HTG',
                          'HUF',
                          'IDR',
                          'ILS',
                          'INR',
                          'IQD',
                          'IRR',
                          'ISK',
                          'JMD',
                          'JOD',
                          'JPY',
                          'KES',
                          'KGS',
                          'KHR',
                          'KMF',
                          'KPW',
                          'KRW',
                          'KWD',
                          'KYD',
                          'KZT',
                          'LAK',
                          'LBP',
                          'LKR',
                          'LRD',
                          'LSL',
                          'LTL',
                          'LVL',
                          'LYD',
                          'MAD',
                          'MDL',
                          'MGA',
                          'MKD',
                          'MMK',
                          'MNT',
                          'MOP',
                          'MRO',
                          'MUR',
                          'MVR',
                          'MWK',
                          'MXN',
                          'MYR',
                          'MZN',
                          'NAD',
                          'NGN',
                          'NIO',
                          'NOK',
                          'NPR',
                          'NZD',
                          'OMR',
                          'PAB',
                          'PEN',
                          'PGK',
                          'PHP',
                          'PKR',
                          'PLN',
                          'PYG',
                          'QAR',
                          'RON',
                          'RSD',
                          'RUB',
                          'RWF',
                          'SAR',
                          'SBD',
                          'SCR',
                          'SDG',
                          'SEK',
                          'SGD',
                          'SHP',
                          'SLL',
                          'SOS',
                          'SRD',
                          'STD',
                          'SVC',
                          'SYP',
                          'SZL',
                          'THB',
                          'TJS',
                          'TMT',
                          'TND',
                          'TOP',
                          'TRY',
                          'TTD',
                          'TWD',
                          'TZS',
                          'UAH',
                          'UGX',
                          'USD',
                          'UYU',
                          'UZS',
                          'VEF',
                          'VND',
                          'VUV',
                          'WST',
                          'XAF',
                          'XAG',
                          'XAU',
                          'XCD',
                          'XDR',
                          'XFO',
                          'XFU',
                          'XOF',
                          'XPD',
                          'XPF',
                          'XPT',
                          'YER',
                          'ZAR',
                          'ZMK',
                          'ZWL'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) async {
                          setState(() {
                            toCurrency = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(150, 50)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xff004294))),
                    onPressed: () {
                      convertCurrency();
                      fromController.clear();
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      result,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
