import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerScreen extends StatefulWidget {
  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  List<Map<String, dynamic>> customers = [
    {"name": "Ali", "email": "ali@gmail.com", "location": "Algiers, Algeria", "orders": 5, "spent": "1200DA", "approved": false},
    {"name": "Hassan", "email": "hassan@gmail.com", "location": "Oran, Algeria", "orders": 12, "spent": "3400DA", "approved": false},
    {"name": "Meriem", "email": "meriem@gmail.com", "location": "Constantine, Algeria", "orders": 8, "spent": "2100DA", "approved": false},
  ];

  void toggleApproval(int index) {
    setState(() {
      customers[index]['approved'] = !customers[index]['approved'];
    });
  }

  void deleteCustomer(int index) {
    setState(() {
      customers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search customers...",
                      hintStyle: GoogleFonts.poppins(),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.filter_list),
                  label: Text(
                    "Filter",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 163, 119, 178)),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text("Name", style: GoogleFonts.poppins(fontWeight: FontWeight.bold))),
                  Expanded(child: Text("Email", style: GoogleFonts.poppins(fontWeight: FontWeight.bold))),
                  Expanded(child: Text("Location", style: GoogleFonts.poppins(fontWeight: FontWeight.bold))),
                  Expanded(child: Text("Orders", style: GoogleFonts.poppins(fontWeight: FontWeight.bold))),
                  Expanded(child: Text("Spent", style: GoogleFonts.poppins(fontWeight: FontWeight.bold))),
                  Expanded(child: Text("Actions", style: GoogleFonts.poppins(fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: customers.length,
                itemBuilder: (context, index) {
                  var customer = customers[index];
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(customer['name'], style: GoogleFonts.poppins())),
                        Expanded(child: Text(customer['email'], style: GoogleFonts.poppins())),
                        Expanded(child: Text(customer['location'], style: GoogleFonts.poppins())),
                        Expanded(child: Text(customer['orders'].toString(), style: GoogleFonts.poppins())),
                        Expanded(child: Text(customer['spent'], style: GoogleFonts.poppins())),
                        Expanded(
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.check_circle,
                                  color: customer['approved'] ? Colors.green : Colors.grey,
                                ),
                                onPressed: () => toggleApproval(index),
                              ),
                              SizedBox(width: 5),
                              IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                ),
                                onPressed: () => deleteCustomer(index),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
