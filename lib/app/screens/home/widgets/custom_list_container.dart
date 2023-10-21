import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/history_viewmodel.dart';

class CustomListContainer extends StatelessWidget {
  const CustomListContainer({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    var watch = context.watch<HistoryViewModel>();
    return ListView.builder(
      itemCount: watch.histories.length,
      itemBuilder: (context, index) {
        var histories = watch.histories[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
              height: height * 0.15,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xffececec)),
              child: Row(
                children: [
                  Container(
                    height: height * 0.11,
                    width: width * 0.3,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurpleAccent, // Gri arka plan rengi
                    ),
                    child: Center(
                        child: CircleAvatar(
                      radius: 37,
                      backgroundImage: AssetImage(histories.image),
                      backgroundColor: const Color(0xffececec), // Varsa arka plan rengi
                      // Child boş olmalıdır
                      // fit: BoxFit.cover, // Resmi tam olarak doldurur
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("00${index + 1} Generation",
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            )),
                        Text(histories.name,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(
                          width: width * 0.5,
                          child: Text(
                            histories.text,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
