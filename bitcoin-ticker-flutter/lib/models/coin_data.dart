import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

const List<String> kCurrenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> kCryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  double ask;
  double bid;
  double last;
  double high;
  double low;
  double volume;
  Open open;
  Averages averages;
  Changes changes;
  double volumePercent;
  int timestamp;
  DateTime displayTimestamp;
  String displaySymbol;

  CoinData({
    this.ask,
    this.bid,
    this.last,
    this.high,
    this.low,
    this.volume,
    this.open,
    this.averages,
    this.changes,
    this.volumePercent,
    this.timestamp,
    this.displayTimestamp,
    this.displaySymbol,
  });

  CoinData copyWith({
    double ask,
    double bid,
    double last,
    double high,
    double low,
    double volume,
    Open open,
    Averages averages,
    Changes changes,
    double volumePercent,
    int timestamp,
    DateTime displayTimestamp,
    String displaySymbol,
  }) =>
      CoinData(
        ask: ask ?? this.ask,
        bid: bid ?? this.bid,
        last: last ?? this.last,
        high: high ?? this.high,
        low: low ?? this.low,
        volume: volume ?? this.volume,
        open: open ?? this.open,
        averages: averages ?? this.averages,
        changes: changes ?? this.changes,
        volumePercent: volumePercent ?? this.volumePercent,
        timestamp: timestamp ?? this.timestamp,
        displayTimestamp: displayTimestamp ?? this.displayTimestamp,
        displaySymbol: displaySymbol ?? this.displaySymbol,
      );

  factory CoinData.fromRawJson(String str) =>
      CoinData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CoinData.fromJson(Map<String, dynamic> json) => CoinData(
        ask: json["ask"] == null ? null : json["ask"].toDouble(),
        bid: json["bid"] == null ? null : json["bid"].toDouble(),
        last: json["last"] == null ? null : json["last"].toDouble(),
        high: json["high"] == null ? null : json["high"].toDouble(),
        low: json["low"] == null ? null : json["low"].toDouble(),
        volume: json["volume"] == null ? null : json["volume"].toDouble(),
        open: json["open"] == null ? null : Open.fromJson(json["open"]),
        averages: json["averages"] == null
            ? null
            : Averages.fromJson(json["averages"]),
        changes:
            json["changes"] == null ? null : Changes.fromJson(json["changes"]),
        volumePercent: json["volume_percent"] == null
            ? null
            : json["volume_percent"].toDouble(),
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        displayTimestamp: json["display_timestamp"] == null
            ? null
            : DateTime.parse(json["display_timestamp"]),
        displaySymbol:
            json["display_symbol"] == null ? null : json["display_symbol"],
      );

  Map<String, dynamic> toJson() => {
        "ask": ask == null ? null : ask,
        "bid": bid == null ? null : bid,
        "last": last == null ? null : last,
        "high": high == null ? null : high,
        "low": low == null ? null : low,
        "volume": volume == null ? null : volume,
        "open": open == null ? null : open.toJson(),
        "averages": averages == null ? null : averages.toJson(),
        "changes": changes == null ? null : changes.toJson(),
        "volume_percent": volumePercent == null ? null : volumePercent,
        "timestamp": timestamp == null ? null : timestamp,
        "display_timestamp": displayTimestamp == null
            ? null
            : displayTimestamp.toIso8601String(),
        "display_symbol": displaySymbol == null ? null : displaySymbol,
      };

  static Future<CoinData> getByCryptoCurrencyPair(
      {@required String crypto, @required String currency}) async {
    http.Response response = await http.get(
        'https://apiv2.bitcoinaverage.com/indices/global/ticker/$crypto$currency');
    if (response.statusCode == 200) {
      return CoinData.fromRawJson(response.body);
    }
    return null;
  }
}

class Averages {
  double day;
  double week;
  double month;

  Averages({
    this.day,
    this.week,
    this.month,
  });

  Averages copyWith({
    double day,
    double week,
    double month,
  }) =>
      Averages(
        day: day ?? this.day,
        week: week ?? this.week,
        month: month ?? this.month,
      );

  factory Averages.fromRawJson(String str) =>
      Averages.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Averages.fromJson(Map<String, dynamic> json) => Averages(
        day: json["day"] == null ? null : json["day"].toDouble(),
        week: json["week"] == null ? null : json["week"].toDouble(),
        month: json["month"] == null ? null : json["month"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "week": week == null ? null : week,
        "month": month == null ? null : month,
      };
}

class Changes {
  Open price;
  Open percent;

  Changes({
    this.price,
    this.percent,
  });

  Changes copyWith({
    Open price,
    Open percent,
  }) =>
      Changes(
        price: price ?? this.price,
        percent: percent ?? this.percent,
      );

  factory Changes.fromRawJson(String str) => Changes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Changes.fromJson(Map<String, dynamic> json) => Changes(
        price: json["price"] == null ? null : Open.fromJson(json["price"]),
        percent:
            json["percent"] == null ? null : Open.fromJson(json["percent"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price == null ? null : price.toJson(),
        "percent": percent == null ? null : percent.toJson(),
      };
}

class Open {
  double hour;
  double day;
  double week;
  double month;
  double month3;
  double month6;
  double year;

  Open({
    this.hour,
    this.day,
    this.week,
    this.month,
    this.month3,
    this.month6,
    this.year,
  });

  Open copyWith({
    double hour,
    double day,
    double week,
    double month,
    double month3,
    double month6,
    double year,
  }) =>
      Open(
        hour: hour ?? this.hour,
        day: day ?? this.day,
        week: week ?? this.week,
        month: month ?? this.month,
        month3: month3 ?? this.month3,
        month6: month6 ?? this.month6,
        year: year ?? this.year,
      );

  factory Open.fromRawJson(String str) => Open.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Open.fromJson(Map<String, dynamic> json) => Open(
        // hour: json["hour"] == null ? null : json["hour"].toDouble(),
        day: json["day"] == null ? null : json["day"].toDouble(),
        week: json["week"] == null ? null : json["week"].toDouble(),
        month: json["month"] == null ? null : json["month"].toDouble(),
        month3: json["month_3"] == null ? null : json["month_3"].toDouble(),
        month6: json["month_6"] == null ? null : json["month_6"].toDouble(),
        year: json["year"] == null ? null : json["year"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "hour": hour == null ? null : hour,
        "day": day == null ? null : day,
        "week": week == null ? null : week,
        "month": month == null ? null : month,
        "month_3": month3 == null ? null : month3,
        "month_6": month6 == null ? null : month6,
        "year": year == null ? null : year,
      };
}
