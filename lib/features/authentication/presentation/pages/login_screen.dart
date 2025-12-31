import 'package:flutter/material.dart';
import 'package:lms/core/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double headerHeight = size.height * 0.35; // Bagian Atas (35% layar)

    return Scaffold(
      backgroundColor: Colors.white, // Scaffold background putih
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian Atas: Container warna Merah Marun dengan bentuk bawah melengkung
            ClipPath(
              clipper: CurvedBottomClipper(),
              child: Container(
                height: headerHeight,
                width: double.infinity,
                color: kPrimaryColor,
                child: Center(
                    // Gambar kampus atau Icon fallback jika gambar tidak ada
                    child: Image.asset(
                  'assets/images/kampus.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/logo.png', // Try logo if kampus missing
                      width: 120,
                      height: 120,
                      errorBuilder: (c, e, s) => const Icon(
                        Icons.school,
                        size: 80,
                        color: Colors.white54,
                      ),
                    );
                  },
                )),
              ),
            ),
            
            // Bagian Bawah (Isi Form)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   // Judul Besar "Login" (Bold)
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // TextField "Email 365"
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email 365",
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // TextField "Password"
                  TextFormField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: const UnderlineInputBorder(),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Tombol "Log In"
                  SizedBox(
                    width: double.infinity, // Lebar penuh
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement login placeholder
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login not implemented yet")),
                        );
                      },
                      child: const Text("Log In"),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // TextButton "Bantuan ?"
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Bantuan ?",
                        style: TextStyle(color: kTextLightColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CustomClipper untuk lengkungan bawah
class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50); // Start from bottom-left minus some curve height
    
    // Create a quadratic bezier curve
    // Control point is at the bottom-center (slightly lower than end points to curve down)
    // End point is at bottom-right minus curve height
    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 50);
    
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    
    path.lineTo(size.width, 0); // Go to top-right
    path.close(); // Close path back to top-left
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
