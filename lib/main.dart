import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'package:test_admin/admin_notifications_screen.dart';
import 'package:test_admin/admin_sign_in.dart';
import 'package:test_admin/customer_list.dart';
import 'package:test_admin/reports.dart';
import 'package:test_admin/tailor_list.dart';
import 'customer.dart';
import 'tailor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 233, 226, 234),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: GoogleFonts.poppins(color: Colors.black), 
              ),
            ),
            const SizedBox(width: 20),
           IconButton(
              icon: Icon(Icons.email, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminNotificationsScreen()),
                );
              },
            ),
          
           
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                statCard("Customers", "54", Icons.people,Color.fromARGB(255, 178, 119, 147), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomerList()),
                  );
                }),
                statCard("Tailors", "79", Icons.people,Color.fromARGB(255, 119, 164, 178), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TailorList()),
                  );
                }),
                statCard("Orders", "124", Icons.shopping_cart,Color.fromARGB(255, 163, 119, 178), () {}),
                statCard("Income", "6000DA", Icons.monetization_on,Color.fromARGB(255, 119, 178, 137), () {}),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(child: ordersPerTailorChart()),
          ],
        ),
      ),
    );
  }

  Widget statCard(String title, String value, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color.withOpacity(0.1),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          width: 160,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 30),
              Text(value, style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
              Text(title, style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[700])), 
            ],
          ),
        ),
      ),
    );
  }

Widget ordersPerTailorChart() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 470,
            width: 1300,
            child: barChartWidget(),
          ),
          const SizedBox(height: 20),
        ],
      ),
      Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 470,
                width: 250,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 160,
                        width: 160,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            PieChart(
                              PieChartData(
                                sections: getStyledPieChartSections(),
                                centerSpaceRadius: 45,
                                sectionsSpace: 2,
                              ),
                            ),
                            Text(
                              "75%", 
                              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "The percentage of registered customers who purchase from the app",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          print("Check Now clicked!");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Color.fromARGB(255, 163, 119, 178),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                        child: Text(
                          "Check Now",
                          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget barChartWidget() {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            "Monthly Profits",
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                barGroups: List.generate(12, (index) {
                  final List<int> profits = [5000, 7000, 6000, 8000, 9000, 7500, 9500, 11000, 10500, 12000, 13000, 12500];
                  final List<int> additionalIncome = [3000, 4000, 3500, 4500, 5000, 4200, 5300, 6000, 5900, 6500, 7000, 6800];
                  return BarChartGroupData(
                    x: index + 1,
                    barRods: [
                      BarChartRodData(
                        toY: profits[index].toDouble(),
                        color:Color.fromARGB(255, 119, 164, 178),
                        width: 15,
                      ),
                      BarChartRodData(
                        toY: additionalIncome[index].toDouble(),
                        color: Color.fromARGB(255, 178, 119, 147),
                        width: 15,
                      ),
                    ],
                  );
                }),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        const List<String> months = [
                          "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
                        ];
                        return Text(months[value.toInt() - 1], style: GoogleFonts.poppins(fontSize: 12));
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: true, drawVerticalLine: false),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 16, height: 16, color: Color.fromARGB(255, 119, 167, 178)),
              SizedBox(width: 5),
              Text("Profits From Subscriptions", style: GoogleFonts.poppins(fontSize: 14)),
              SizedBox(width: 20),
              Container(width: 16, height: 16, color: Color.fromARGB(255, 178, 119, 147)),
              SizedBox(width: 5),
              Text(" Profits From Ads", style: GoogleFonts.poppins(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
            
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:Color.fromARGB(255, 163, 119, 178),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: Text(
              "Check Now",
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}

}



List<PieChartSectionData> getStyledPieChartSections() {
  return [
    PieChartSectionData(
      color: const Color.fromARGB(255, 163, 119, 178),
      value: 75,
      title: '',
      radius: 20, 
    ),
    PieChartSectionData(
     color: const Color.fromARGB(255, 119, 178, 150),
      value: 25,
      title: '',
      radius: 20, 
    ),
  ];
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
       DrawerHeader(
  decoration: BoxDecoration(color: Colors.white),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // Restrict image size to avoid overflow
      SizedBox(
        height: 80, // Adjust the height to fit within the drawer
        child: Image.asset(
          "images/2.jpg",
          fit: BoxFit.contain, // Ensures it scales properly
        ),
      ),

      Spacer(), // Pushes the email section to the bottom

      // Email and Icon at the Bottom
      Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 163, 119, 178), // Purple background
            ),
            padding: EdgeInsets.all(8), // Padding inside the circle
            child: Icon(Icons.person, color: Colors.white, size: 24), // White icon
          ),
          SizedBox(width: 8), // Space between icon and email
          Text(
            "your_email@example.com", // Replace with actual email variable
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    ],
  ),
),
          sidebarItem("Dashboard", Icons.dashboard, context, DashboardScreen()),
          sidebarItem("Accounts Tailors", Icons.account_balance, context, TailorScreen()),
          sidebarItem("Accounts Customers", Icons.account_balance, context, CustomerScreen()),
          sidebarItem("Reports", Icons.analytics, context, ReportsScreen()), 
          sidebarItem("Logout", Icons.logout , context, AdminSignIn()), 
        ],
      ),
    );
  }

  Widget sidebarItem(String title, IconData icon, BuildContext context, Widget destination) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey[700]),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
    );
  }
}