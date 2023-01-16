///author: lty
////Time: 2023/01/16
////Description:
class JsCallBack {
  late String returnCode;
  late String returnMsg;
  dynamic data;

  static JsCallBack fromMap(Map<String, dynamic> map) {
    JsCallBack jsCallBackBean = JsCallBack();
    jsCallBackBean.returnCode = map['returnCode'];
    jsCallBackBean.returnMsg = map['returnMsg'];
    jsCallBackBean.data = map['data'];
    return jsCallBackBean;
  }

  Map toJson() => {
        "returnCode": returnCode,
        "returnMsg": returnMsg,
        "data": data,
      };
}
