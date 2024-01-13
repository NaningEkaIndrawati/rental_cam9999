import 'package:flutter/material.dart';
import 'reservasi.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Reservasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PersonalForm(),
    );
  }
}

class PersonalForm extends StatefulWidget {
  const PersonalForm({Key? key}) : super(key: key);

  @override
  _PersonalFormState createState() => _PersonalFormState();
}

class _PersonalFormState extends State<PersonalForm> {
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _productNameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime? _pickupDate;
  DateTime? _returnDate;
  bool _verifyValue = false;
  String _selectedPricePerHour = '6 Jam : 150K';
  List<String> _pricePerHourOptions = [
    '6 Jam : 150K',
    '12 Jam : 180K',
    '24 Jam : 200K',
  ];

  Duration _getDurationFromPricePerHour(String pricePerHour) {
    switch (pricePerHour) {
      case '6 Jam : 150K':
        return Duration(hours: 6);
      case '12 Jam : 180K':
        return Duration(hours: 12);
      case '24 Jam : 200K':
        return Duration(hours: 24);
      default:
        return Duration(hours: 6);
    }
  }

  void _showSubmittedData() {
    final fullName = _fullNameController.text;
    final phoneNumber = _phoneNumberController.text;
    final productName = _productNameController.text;
    final quantity = _quantityController.text;
    final date = _dateController.text;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Submitted Data'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Full Name: $fullName'),
              Text('Phone Number: $phoneNumber'),
              Text('Product Name: $productName'),
              Text('Price per Hour: $_selectedPricePerHour'),
              Text('Quantity: $quantity'),
              Text('Date: $date'),
              Text('Verify: ${_verifyValue ? 'Verified' : 'Not Verified'}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Second(
                      Fullname: fullName,
                      phoneNumber: phoneNumber,
                      productName: productName, // Pass productName here
                      pricePerHour:
                          _selectedPricePerHour, // Pass pricePerHour here
                      quantity: quantity, // Pass quantity here
                      date: date, // Pass date here
                      verified: _verifyValue, // Pass verified here
                    ),
                  ),
                );
              },
              child: Text('View Details'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
          ),
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a value';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildDateTextField(String labelText, DateTime? selectedDate,
      Function(DateTime?) onChanged, String pricePerHour) {
    return ListTile(
      title: Text(selectedDate == null
          ? 'Select $labelText'
          : '$labelText: ${selectedDate.toLocal()}'),
      trailing: Icon(Icons.calendar_today),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (pickedTime != null) {
            DateTime selectedDateTime = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );
            Duration durationFromPricePerHour =
                _getDurationFromPricePerHour(pricePerHour);
            DateTime returnDateTime =
                selectedDateTime.add(durationFromPricePerHour);
            onChanged(returnDateTime);

            // Update _dateController value when a date is picked
            _dateController.text = selectedDateTime.toLocal().toString();
          }
        }
      },
    );
  }

  Widget _buildLabelLeftAligned(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildPricePerHourDropdown() {
    return ListTile(
      title: Text('$_selectedPricePerHour', style: TextStyle(fontSize: 16)),
      trailing: DropdownButton<String>(
        value: _selectedPricePerHour,
        onChanged: (String? value) {
          setState(() {
            _selectedPricePerHour = value!;
            if (_pickupDate != null) {
              _returnDate =
                  _pickupDate!.add(_getDurationFromPricePerHour(value));
            }
          });
        },
        items:
            _pricePerHourOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form penyewaan',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff080808),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildLabelLeftAligned("Nama Lengkap"),
            _buildTextField("Enter Full Name", _fullNameController),
            _buildLabelLeftAligned("Enter Phone Number"),
            _buildTextField("Enter Phone Number", _phoneNumberController),
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Verify'),
                    value: _verifyValue,
                    onChanged: (value) {
                      setState(() {
                        _verifyValue = value ?? false;
                      });
                    },
                  ),
                ),
              ],
            ),
            _buildLabelLeftAligned("Nama Barang"),
            _buildTextField("Enter Product Name", _productNameController),
            _buildLabelLeftAligned("Price per Hour"),
            _buildPricePerHourDropdown(),
            _buildLabelLeftAligned("Jumlah Barang"),
            _buildTextField("Enter Quantity", _quantityController),
            _buildLabelLeftAligned("Tanggal Pengambilan"),
            _buildDateTextField("Tanggal Pengambilan", _pickupDate,
                (pickedDate) {
              setState(() {
                _pickupDate = pickedDate;
                if (_pickupDate != null) {
                  _returnDate = _pickupDate!
                      .add(_getDurationFromPricePerHour(_selectedPricePerHour));
                }
              });
            }, _selectedPricePerHour),
            _buildLabelLeftAligned("Tanggal Pengembalian"),
            _buildDateTextField("Tanggal Pengembalian", _returnDate,
                (pickedDate) {
              setState(() {
                _returnDate = pickedDate;
              });
            }, _selectedPricePerHour),
            ElevatedButton.icon(
              onPressed: () {
                _showSubmittedData();
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff430f0c),
              ),
              icon: Icon(Icons.shopping_cart),
              label: Text('Sewa'),
            ),
          ],
        ),
      ),
    );
  }
}
