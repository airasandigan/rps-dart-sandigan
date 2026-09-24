import 'dart:io';

/// List of valid moves a player can choose.
const List<String> lihokNi = ['rock', 'paper', 'scissors'];

/// Maps each move to the move it beats (key beats value).
const Map<String, String> pildiMap = {
  'rock': 'scissors',
  'paper': 'rock',
  'scissors': 'paper',
};

/// Asks the users names who wants to play.
String getPlayerNgalan(String defaultNgalan) {
  stdout.write('Enter $defaultNgalan name: ');
  String? input = stdin.readLineSync();
  String pangalan = input?.trim() ?? '';
  if (pangalan.isEmpty) {
    print('(No name entered. Using "$defaultNgalan".)');
    return defaultNgalan;
  }
  return pangalan;
}

/// Returns empty if move is not valid.
String? validateLihok(String? input) {
  String lihok = input?.trim().toLowerCase() ?? '';
  if (lihokNi.contains(lihok)) {
    return lihok;
  }
  return null;
}

/// Repeatly prompts the playerNgalan for a move until a valid one is entered.
String getLihok(String playerNgalan) {
  String? lihok;
  do {
    stdout.write('$playerNgalan, enter your move (rock/paper/scissors): ');
    String? input = stdin.readLineSync();
    lihok = validateLihok(input);
    if (lihok == null) {
      print('Invalid move. Please type rock, paper, or scissors.');
    }
  } while (lihok == null);
  return lihok;
}

/// Prints about 30 blank lines to the screen and;
/// hides player 1 moves before player 2 enters.
void tagoPlayerOneLihok() {
  for (int i = 0; i < 30; i++) {
    print('');
  }
}
