import 'package:ai_voice_changer_app/app/constants/global_veriables.dart';
import 'package:ai_voice_changer_app/app/screens/generation/view/local_media_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/const.dart';
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
        var historyList = watch.histories[index];
        return GestureDetector(
          onTap: () {
            history = historyList;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LocalMediaPlayer(),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.01, horizontal: width * 0.05),
            child: Container(
              height: height * 0.155,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xffececec)),
              child: Row(
                children: [
                  Container(
                    height: height * 0.1,
                    width: width * 0.3,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyConstants.deepPurpleAccent,
                    ),
                    child: Center(
                      child: CircleAvatar(
                        radius: width * 0.09,
                        backgroundImage: AssetImage(historyList.image),
                        backgroundColor: const Color(0xffececec),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.025, horizontal: width * 0.025),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "00${index + 1} Generation",
                          style: TextStyle(
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          historyList.name,
                          style: TextStyle(
                            fontSize: width * 0.025,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: width * 0.4,
                          child: Text(
                            historyList.text,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<HistoryViewModel>().delete(index);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
