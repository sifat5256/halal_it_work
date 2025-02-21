import 'package:flutter/material.dart';

class GoldBdtScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("GOLD/BDT"),
        actions: [Icon(Icons.more_horiz)],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildBuySellToggle(),
            SizedBox(height: 10),
            _buildLimitInput(),
            SizedBox(height: 10),
            _buildAmountInput(),
            SizedBox(height: 10),
            _buildPriceGoldList(),
            SizedBox(height: 10),
            _buildBuyButton(),
            SizedBox(height: 10),
            _buildTabs(),
            Spacer(),
            _buildAvailableFunds(),
          ],
        ),
      ),
    );
  }

  Widget _buildBuySellToggle() {
    return Row(
      children: [
        _toggleButton("Buy", Colors.yellow),
        _toggleButton("Sell", Colors.grey),
      ],
    );
  }

  Widget _toggleButton(String text, Color color) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color),
        onPressed: () {},
        child: Text(text, style: TextStyle(color: Colors.black)),
      ),
    );
  }

  Widget _buildLimitInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Limit"),
        Row(
          children: [
            IconButton(icon: Icon(Icons.remove), onPressed: () {}),
            Text("6786"),
            IconButton(icon: Icon(Icons.add), onPressed: () {}),
          ],
        ),
      ],
    );
  }

  Widget _buildAmountInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Amount(BDT)"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _percentageButton("25%"),
            _percentageButton("50%"),
            _percentageButton("75%"),
            _percentageButton("100%"),
          ],
        ),
      ],
    );
  }

  Widget _percentageButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300),
      onPressed: () {},
      child: Text(text, style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildPriceGoldList() {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("6786.56"),
            trailing: Text("1 gm", style: TextStyle(color: Colors.green)),
          );
        },
      ),
    );
  }

  Widget _buildBuyButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
      onPressed: () {},
      child: Text("Buy Gold", style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _tabItem("Open Orders(0)"),
        _tabItem("Funds"),
        _tabItem("Spot Grid"),
      ],
    );
  }

  Widget _tabItem(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildAvailableFunds() {
    return Column(
      children: [
        Text("Available Funds: 0.00 Gold"),
        Text("Transfer funds to your Spot wallet to trade"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.circle, size: 20, color: Colors.grey),
            SizedBox(width: 10),
            Icon(Icons.circle, size: 20, color: Colors.grey),
          ],
        ),
      ],
    );
  }
}
