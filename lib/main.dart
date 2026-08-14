import 'package:flutter/material.dart';

void main() {
  runApp(const CityRiseApp());
}

class CityRiseApp extends StatelessWidget {
  const CityRiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'City Rise - هربة فـ المغرب',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFF4F4F9),
        useMaterialDesign: true,
      ),
      home: const MainMenuScreen(),
    );
  }
}

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.map_sharp, size: 90, color: Colors.redAccent),
            const SizedBox(height: 15),
            const Text(
              'CITY RISE',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
            const Text('هربة فـ كاع مدن وجهات المغرب 🇲🇦', style: TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
              icon: const Icon(Icons.play_arrow, color: Colors.white),
              label: const Text('اختر جهتك ومدينتك وابدأ', style: TextStyle(fontSize: 18, color: Colors.white)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MoroccoMapScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MoroccoMapScreen extends StatelessWidget {
  const MoroccoMapScreen({super.key});

  // قائمة شاملة لجهات المملكة المغربية وأقاليمها ومدنها
  final List<Map<String, String>> regionsAndCities = const [
    // 1. طنجة - تطوان - الحسيمة
    {'region': 'طنجة - تطوان - الحسيمة', 'city': 'طنجة 🌊'},
    {'region': 'طنجة - تطوان - الحسيمة', 'city': 'تطوان 🕊️'},
    {'region': 'طنجة - تطوان - الحسيمة', 'city': 'الحسيمة 🏖️'},
    {'region': 'طنجة - تطوان - الحسيمة', 'city': 'العرائش 🎣'},
    {'region': 'طنجة - تطوان - الحسيمة', 'city': 'شفشاون 💙'},
    {'region': 'طنجة - تطوان - الحسيمة', 'city': 'القصر الكبير 🍊'},
    {'region': 'طنجة - تطوان - الحسيمة', 'city': 'أصيلة 🎨'},
    {'region': 'طنجة - تطوان - الحسيمة', 'city': 'المضيق - الفنيدق ⚓'},

    // 2. الشرق
    {'region': 'الشرق', 'city': 'وجدة 🏛️'},
    {'region': 'الشرق', 'city': 'ناظور 🌊'},
    {'region': 'الشرق', 'city': 'بركان 🍊'},
    {'region': 'الشرق', 'city': 'تاوريرت 🌵'},
    {'region': 'الشرق', 'city': 'جرادة ⛰️'},
    {'region': 'الشرق', 'city': 'الدريوش 🌴'},
    {'region': 'الشرق', 'city': 'فجيج 🏺'},
    {'region': 'الشرق', 'city': 'السعيدية 🏖️'},

    // 3. فاس - مكناس
    {'region': 'فاس - مكناس', 'city': 'فاس 🏰'},
    {'region': 'فاس - مكناس', 'city': 'مكناس 🐎'},
    {'region': 'فاس - مكناس', 'city': 'تازة ⛰️'},
    {'region': 'فاس - مكناس', 'city': 'إفران ❄️'},
    {'region': 'فاس - مكناس', 'city': 'صفرو 🍒'},
    {'region': 'فاس - مكناس', 'city': 'الحاجب 🌾'},
    {'region': 'فاس - مكناس', 'city': 'مولاي يعقوب ♨️'},
    {'region': 'فاس - مكناس', 'city': 'بولمان 🏜️'},
    {'region': 'فاس - مكناس', 'city': 'تاونات ⛰️'},

    // 4. الرباط - سلا - القنيطرة
    {'region': 'الرباط - سلا - القنيطرة', 'city': 'الرباط 🕌'},
    {'region': 'الرباط - سلا - القنيطرة', 'city': 'سلا 🏺'},
    {'region': 'الرباط - سلا - القنيطرة', 'city': 'القنيطرة 🌊'},
    {'region': 'الرباط - سلا - القنيطرة', 'city': 'تمارة 🏖️'},
    {'region': 'الرباط - سلا - القنيطرة', 'city': 'الخميسات 🌳'},
    {'region': 'الرباط - سلا - القنيطرة', 'city': 'سيدي قاسم 🌾'},
    {'region': 'الرباط - سلا - القنيطرة', 'city': 'سيدي سليمان 🌿'},

    // 5. بني ملال - خنيفرة
    {'region': 'بني ملال - خنيفرة', 'city': 'بني ملال 🏔️'},
    {'region': 'بني ملال - خنيفرة', 'city': 'خريبكة 🏭'},
    {'region': 'بني ملال - خنيفرة', 'city': 'الفقيه بن صالح 🌾'},
    {'region': 'بني ملال - خنيفرة', 'city': 'خنيفرة 🌲'},
    {'region': 'بني ملال - خنيفرة', 'city': 'أزيلال ⛰️'},

    // 6. الدار البيضاء - سطات
    {'region': 'الدار البيضاء - سطات', 'city': 'الدار البيضاء (كازا) 🚗'},
    {'region': 'الدار البيضاء - سطات', 'city': 'المحمدية 🌸'},
    {'region': 'الدار البيضاء - سطات', 'city': 'الجديدة 🐎'},
    {'region': 'الدار البيضاء - سطات', 'city': 'سطات 🌾'},
    {'region': 'الدار البيضاء - سطات', 'city': 'برشيد ✈️'},
    {'region': 'الدار البيضاء - سطات', 'city': 'بنسليمان 🌲'},
    {'region': 'الدار البيضاء - سطات', 'city': 'مديونة 🏗️'},
    {'region': 'الدار البيضاء - سطات', 'city': 'النواصر ✈️'},
    {'region': 'الدار البيضاء - سطات', 'city': 'سيدي بنور 🚜'},

    // 7. مراكش - آسفي
    {'region': 'مراكش - آسفي', 'city': 'مراكش ☀️'},
    {'region': 'مراكش - آسفي', 'city': 'آسفي 🏺'},
    {'region': 'مراكش - آسفي', 'city': 'الصويرة 🌊'},
    {'region': 'مراكش - آسفي', 'city': 'قلعة السراغنة 🫒'},
    {'region': 'مراكش - آسفي', 'city': 'الرحامنة (بن جرير) 🔬'},
    {'region': 'مراكش - آسفي', 'city': 'اليوسفية ⛏️'},
    {'region': 'مراكش - آسفي', 'city': 'شيشاوة ⛰️'},
    {'region': 'مراكش - آسفي', 'city': 'الحوز 🏔️'},

    // 8. درعة - تافيلالت
    {'region': 'درعة - تافيلالت', 'city': 'ورزازات 🎬'},
    {'region': 'درعة - تافيلالت', 'city': 'الرشيدية 🌴'},
    {'region': 'درعة - تافيلالت', 'city': 'زاكورة 🐪'},
    {'region': 'درعة - تافيلالت', 'city': 'تنغير 🏜️'},
    {'region': 'درعة - تافيلالت', 'city': 'ميضلت 🍎'},

    // 9. سوس - ماسة
    {'region': 'سوس - ماسة', 'city': 'أكادير 🏖️'},
    {'region': 'سوس - ماسة', 'city': 'إنزكان - آيت ملول 🛒'},
    {'region': 'سوس - ماسة', 'city': 'تزنيت 💍'},
    {'region': 'سوس - ماسة', 'city': 'تارودانت 🧱'},
    {'region': 'سوس - ماسة', 'city': 'طاطا 🌴'},
    {'region': 'سوس - ماسة', 'city': 'اشتوكة آيت باها 🍅'},

    // 10. كلميم - واد نون
    {'region': 'كلميم - واد نون', 'city': 'كلميم 🐪'},
    {'region': 'كلميم - واد نون', 'city': 'طانطان 🌊'},
    {'region': 'كلميم - واد نون', 'city': 'آسا الزاك ⛺'},
    {'region': 'كلميم - واد نون', 'city': 'سيدي إفني 🎣'},

    // 11. العيون - الساقية الحمراء
    {'region': 'العيون - الساقية الحمراء', 'city': 'العيون 🌴'},
    {'region': 'العيون - الساقية الحمراء', 'city': 'بوجدور ⚓'},
    {'region': 'العيون - الساقية الحمراء', 'city': 'طرفاية 🌊'},
    {'region': 'العيون - الساقية الحمراء', 'city': 'السمارة ⛺'},

    // 12. الداخلة - وادي الذهب
    {'region': 'الداخلة - وادي الذهب', 'city': 'الداخلة 🌊'},
    {'region': 'الداخلة - وادي الذهب', 'city': 'أوسرد 🐪'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جميع جهات ومدن المغرب 🇲🇦'),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: regionsAndCities.length,
        itemBuilder: (context, index) {
          final item = regionsAndCities[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.location_on, color: Colors.white),
              ),
              title: Text(item['city']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              subtitle: Text('جهة: ${item['region']}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameplayScreen(cityName: item['city']!)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class GameplayScreen extends StatefulWidget {
  final String cityName;
  const GameplayScreen({super.key, required this.cityName});

  @override
  State<GameplayScreen> createState() => _GameplayScreenState();
}

class _GameplayScreenState extends State<GameplayScreen> {
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مرحلة: ${widget.cityName}'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _score += 10;
          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black12,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('النقط فـ ${widget.cityName}: $_score', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              const Icon(Icons.directions_car, size: 100, color: Colors.amber),
              const SizedBox(height: 20),
              const Text('اضغط على الشاشة للتنقاز وتفادي الزحام!', style: TextStyle(fontSize: 16, color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }
}

