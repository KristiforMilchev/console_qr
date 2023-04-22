# Console QR

console_qr package lets you generate text based qr codes, useful for printing scannable terminal

## Installation

 ```yaml
dependencies:
  console_qr: ^0.0.1
```
```dart
import 'package:console_qr/console_qr.dart';
```



<hr>

<table>
<tr>
<td>

```dart
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var qrContent = "otpauth://totp/dwadwadawdawdaw?secret=dawdawdawdadawdawdawdadawdawdawdadawdawdawdadawdawdawdadawdawdawda&issuer=dwadawdawdawd";

    var code = QrGenerator.get(qrContent);
    return Scaffold(
      body: Center(
        child: Text(code)
      ),
    );
  }
}
```

</td>
<td>
<p>
▄▄▄▄▄▄z▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
█ ▄▄▄▄▄ █▀█▄▀    █▀ ▄█   ▀▀  ▀▀ ▄▀█ ▄▄▄▄▄ █
█ █   █ █▄▀▄▄▄ ▀ █▄ ▀▄█▀▄██ ▀▀▄ ▀██ █   █ █
█ █▄▄▄█ █ ▀█▄  ▄▀██▄▀█▀ ▄█    █ ▀██ █▄▄▄█ █
█▄▄▄▄▄▄▄█ ▀ █▄█▄▀▄▀ █▄▀ █ █ ▀ ▀▄▀ █▄▄▄▄▄▄▄█
█ ▄▀▄▀▀▄▄▀█▀▄▀ ▄█▀▀██▀ █▄█  █ ▀▀█▀█ ▄▄▀▄ ▀█
█▄▀ ▀▄ ▄█▄▄███ ▄▀▄█ ▄█ ▀█  ▀█ █ ▄█ █ ▀▄  ██
█▀ ▄▀▀▄▄▄▀▄▀  █ █▄ ▀▀  ██▄▄██▄ ▀▀▀ ▄████▄▄█
█▄▀▀▀ ▀▄▄▄▀▄█ ▀▀█▀ ██ ▀  █  ▀ ▀▀▀▄ ▄██▄█ ▄█
█▀  ▄▀ ▄█▀█▀  █▀█▀▄█▄█  ▀▀▀▄█ ▄█▄█ ▀██ ▀ ▀█
█▄ ▀ █▀▄ ▄█▀█▀ █▀▄ ▀██ ▄▀▀█ ▀▀ ▀█ █ ▄▀ ▄▄▄█
█▀ ▀▄▄▄▄▄█   █▀▄█▀▀██  ▀▄ ▄ █ ▀██▀▄ ██▄▄▄ █
█ █▄  █▄ ▀█▀██ ▀▀▄█  ▄  █ ▀█▀▄█  ▄▄ ▄▄▄ ▄▀█
███▀▄█ ▄▄▄  █▀▄██▄ ▀▀  ▀█ ▄▀█▄ █▀ ▄▄▀█▀█▄██
█ ▄▄▀▄▄▄▄█▄▀ █▀▀█▀ █▀▀▀▀▄▄  ▀  ██ ▄  ▀▄█▄▄█
█▄██▀ █▄▀█ ██  ▄█▀▄█▄▄ ▄▀ ▀▀█▀▄██▄ ▀▀█▀▀▀▀█
█▄█▄  ▀▄ ██▀▄ █ ▀▄ ▀█▀▀▀█▀▄ ▀▄▀███  █▄ ▄▄ █
█▄█▄▄█▄▄█   █ ▄ █▀▀█▄▀ █▄▀ ▄█ ▀█▀ ▄▄▄ ▄▄ ▀█
█ ▄▄▄▄▄ █▄  █ █▀▀▄█ ▄█▀ ▀█ ▀█ █ ▀ █▄█ ▄  ██
█ █   █ █▀ █▀████▄ ▀▀█ ██▀▄██▄ ▀█▄▄ ▄ ▀█▄▄█
█ █▄▄▄█ █▀▀▀ █  █▀ ███▀  █▀ █▀  ▀▀▄█ ▄▄▄ ▄█
▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
</p>
</td>
</tr>
</table>

