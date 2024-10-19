class Post {
  String title;
  String content;

  Post(this.title, this.content);

  void changeContent(String content) {
    this.content = content;
  }

  @override
  String toString() {
    return 'name: ${this.title}, content: ${this.content}';
  }
}
