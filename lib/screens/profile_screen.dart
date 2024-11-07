import 'package:flutter/material.dart';
import 'package:wisata_candi_wahyu/widgets/profile_item_indo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1. Deklarasikan variabel yg dibutuhkan
  bool isSignedIn = false;
  String fullName = "DummyName";
  String userName = "DUmmtUserName";
  int favouriteCandiCount = 0;

  // TODO: 5. Implementasi Fungsi SIGN IN
  void signIn() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  // TODO: 6. Implementasi Fungsi SIGN OUT
  void signOut() {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.deepPurple,
                                    width: 2,
                                  ),
                                  shape: BoxShape.circle),
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage("images/avatar_image.jpg"),
                              ),
                            ),
                            if (isSignedIn)
                              IconButton(
                                onPressed: null,
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: Colors.deepPurple,
                                ),
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.deepPurple[200],
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Pengguna",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Text(
                      ': $userName',
                      style: const TextStyle(fontSize: 18),
                    ))
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(
                  color: Colors.deepPurple[100],
                ),
                SizedBox(
                  height: 4,
                ),
                // Row(
                //   children: [
                //     SizedBox(
                //       width: MediaQuery.of(context).size.width / 3,
                //       child: Row(
                //         children: [
                //           Icon(
                //             Icons.person,
                //             color: Colors.blue,
                //           ),
                //           SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             'Nama',
                //             style: TextStyle(
                //                 fontSize: 18, fontWeight: FontWeight.bold),
                //           )
                //         ],
                //       ),
                //     ),
                //     Expanded(
                //         child: Text(
                //       ': $fullName',
                //       style: const TextStyle(fontSize: 18),
                //     )),
                //     if (isSignedIn) const Icon(Icons.edit),
                //   ],
                // ),

                ProfileItemInfo(
                  icon: Icons.person,
                  label: 'Name',
                  value: fullName,
                  iconColor: Colors.blue,
                  showEditIcon: isSignedIn,
                  onEditPressed: () {
                    debugPrint('Icon Edit Ditekan;');
                  },
                ),
                SizedBox(
                  height: 4,
                ),
                Divider(
                  color: Colors.deepPurple[100],
                ),
                const SizedBox(
                  height: 4,
                ),
                ProfileItemInfo(
                    icon: Icons.favorite,
                    label: 'Favorit',
                    value:
                        favouriteCandiCount > 0 ? '$favouriteCandiCount' : '',
                    iconColor: Colors.red,
                    showEditIcon: isSignedIn,
                    onEditPressed: () {
                      debugPrint('Icon Edit Ditekan;');
                    }),
                    // TODO 4. Buat ProfileAction yg berisi TextButton Sign in/out
                SizedBox(
                  height: 4,
                ),
                Divider(
                  color: Colors.deepPurple[100],
                ),
                SizedBox(
                  height: 20,
                ),
                isSignedIn
                    ? TextButton(
                        onPressed: signOut, child: const Text('Sign Out'))
                    : TextButton(
                        onPressed: signIn, child: const Text('Sign In')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
