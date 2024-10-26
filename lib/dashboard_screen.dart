import 'package:flutter/material.dart';
import 'login_screen.dart'; // Pastikan kamu mengimpor halaman LoginScreen

class DashboardScreen extends StatelessWidget {
  // Menambahkan data email ke dalam riwayat login
  final List<Map<String, String>> loginHistory;

  DashboardScreen({super.key, required this.loginHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Tombol Back
          onPressed: () {
            // Navigasi kembali ke halaman LoginScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 212, 247, 255), // Warna atas
              Color.fromARGB(255, 0, 67, 175),  // Warna bawah
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Your Login History',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: loginHistory.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Icon(
                          loginHistory[index]['status'] == 'Success'
                              ? Icons.check_circle
                              : Icons.error,
                          color: loginHistory[index]['status'] == 'Success'
                              ? Colors.green
                              : Colors.red,
                        ),
                        // Menampilkan email dan waktu login
                        title: Text(
                          '${loginHistory[index]['email']} - ${loginHistory[index]['time']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          'Status: ${loginHistory[index]['status']}',
                          style: TextStyle(
                            color: loginHistory[index]['status'] == 'Success'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
