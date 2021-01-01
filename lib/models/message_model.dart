import 'user_model.dart';

class Message {
  final User sender;
  final int time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User currentUser =
    User(id: 0, name: 'Current User', imageUrl: 'assets/images/greg.jpg');

// USERS
final User greg = User(id: 1, name: 'Greg', imageUrl: 'assets/images/greg.jpg');
final User james =
    User(id: 2, name: 'James', imageUrl: 'assets/images/james.jpg');
final User john = User(id: 3, name: 'John', imageUrl: 'assets/images/john.jpg');
final User olivia =
    User(id: 4, name: 'Olivia', imageUrl: 'assets/images/olivia.jpg');
final User sam = User(id: 5, name: 'Sam', imageUrl: 'assets/images/sam.jpg');
final User sophia =
    User(id: 6, name: 'Sophia', imageUrl: 'assets/images/sophia.jpg');
final User steven =
    User(id: 7, name: 'Steven', imageUrl: 'assets/images/steven.jpg');

// FAVORITE CONTACTS
List<User> favorites = [sam, steven, olivia, john, greg];

int now = DateTime.now().millisecondsSinceEpoch;
// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: james,
    time: now - 1000,
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: olivia,
    time: now - 20000,
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: john,
    time: now - 30000,
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sophia,
    time: now - 40000,
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: steven,
    time: now - 50000,
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: sam,
    time: now - 500000,
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: greg,
    time: now - 7800000,
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: james,
    time: now - 500000,
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: now - 500000,
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: now - 500000,
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: now - 500000,
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: now - 500000,
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: james,
    time: now - 500000,
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];
