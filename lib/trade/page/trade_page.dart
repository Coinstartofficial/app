import 'package:coinstart_wallet_extension/base/Global.dart';
import 'package:coinstart_wallet_extension/base/image_helper.dart';
import 'package:coinstart_wallet_extension/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:neveruseless/neveruseless.dart';
import 'package:ones/ui.dart';

import '../../main.dart';

class TradePage extends StatefulWidget {
  final Map? arguments;

  const TradePage({Key? key, this.arguments}) : super(key: key);

  @override
  createState() => _TradePageState();
}

class _TradePageState extends State<TradePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List allCoinList = [
    "ETH",
    "SUI",
    "AVAX",
    "BNB",
    "FIL",
    "OKX",
    "SNX",
    "TRX",
    "USDT",
  ];

  String fromCoin = "ETH";

  String toCoin = "USDT";

  @override
  void initState() {
    super.initState();
    PagePick.nowPageName = '/SwapPage';

    neverBus.on('checkLanguage', (object) {
      setState(() {
        if (object == "en") {
          print("切换语言EN");
          localNow = "English";
          S.load(const Locale('en', 'US'));
        } else {
          print("切换语言ZH");
          localNow = "中文简体";
          S.load(const Locale("zh", "ZH"));
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      right: true,
      bottom: false,
      left: true,
      top: false,
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          children: [
            Row(
              children: [
                Text(S.current.Swap).fontSize(26).fontWeight(FontWeight.w700),
                const Spacer(),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.pushNamed(context, "/SwapRecordPage");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Text(
                      S.current.Swap_Record,
                      style: const TextStyle(
                          color: Color(0xffBEBEBE), fontSize: 13),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 230,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Stack(
                alignment: const Alignment(0, -0.04),
                children: [
                  // 支付
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          addCoinSheet("from");
                        },
                        child: Container(
                          height: 107,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: const Color(0xff1E1E1E),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Sell',
                                    style: TextStyle(
                                        color: Color(0xffFCFCFC),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      ImageHelper(
                                        '/icons/crypto/$fromCoin.png',
                                        width: 38,
                                        height: 38,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                fromCoin,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const ImageHelper(
                                                  '/icons/arrow_down.png'),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            fromCoin,
                                            style: const TextStyle(
                                                color: Color(0xff737373),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/cash_transaction_package.png',
                                        width: 10,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      const Text(
                                        '0',
                                        style: TextStyle(
                                            color: Color(0xff737373),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  // const SizedBox(
                                  //   height: 5,
                                  // ),
                                  // const Text(
                                  //   '\$1,141.87',
                                  //   style: TextStyle(color: Color(0xff737373), fontSize: 12, fontWeight: FontWeight.w400),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      InkWell(
                        onTap: () {
                          addCoinSheet("to");
                        },
                        child: Container(
                          // width: 400 - 20 - 20,
                          height: 107,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: const Color(0xff1E1E1E),
                              border: Border.all(
                                  color: const Color(0xff303030), width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Buy',
                                    style: TextStyle(
                                        color: Color(0xffFCFCFC),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      ImageHelper(
                                        '/icons/crypto/$toCoin.png',
                                        width: 38,
                                        height: 38,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                toCoin,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const ImageHelper(
                                                  '/icons/arrow_down.png'),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            toCoin,
                                            style: const TextStyle(
                                                color: Color(0xff737373),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/cash_transaction_package.png',
                                        width: 10,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      const Text(
                                        '0',
                                        style: TextStyle(
                                            color: Color(0xff737373),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  // const SizedBox(
                                  //   height: 5,
                                  // ),
                                  // const Text(
                                  //   '\$1,141.87',
                                  //   style: TextStyle(color: Color(0xff737373), fontSize: 12, fontWeight: FontWeight.w400),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        String tt = fromCoin;
                        fromCoin = toCoin;
                        toCoin = tt;
                      });
                    },
                    child: Image.asset(
                      'assets/images/cash_transaction_change.png',
                      width: 32,
                      height: 32,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            // 余额
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xff212121),
                  // border: Border.all(color: Color(0xff303030), width: 1)
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Insufficient balance',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '1 $fromCoin ≈ 1 $toCoin ',
                  style: const TextStyle(
                      color: Color(0xff737373),
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ],
            )

            // Container(
            //   margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            //   padding: const EdgeInsets.all(20),
            //   height: 146,
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: const Color(0xFF131315), border: Border.all(color: const Color(0xff303030), width: 1)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             S.current.fuel_cost,
            //             style: const TextStyle(color: Color(0xff999999), fontSize: 12, fontWeight: FontWeight.w500),
            //           ),
            //           Text(
            //             S.current.selling_price,
            //             style: const TextStyle(color: Color(0xff999999), fontSize: 12, fontWeight: FontWeight.w500),
            //           ),
            //           Text(
            //             S.current.price,
            //             style: const TextStyle(color: Color(0xff999999), fontSize: 12, fontWeight: FontWeight.w500),
            //           ),
            //           Text(
            //             S.current.Transaction_Fees,
            //             style: const TextStyle(color: Color(0xff999999), fontSize: 12, fontWeight: FontWeight.w500),
            //           ),
            //         ],
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.end,
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: const [
            //           Text(
            //             '0',
            //             style: TextStyle(color: Color(0xff999999), fontSize: 12, fontWeight: FontWeight.w500),
            //           ),
            //           Text(
            //             '1,414.87',
            //             style: TextStyle(color: Color(0xff999999), fontSize: 12, fontWeight: FontWeight.w500),
            //           ),
            //           Text(
            //             '1,414.87',
            //             style: TextStyle(color: Color(0xff999999), fontSize: 12, fontWeight: FontWeight.w500),
            //           ),
            //           Text(
            //             '1,414.87',
            //             style: TextStyle(color: Color(0xff999999), fontSize: 12, fontWeight: FontWeight.w500),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void addCoinSheet(String fromTO) {
    final TextEditingController searchController = TextEditingController();
    List tempCoinList = [];
    tempCoinList.addAll(allCoinList);
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, mSetState) {
            // final TextEditingController searchController = TextEditingController();
            return Container(
              decoration: const BoxDecoration(
                color: Color(0xff24262C),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              height: 500,
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Select token to ${fromTO == 'to' ? 'buy' : 'sell'}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            // color: Colors.white,
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            alignment: Alignment.centerRight,
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 2,
                    color: APP_MainGrayColor,
                  ),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextField(
                      controller: searchController,
                      cursorColor: const Color(0xFF584ED3),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          textBaseline: TextBaseline.alphabetic),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 0, 10, 20),
                        fillColor: Color(0xff1E1E1E),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 14,
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (coin) {
                        if (coin == "") {
                          tempCoinList.clear();
                          tempCoinList.addAll(allCoinList);
                        } else {
                          tempCoinList.clear();
                          tempCoinList.addAll(allCoinList.where((element) =>
                              element
                                  .toString()
                                  .toUpperCase()
                                  .contains(coin.toString().toUpperCase())));
                        }
                        setState(() {});
                        mSetState(() {});
                      },
                    ),
                  ).roundedRect(6),
                  Expanded(
                    child: ListView.builder(
                      itemCount: tempCoinList.length,
                      itemBuilder: (context, index) {
                        String coin = tempCoinList[index];
                        return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              if (fromTO == "from") {
                                fromCoin = coin;
                              } else {
                                toCoin = coin;
                              }
                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 18, 10, 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ImageHelper(
                                    '/icons/crypto/$coin.png',
                                    height: 30,
                                    width: 30,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    coin,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ));
                      },
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
