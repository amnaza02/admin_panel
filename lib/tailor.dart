import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TailorScreen extends StatefulWidget {
  @override
  _TailorScreenState createState() => _TailorScreenState();
}

class _TailorScreenState extends State<TailorScreen> {
  List<Map<String, dynamic>> tailors = [
    {"name": "Ahmed", "email": "ahmed@gmail.com", "location": "Algiers, Algeria", "orders": 10, "subscription": "1 Month", "approved": false},
    {"name": "Youssef", "email": "youssef@gmail.com", "location": "Oran, Algeria", "orders": 15, "subscription": "2 Months", "approved": false},
    {"name": "Sara", "email": "sara@gmail.com", "location": "Constantine, Algeria", "orders": 7, "subscription": "Not Subscribed", "approved": false},
  ];

  void toggleApproval(int index) {
    setState(() {
      tailors[index]['approved'] = !tailors[index]['approved'];
    });
  }

  void deleteTailor(int index) {
    setState(() {
      tailors.removeAt(index);
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
                      hintText: "Search tailors...",
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
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 163, 119, 178)),
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
                  Expanded(child: Text("Subscription", style: GoogleFonts.poppins(fontWeight: FontWeight.bold))),
                  Expanded(child: Text("Actions", style: GoogleFonts.poppins(fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tailors.length,
                itemBuilder: (context, index) {
                  var tailor = tailors[index];
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(tailor['name'], style: GoogleFonts.poppins())),
                        Expanded(child: Text(tailor['email'], style: GoogleFonts.poppins())),
                        Expanded(child: Text(tailor['location'], style: GoogleFonts.poppins())),
                        Expanded(child: Text(tailor['orders'].toString(), style: GoogleFonts.poppins())),
                        Expanded(child: Text(tailor['subscription'], style: GoogleFonts.poppins())),
                        Expanded(
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.check_circle,
                                  color: tailor['approved'] ? Colors.green : Colors.grey,
                                ),
                                onPressed: () => toggleApproval(index),
                              ),
                              SizedBox(width: 5),
                              IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                ),
                                onPressed: () => deleteTailor(index),
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