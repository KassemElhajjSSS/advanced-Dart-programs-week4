import 'dart:io';
import 'postManager.dart';
import 'post.dart';

void main() async {
  final postManager = PostManager();
  await postManager.loadTasks(); // Load tasks at the start

  while (true) {
    print('\nEnter a command (add, remove, edit, show, save, quit):');
    final input = stdin.readLineSync();

    if (input == 'add') {
      print('Enter task title:');
      final title = stdin.readLineSync()!;
      print('Enter content:');
      final content = stdin.readLineSync()!;
      postManager.addPost(Post(title, content));
    } else if (input == 'remove') {
      print('Enter task number:');
      final index = int.parse(stdin.readLineSync()!);
      postManager.removePost(index);
    } else if (input == 'edit') {
      print('Enter task number:');
      final index = int.parse(stdin.readLineSync()!);
      print('Enter content:');
      final content = stdin.readLineSync()!;
      postManager.editPost(index, content);
    } else if (input == 'show') {
      postManager.showPosts();
    } else if (input == 'save') {
      await postManager.savePosts();
    } else if (input == 'quit') {
      print('Exiting...');
      break;
    } else {
      print('Invalid command.');
    }
  }
}
