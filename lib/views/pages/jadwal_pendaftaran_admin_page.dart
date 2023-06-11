import 'package:flutter/material.dart';

class JadwalPendaftaranAdminPage extends StatelessWidget {
  const JadwalPendaftaranAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jadwal Pendaftaran',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(),
    );
  }
}
