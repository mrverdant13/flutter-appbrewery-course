import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bitcoin_ticker/models/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String _selectedCurrency;

  @override
  void initState() {
    super.initState();
    _selectedCurrency = kCurrenciesList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              for (String crypto in kCryptoList)
                CryptoCurrencyCard(
                  crypto: crypto,
                  currency: _selectedCurrency,
                ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: _getCurrencySelectionWidget(),
          ),
        ],
      ),
    );
  }

  Widget _getCurrencySelectionWidget() {
    if (Platform.isAndroid)
      return DropdownButton<String>(
        value: _selectedCurrency,
        items: [
          for (String currency in kCurrenciesList)
            DropdownMenuItem(
              child: Text(currency),
              value: currency,
            ),
        ],
        onChanged: (value) {
          setState(() {
            _selectedCurrency = value;
          });
        },
      );
    else if (Platform.isIOS)
      return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32.0,
        children: <Widget>[
          for (String currency in kCurrenciesList) Text(currency)
        ],
        onSelectedItemChanged: (valueIndex) {
          setState(() {
            _selectedCurrency = kCurrenciesList[valueIndex];
          });
        },
      );
    return null;
  }
}

class CryptoCurrencyCard extends StatefulWidget {
  const CryptoCurrencyCard({
    @required this.crypto,
    @required this.currency,
  });

  final String crypto;
  final String currency;

  @override
  _CryptoCurrencyCardState createState() => _CryptoCurrencyCardState();
}

class _CryptoCurrencyCardState extends State<CryptoCurrencyCard> {
  String _lastCurrency;
  String cryptoValueInCurrencyUnits;

  @override
  void initState() {
    super.initState();
    _lastCurrency = '';
    _getCryptoValueInCurrencyUnits();
  }

  @override
  Widget build(BuildContext context) {
    if (_lastCurrency != widget.currency) {
      _getCryptoValueInCurrencyUnits();
      _lastCurrency = widget.currency;
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 ${widget.crypto} = $cryptoValueInCurrencyUnits ${widget.currency}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _getCryptoValueInCurrencyUnits() {
    cryptoValueInCurrencyUnits = '?';
    CoinData.getByCryptoCurrencyPair(
      crypto: widget.crypto,
      currency: widget.currency,
    ).then((coinData) {
      setState(() {
        cryptoValueInCurrencyUnits = coinData.last.toString();
      });
    });
  }
}
