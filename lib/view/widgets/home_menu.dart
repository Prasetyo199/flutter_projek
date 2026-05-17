import 'package:flutter/material.dart';
import 'package:flutter_projek/view/mahasiswa/mahasiswa_page.dart';
import 'scaffold_page.dart';
import 'center_page.dart';
import 'row_page.dart';
import 'container_page.dart';
import 'stack_page.dart';
import 'padding_page.dart';
import 'align_page.dart';
import 'elevatedbutton_page.dart';
import 'textfield_page.dart';
import 'image_internet_page.dart'; 
import 'image_local_page.dart';     
import 'icon_page.dart';
import 'gridview_page.dart';
import 'listview_page.dart';
import 'bottom_nav_page.dart';
import 'push_navigation_page.dart';
import 'mahasiswa/mahasiswa_page.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengubah background menjadi lebih gelap (Slate)
      backgroundColor: Colors.blueGrey[50], 
      appBar: AppBar(
        title: const Text(
          'Flutter Learning Catalog',
          style: TextStyle(letterSpacing: 1.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: false, 
        elevation: 4,
        backgroundColor: Colors.teal[700], 
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          _buildHeader('Basic Layout'),
          _menuItem(context, 'Scaffold Page', const ScaffoldPage(), Icons.dashboard_customize_outlined),
          _menuItem(context, 'Center Page', const CenterPage(), Icons.filter_center_focus),
          _menuItem(context, 'Container Page', const ContainerPage(), Icons.crop_square_sharp),
          _menuItem(context, 'Row Page', const RowPage(), Icons.view_quilt),
          _menuItem(context, 'Stack Page', const StackPositionedPage(), Icons.copy_all_rounded),
          _menuItem(context, 'Padding Page', const PaddingPage(), Icons.settings_ethernet_rounded),
          _menuItem(context, 'Align Page', const AlignPage(), Icons.align_horizontal_center_rounded),
          
          _buildHeader('Widgets & Input'),
          _menuItem(context, 'Text Field', const TextfieldPage(), Icons.input_rounded),
          _menuItem(context, 'Elevated Button', const ElevatedButtonPage(), Icons.ads_click_rounded),
          _menuItem(context, 'Image Network', const ImageNetworkPage(), Icons.web_asset_rounded),
          _menuItem(context, 'Image Asset', const ImageAssetPage(), Icons.photo_library_rounded),
          _menuItem(context, 'Icon Page', const IconPage(), Icons.category_rounded),
          
          _buildHeader('Navigation & Lists'),
          _menuItem(context, 'GridView Builder', const GridviewBuilderPage(), Icons.grid_on_rounded),
          _menuItem(context, 'ListView Builder', const ListviewBuilderPage(), Icons.format_list_bulleted_rounded),
          _menuItem(context, 'Bottom Navigation', const BottomNavPage(), Icons.tab_unselected_rounded),
          
          _buildHeader('Materi 6: Navigation'),
          _menuItem(context, 'Navigator Push', const PushNavigationPage(), Icons.double_arrow_rounded),
          
          _menuItem(context, 'Data Mahasiswa (Supabase)', const MahasiswaPage(), Icons.people_alt_rounded),

          _buildHeader('Widgets & Input'),
          
          // WIDGET CARD UNTUK MAHASISWA INPUT DATA
          Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.teal[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.people_alt_rounded, color: Colors.teal[700]),
              ),
              title: const Text(
                'Data Mahasiswa (Supabase)', 
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.teal)
              ),
              subtitle: const Text('Input data mahasiswa & jurusan secara real-time'),
              trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
              onTap: () {
                // Berpindah ke Halaman Daftar Mahasiswa Real-time
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MahasiswaPage()),
                );
              },
            ),
          ),

          Card(
            elevation: 2, 
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), 
            child: ListTile(
              leading: Icon(Icons.near_me_rounded, color: Colors.orange[800]),
              title: const Text('Named Routes Navigation', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
              onTap: () => Navigator.pushNamed(context, '/detail'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 16, 4, 10),
      child: Text(
        title.toUpperCase(), 
        style: TextStyle(
          fontSize: 13, 
          fontWeight: FontWeight.w800, 
          color: Colors.teal[900],
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _menuItem(BuildContext context, String title, Widget page, IconData icon) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.teal[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.teal[700]),
        ),
        title: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}