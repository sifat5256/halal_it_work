import 'package:flutter/material.dart';

class GoldBuySellScreen extends StatefulWidget {
  const GoldBuySellScreen({super.key});

  @override
  State<GoldBuySellScreen> createState() => _GoldBuySellScreenState();
}

class _GoldBuySellScreenState extends State<GoldBuySellScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        title: Row(
          children: [
            SizedBox(
              width: 40,
            ),
            Image.asset("asset/currncey_chnge/currency_change.png"),
            SizedBox(
              width: 5,
            ),
            Text("GOLD/BDT",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),),
          ],
        ),
        actions: [
          Icon(Icons.circle,size: 30,color: Colors.grey.shade500,),
          Icon(Icons.circle,size: 30,color: Colors.grey.shade500,),
          Icon(Icons.circle,size: 30,color: Colors.grey.shade500,),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03, // 3% of screen width
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02), // 2% of screen height
              _buildHeader(screenWidth),
              SizedBox(height: screenHeight * 0.02),
              _buildContent(screenWidth),
              SizedBox(height: screenHeight * 0.03),
              _buildTabs(),
              const Divider(thickness: 3),
              SizedBox(height: screenHeight * 0.02),
              _buildAvailableFunds(),
            ],
          ),
        ),
      ),
    );
  }




  // Build the header section with Buy/Sell toggle button and labels
  Widget _buildHeader(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildToggleButton(screenWidth),
        _buildLabelColumn("Price", "(BDT)"),
        _buildLabelColumn("Amount", "(Gold)"),
      ],
    );
  }

  // Build a toggle button for Buy/Sell
  Widget _buildToggleButton(double screenWidth) {
    return Container(
      width: screenWidth * 0.45, // 45% of screen width
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: const Color(0xFFFFCF23),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color(0xFFFFCF23),
              ),
              child: const Center(
                child: Text(
                  "Buy",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
              child: const Center(
                child: Text(
                  "Sell",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build a column with a title and subtitle
  Widget _buildLabelColumn(String title, String subtitle) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF66635B),
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  // Build the main content section
  Widget _buildContent(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLeftColumn(screenWidth),
        _buildPriceColumn(),
        _buildAmountColumn(),
      ],
    );
  }

  // Build the left column with input fields and buttons
  Widget _buildLeftColumn(double screenWidth) {
    return Column(
      children: [
        _buildInputField("Limit", screenWidth),
        const SizedBox(height: 10),
        _buildEditableField("6786", screenWidth),
        const SizedBox(height: 10),
        _buildEditableField("Amount(BDT)", screenWidth, isPlaceholder: true),
        const SizedBox(height: 10),
        _buildPercentageBars(screenWidth),
        const SizedBox(height: 30),
        _buildInputField("Total(GOLD)", screenWidth),
        const SizedBox(height: 10),
        _buildFeeDetails(screenWidth),
        const SizedBox(height: 17),
        _buildActionButton("Buy Gold", screenWidth, color: const Color(0xFFFFCF23)),
      ],
    );
  }

  // Build an input field with a label
  Widget _buildInputField(String label, double screenWidth) {
    return Container(
      width: screenWidth * 0.45, // 45% of screen width
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  // Build an editable field with increment/decrement icons
  Widget _buildEditableField(String value, double screenWidth, {bool isPlaceholder = false}) {
    return Container(
      width: screenWidth * 0.45, // 45% of screen width
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.remove),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: isPlaceholder ? Colors.grey.shade500 : Colors.black,
            ),
          ),
          const Icon(Icons.add),
        ],
      ),
    );
  }

  // Build percentage bars
  Widget _buildPercentageBars(double screenWidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        4,
            (index) => Column(
          children: [
            Container(
              width: screenWidth * 0.1, // 10% of screen width
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.white,
              ),
            ),
            Text(
              "35%",
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build fee details section
  Widget _buildFeeDetails(double screenWidth) {
    return SizedBox(
      width: screenWidth * 0.45, // 45% of screen width
      child: Column(
        children: [
          _buildFeeRow("VAT/TAX", "00.00 BDT"),
          const SizedBox(height: 17),
          _buildFeeRow("Est.Fees", "00.00 BDT"),
        ],
      ),
    );
  }

  // Build a row for fee details
  Widget _buildFeeRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF66635B),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  // Build an action button
  Widget _buildActionButton(String label, double screenWidth, {required Color color}) {
    return Container(
      width: screenWidth * 0.45, // 45% of screen width
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: color,
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Build the price column
  Widget _buildPriceColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        20,
            (index) => const Text("6786.56"),
      ),
    );
  }

  // Build the amount column
  Widget _buildAmountColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        20,
            (index) => const Text("1 gm  "),
      ),
    );
  }

  // Build the tabs section
  Widget _buildTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTabItem("Open Orders(0)"),
        _buildTabItem("Funds"),
        _buildTabItem("Spot Grid"),
        const Icon(Icons.file_open_rounded),
      ],
    );
  }

  // Build a single tab item
  Widget _buildTabItem(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Build the available funds section
  Widget _buildAvailableFunds() {
    return Column(
      children: [
        const Text(
          "Available Funds: 0.00 Gold",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "Transfer funds to your Spot wallet to trade",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.circle, size: 40, color: Colors.grey),
            const SizedBox(width: 10),
            const Icon(Icons.circle, size: 40, color: Colors.grey),
          ],
        ),
      ],
    );
  }
}