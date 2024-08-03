import 'package:flutter/material.dart';
import 'package:velopay/views/Homes/homepage.dart';
import 'package:velopay/views/Homes/mywallet.dart';
import 'package:velopay/views/services/accountpage.dart';
import 'package:velopay/views/services/cardpage.dart';
import 'package:velopay/views/services/myplan.dart';

class SelectOperator extends StatefulWidget {
  const SelectOperator({super.key});

  @override
  State<SelectOperator> createState() => _SelectOperatorState();
}

class _SelectOperatorState extends State<SelectOperator> {
  int _selectedIndex = 0;
  String? _selectedNetwork = 'MTN';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                  ],
                ),
              ),
            ),
          ),
        ],
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
            const SizedBox(width: 48.0),
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
}
