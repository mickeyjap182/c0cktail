
// Is this a library directory?
import 'package:samples/samples.dart' as samples;

// command sample
void main(List<String> arguments) {
  print('Hello world: ${samples.calculate()}!');
  print('minus: ${samples.minus(4, 1)}');

  print(arguments.length);
  if (arguments.length > 0) {
      int x = 0;
      try {
          for (var a in arguments) {
              x += int.parse(a);
          }
          print('sum: ${x}');

      }catch(e) {
          print('Error:' +e.message);
      }
  }
}
