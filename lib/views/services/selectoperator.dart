import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for input formatters
import 'package:velopay/views/Homes/homepage.dart';
import 'package:velopay/views/Homes/mywallet.dart';
import 'package:velopay/views/services/accountpage.dart';
import 'package:velopay/views/services/cardpage.dart';
import 'package:velopay/views/services/myplan.dart';
import 'package:velopay/views/services/reviewpayment.dart';

class SelectOperator extends StatefulWidget {
  const SelectOperator({super.key});

  @override
  State<SelectOperator> createState() => _SelectOperatorState();
}

class _SelectOperatorState extends State<SelectOperator> {
  int _selectedIndex = 0;
  String? _selectedNetwork = 'MTN';
  String? _selectedPaymentMethod = 'Payment Method 1';
  String? _selectedSourceAccount = 'Source Account 1';
  final TextEditingController _phoneController = TextEditingController();
  bool _saveTopup = false;
  bool _scheduleTopup = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyPlan()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CardPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AccountPage()),
        );
        break;
    }
  }

  void _showNetworkSelectionModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
          child: Container(
            color: Colors.orange,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildNetworkOption('Airtel', 'images/airtel.jpg'),
                _buildNetworkOption('9Mobile', 'images/9mobile.jpg'),
                _buildNetworkOption('Glo', 'images/glo.png'),
                _buildNetworkOption('MTN', 'images/mtn.png'),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPaymentMethodSelectionModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
          child: Container(
            color: Colors.orange,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildPaymentMethodOption('Payment Method 1'),
                _buildPaymentMethodOption('Payment Method 2'),
                _buildPaymentMethodOption('Payment Method 3'),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showSourceAccountSelectionModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
          child: Container(
            color: Colors.orange,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildSourceAccountOption('Source Account 1'),
                _buildSourceAccountOption('Source Account 2'),
                _buildSourceAccountOption('Source Account 3'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNetworkOption(String network, String assetPath) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(assetPath),
      ),
      title: Text(network),
      trailing: Radio<String>(
        value: network,
        groupValue: _selectedNetwork,
        onChanged: (String? value) {
          setState(() {
            _selectedNetwork = value;
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildPaymentMethodOption(String method) {
    return ListTile(
      title: Text(method),
      trailing: Radio<String>(
        value: method,
        groupValue: _selectedPaymentMethod,
        onChanged: (String? value) {
          setState(() {
            _selectedPaymentMethod = value;
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildSourceAccountOption(String account) {
    return ListTile(
      title: Text(account),
      trailing: Radio<String>(
        value: account,
        groupValue: _selectedSourceAccount,
        onChanged: (String? value) {
          setState(() {
            _selectedSourceAccount = value;
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Prevents resizing when the keyboard appears
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                  bottom: 80), // Adjust this padding if necessary
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 10),
                            Expanded(
                              child: Center(
                                child: RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Select Operator ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildPhoneNumberInput(),
                      const SizedBox(height: 20),
                      _buildAmountInput(),
                      const SizedBox(height: 20),
                      _buildPaymentMethodInput(),
                      const SizedBox(height: 20),
                      _buildSourceAccountInput(),
                      const SizedBox(height: 20),
                      _buildSaveTopupSwitch(),
                      _buildScheduleTopupSwitch(),
                      const SizedBox(height: 20),
                      _buildBuyAirtimeButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10.0,
        color: const Color.fromARGB(255, 244, 239, 239),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _buildNavItem(Icons.home, 2),
            _buildNavItem(Icons.miscellaneous_services, 0),
            const SizedBox(width: 48.0), // Space for the FloatingActionButton
            _buildNavItem(Icons.payment, 1),
            _buildNavItem(Icons.person, 3),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyWallet()),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: _selectedIndex == index ? Colors.orange : Colors.black,
      ),
      onPressed: () => _onItemTapped(index),
    );
  }

  Widget _buildPhoneNumberInput() {
    return GestureDetector(
      onTap: _showNetworkSelectionModal,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 2.0),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                _selectedNetwork == 'MTN'
                    ? 'images/mtn.png'
                    : _selectedNetwork == 'Airtel'
                        ? 'images/airtel.jpg'
                        : _selectedNetwork == '9Mobile'
                            ? 'images/9mobile.jpg'
                            : _selectedNetwork == 'Glo'
                                ? 'images/glo.png'
                                : 'images/default.png',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11)
                ], // Limit to 11 digits
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '070 3793 3533',
                  hintStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            const Icon(Icons.person, color: Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountInput() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 2.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Enter Amount',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: 'Enter Amount',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildPaymentMethodInput() {
    return GestureDetector(
      onTap: _showPaymentMethodSelectionModal,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 2.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _selectedPaymentMethod!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget _buildSourceAccountInput() {
    return GestureDetector(
      onTap: _showSourceAccountSelectionModal,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 2.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                _selectedSourceAccount!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveTopupSwitch() {
    return SwitchListTile(
      title: const Text(
        'Save this topup',
        style: TextStyle(color: Colors.black),
      ),
      value: _saveTopup,
      onChanged: (bool value) {
        setState(() {
          _saveTopup = value;
        });
      },
      activeColor: Colors.orange,
    );
  }

  Widget _buildScheduleTopupSwitch() {
    return SwitchListTile(
      title: const Text(
        'Schedule this airtime topup',
        style: TextStyle(color: Colors.black),
      ),
      value: _scheduleTopup,
      onChanged: (bool value) {
        setState(() {
          _scheduleTopup = value;
        });
      },
      activeColor: Colors.orange,
    );
  }

  Widget _buildBuyAirtimeButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ReviewPayment()),
          );
        },
        child: const Text(
          'Buy Airtime',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
