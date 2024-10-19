import "post.dart";
import 'dart:convert';
import 'dart:io';

class PostManager {
  List<Post> _posts = [];

  void addPost(Post post) {
    _posts.add(post);
  }

  void removePost(int index) {
    if (index >= 0 && index < _posts.length) {
      Post deletedPost = _posts.removeAt(index);
      print('Post of title: ${deletedPost.title}');
    } else {
      print("there are no posts found");
    }
  }

  void editPost(int index, String newContent) {
    if (index >= 0 && index < _posts.length) {
      _posts[index].content = newContent;
      print('Post of title: ${_posts[index].title}');
    } else {
      print("There are no posts found");
    }
  }

  void showPosts() {
    if (_posts.length == 0) {
      print("There are no posts yet");
    } else {
      for (int i = 0; i < _posts.length; i++) {
        print('$i: ${_posts[i]}');
      }
    }
  }

  Future<void> savePosts() async {
    final file = File('posts.json');
    final jsonPosts = jsonEncode(_posts
        .map((post) => {
              'title': post.title,
              'content': post.content,
            })
        .toList());
    await file.writeAsString(jsonPosts);
    print('Posts saved.');
  }

  Future<void> loadTasks() async {
    final file = File('posts.json');
    if (await file.exists()) {
      final contents = await file.readAsString();
      final List<dynamic> jsonPosts = jsonDecode(contents);
      _posts = jsonPosts
          .map((jsonPost) => Post(jsonPost['title'], jsonPost['content']))
          .toList();
      print('Posts loaded.');
    } else {
      print('No saved posts found.');
    }
  }
}
