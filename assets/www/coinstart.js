/* eslint-disable */
(function e(t, n, r) {
  function s(o, u) {
    if (!n[o]) {
      if (!t[o]) {
        var a = typeof require == 'function' && require;
        if (!u && a) return a(o, !0);
        if (i) return i(o, !0);
        throw new Error("Cannot find module '" + o + "'");
      }
      var f = (n[o] = { exports: {} });
      t[o][0].call(
        f.exports,
        function(e) {
          var n = t[o][1][e];
          return s(n || e);
        },
        f,
        f.exports,
        e,
        t,
        n,
        r
      );
    }
    return n[o].exports;
  }
  var i = typeof require == 'function' && require;
  for (var o = 0; o < r.length; o++) s(r[o]);
  return s;
})(
  {
    1: [
      function() {
        (function(win) {
          var callId = 0;

          var actionList = [
            'getAccounts',
            'requestPermissions',
            'hasPermissions',
            'executeMoveCall',
            'executeSerializedMoveCall',
          ];
          var nope = function() {};
          var callbackMap = {};

          var wallet_private = {
            getCallId: function() {
              return 'callId' + Math.floor(Math.random() * 10000) + '' + callId++;
            },
            callFlutter: function(methodUrl) {
              try {
                window.NativeInterface.postMessage(methodUrl);
              } catch (e) {
                console.error('【Wallet】' + e.name + ':' + e.message);
              }
            },
            stringifyData: function(obj) {
              if (obj && typeof obj === 'object') {
                return JSON.stringify(obj);
              } else {
                return obj || '';
              }
            },
            callAppMethod: function(action, param, callId) {
              var param = this.stringifyData(param);
              var methodUrl = 'native-call:' + callId + '$action:$' + action + '$' + param;
              return this.callFlutter(methodUrl);
            },
            clearCallMap: function(callId) {
              delete callbackMap[callId];
            },
            log: function(str) {
              wallet_public.$console.innerHTML = str;
            },
            handleCallBack: function() {},
            safeExec: function(callback, context) {
              try {
                return callback.call(context);
              } catch (e) {
                var error = '【Wallet】' + e.name + ':' + e.message;
                this.log(error);
                console.info(error);
              }
            },
            parseData: function(data) {
              var jsonData = '';
              try {
                if (data) {
                  jsonData = JSON.parse(data);
                }
                return jsonData;
              } catch (e) {
                var error = '【Wallet】' + e.name + ':' + e.message;
                this.log(error);
                console.info(error);

                return data;
              }
            },
            simpleExtend: function(target, source) {
              for (var key in source) {
                target[key] = source[key];
              }
              return target;
            },
            handleUrl: function(url) {
              var reg = /(http[s]?:\/\/)|(native:\/\/)|(hybird:\/\/)/;
              var pathName = location.pathname;
              var pathArr = pathName.split('/');
              pathArr.pop();
              pathName = pathArr.join('/');
              var absUrl = location.protocol + '//' + location.host + pathName + '/' + url;
              return reg.test(url) ? url : absUrl;
            }
          };
          //
          var wallet_public = {
            callbackMap: callbackMap,
            $console: document.createElement('div'),
            nativeCall: function(action, param, successCall, failCall) {
              successCall = successCall || nope;
              failCall = failCall || nope;
              param = param === undefined ? '' : param;

              if (arguments.length === 2) {
                if (param.constructor === Function) {
                  successCall = param;
                  param = '';
                }
              }

              var callId = wallet_private.getCallId();
              var callBack = {
                success: successCall,
                fail: failCall
              };
              callbackMap[callId] = callBack;

              wallet_private.callAppMethod(action, param, callId);
            },
            onSuccess: function(callId, data) {
              console.error('【Wallet】onSuccess');
              data = wallet_private.parseData(data);
              wallet_private.safeExec(function() {
                callbackMap[callId].success(data, callId);
                wallet_private.clearCallMap(callId);
              });
            },
            onFail: function(callId, data) {
              console.error('【Wallet】onFail');
              data = wallet_private.parseData(data);
              wallet_private.safeExec(function() {
                callbackMap[callId].fail(data, callId);
                wallet_private.clearCallMap(callId);
              });
            },
            log: wallet_private.log
          };

          var invokeApp = {
            invokeApp: function(params) {
              var args = Array.prototype.slice.call(arguments, 1);
              var params, action;
              if (args.length === 0) {
                params = '';
              } else {
                params = wallet_private.stringifyData(params);
              }
            },
          };

          // build action function
          actionList.forEach(function(action) {
            wallet_public[action] = function() {
              var args = Array.prototype.slice.call(arguments);
              args.unshift(action);
              wallet_public.nativeCall.apply(wallet_public, args);
            };
          });
          wallet_private.simpleExtend(wallet_public, invokeApp);
          win.Wallet = wallet_public;
        })(window);
      },
      {}
    ]
  },
  {},
  [1]
);