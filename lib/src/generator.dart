import 'package:qr/qr.dart';

class QrGenerator {
  /// Takes in a String [data], using the string it generates a QR Image:
  /// ```output
  ///    ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
  ///    █ ▄▄▄▄▄ █▀█▄▀    █▀ ▄█   ▀▀  ▀▀ ▄▀█ ▄▄▄▄▄ █
  ///    █ █   █ █▄▀▄▄▄ ▀ █▄ ▀▄█▀▄██ ▀▀▄ ▀██ █   █ █
  ///    █ █▄▄▄█ █ ▀█▄  ▄▀██▄▀█▀ ▄█    █ ▀██ █▄▄▄█ █
  ///    █▄▄▄▄▄▄▄█ ▀ █▄█▄▀▄▀ █▄▀ █ █ ▀ ▀▄▀ █▄▄▄▄▄▄▄█
  ///    █ ▄▀▄▀▀▄▄▀█▀▄▀ ▄█▀▀██▀ █▄█  █ ▀▀█▀█ ▄▄▀▄ ▀█
  ///    █▄▀ ▀▄ ▄█▄▄███ ▄▀▄█ ▄█ ▀█  ▀█ █ ▄█ █ ▀▄  ██
  ///    █▀ ▄▀▀▄▄▄▀▄▀  █ █▄ ▀▀  ██▄▄██▄ ▀▀▀ ▄████▄▄█
  ///    █▄▀▀▀ ▀▄▄▄▀▄█ ▀▀█▀ ██ ▀  █  ▀ ▀▀▀▄ ▄██▄█ ▄█
  ///    █▀  ▄▀ ▄█▀█▀  █▀█▀▄█▄█  ▀▀▀▄█ ▄█▄█ ▀██ ▀ ▀█
  ///    █▄ ▀ █▀▄ ▄█▀█▀ █▀▄ ▀██ ▄▀▀█ ▀▀ ▀█ █ ▄▀ ▄▄▄█
  ///    █▀ ▀▄▄▄▄▄█   █▀▄█▀▀██  ▀▄ ▄ █ ▀██▀▄ ██▄▄▄ █
  ///    █ █▄  █▄ ▀█▀██ ▀▀▄█  ▄  █ ▀█▀▄█  ▄▄ ▄▄▄ ▄▀█
  ///    ███▀▄█ ▄▄▄  █▀▄██▄ ▀▀  ▀█ ▄▀█▄ █▀ ▄▄▀█▀█▄██
  ///    █ ▄▄▀▄▄▄▄█▄▀ █▀▀█▀ █▀▀▀▀▄▄  ▀  ██ ▄  ▀▄█▄▄█
  ///    █▄██▀ █▄▀█ ██  ▄█▀▄█▄▄ ▄▀ ▀▀█▀▄██▄ ▀▀█▀▀▀▀█
  ///    █▄█▄  ▀▄ ██▀▄ █ ▀▄ ▀█▀▀▀█▀▄ ▀▄▀███  █▄ ▄▄ █
  ///    █▄█▄▄█▄▄█   █ ▄ █▀▀█▄▀ █▄▀ ▄█ ▀█▀ ▄▄▄ ▄▄ ▀█
  ///    █ ▄▄▄▄▄ █▄  █ █▀▀▄█ ▄█▀ ▀█ ▀█ █ ▀ █▄█ ▄  ██
  ///    █ █   █ █▀ █▀████▄ ▀▀█ ██▀▄██▄ ▀█▄▄ ▄ ▀█▄▄█
  ///    █ █▄▄▄█ █▀▀▀ █  █▀ ███▀  █▀ █▀  ▀▀▄█ ▄▄▄ ▄█
  ///    ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
  /// ```
  static String get(String data) {
    /// converts the string to a valid QR code
    final qrCode =
        QrCode.fromData(data: data, errorCorrectLevel: QrErrorCorrectLevel.L);

    /// Creates a qr image from the qr code.
    final qrImage = QrImage(qrCode);

    /// Defines an output buffer
    var output = '';
    var BLACK = true, WHITE = false;

    /// Convert the qrImage to redable data set
    var moduleCount = qrImage.moduleCount;
    var moduleData = qrImage.qrModules.toList();

    /// Defines a color pallet to draw the ASCII qr output
    var platte = {
      'WHITE_ALL': '\u2588',
      'WHITE_BLACK': '\u2580',
      'BLACK_WHITE': '\u2584',
      'BLACK_ALL': ' ',
    };

    /// Creates the borders around the QR code
    var borderTop = paintBorder(platte['BLACK_WHITE']!, moduleCount + 2);
    var borderBottom = paintBorder(platte['WHITE_BLACK']!, moduleCount + 2);

    /// Start with the top border
    output += borderTop + '\n';

    //Split the moduleRow and takes the next two
    for (var row = 0; row < moduleCount - 1; row += 2) {
      try {
        /// Each row starts with a white block, so we ensure the first paint is a white square
        output += platte['WHITE_ALL']!;

        /// Based on the module state, true or false we draw black or white square from the matrix
        /// for each column in the current row.
        for (var col = 0; col < moduleCount; col++) {
          if (moduleData[row][col] == WHITE &&
              moduleData[row + 1][col] == WHITE) {
            output += platte['WHITE_ALL']!;
          } else if (moduleData[row][col] == WHITE &&
              moduleData[row + 1][col] == BLACK) {
            output += platte['WHITE_BLACK']!;
          } else if (moduleData[row][col] == BLACK &&
              moduleData[row + 1][col] == WHITE) {
            output += platte['BLACK_WHITE']!;
          } else {
            output += platte['BLACK_ALL']!;
          }
        }

        /// Append the row to the output buffer after all the columns are drawn.
        output += '${platte['WHITE_ALL']!}\n';
      } catch (exception) {
        rethrow;
      }
    }

    /// Append the bottom border to the qr code.
    output += borderBottom;

    return output;
  }

  static paintBorder(color, lenght) {
    var output = "";
    for (int i = 0; i < lenght; i++) {
      output += color;
    }
    return output;
  }
}
