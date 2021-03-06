import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/vlc_player.dart';
import 'package:flutter_vlc_player/vlc_player_controller.dart';
import 'package:muticam_dashboard/core/models/CameraStream.dart';
import 'package:muticam_dashboard/ui/views/CameraStreamDetails.dart';

class CameraStreamVLCCard extends StatefulWidget {
  final CameraStream cameraStreamInfo;

  CameraStreamVLCCard({@required this.cameraStreamInfo});

  @override
  CameraStreamVLCCardState createState() => CameraStreamVLCCardState();
}

class CameraStreamVLCCardState extends State<CameraStreamVLCCard> {
  final VlcPlayerController controller = VlcPlayerController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CameraStreamDetails(
                      cameraStream: widget.cameraStreamInfo,
                    )));
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: widget.cameraStreamInfo.id,
                  child: VlcPlayer(
                    defaultWidth:
                        (MediaQuery.of(context).size.height * 0.9).round(),
                    defaultHeight:
                        (MediaQuery.of(context).size.height * 0.45).round(),
                    url: widget.cameraStreamInfo.cameraStreamUrl,
                    controller: controller,
                    placeholder: Center(child: CircularProgressIndicator()),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.cameraStreamInfo.cameraStreamTitle ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
