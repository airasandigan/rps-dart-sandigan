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

/// Decides the winner using an if-else.
String? decideDaog(
  String lihokA,
  String lihokB,
  String ngalanA,
  String ngalanB,
) {
  String? daog;
  if (lihokA == lihokB) {
    daog = null;
  } else if (pildiMap[lihokA] == lihokB) {
    daog = ngalanA;
  } else {
    daog = ngalanB;
  }
  return daog;
}

/// Prints the final score for both players
void pakitaFinalResult(String ngalanA, String ngalanB, int scoreA, int scoreB) {
  print('\n===== FINAL SCORE =====');
  print('$ngalanA: $scoreA | $ngalanB: $scoreB');

  int kumpara = scoreA.compareTo(scoreB);
  switch (kumpara) {
    case > 0:
      print('Overall winner: $ngalanA');
      break;
    case < 0:
      print('Overall winner: $ngalanB');
      break;
    default:
      print("Overall winner: It's a draw!");
  }
}

void main() {
  print('===== ROCK, PAPER, SCISSORS =====\n');

  String playerOneNgalan = getPlayerNgalan('Player 1');
  String playerTwoNgalan = getPlayerNgalan('Player 2');

  int playerOneScore = 0;
  int playerTwoScore = 0;
  int round = 1;
  String? playAgain;

  do {
    print('\n--- Round $round ---');

    String lihokOne = getLihok(playerOneNgalan);
    tagoPlayerOneLihok();
    String lihokTwo = getLihok(playerTwoNgalan);

    print(
      '\n$playerOneNgalan chose $lihokOne. $playerTwoNgalan chose $lihokTwo.',
    );

    String? daog = decideDaog(
      lihokOne,
      lihokTwo,
      playerOneNgalan,
      playerTwoNgalan,
    );

    print('Result: ${daog != null ? '$daog wins the round!' : "It's a draw!"}');

    if (daog == playerOneNgalan) {
      playerOneScore++;
    } else if (daog == playerTwoNgalan) {
      playerTwoScore++;
    }

    print(
      'Score -> $playerOneNgalan: $playerOneScore | $playerTwoNgalan: $playerTwoScore',
    );

    stdout.write('Play again? (y/n): ');
    String? input = stdin.readLineSync();
    playAgain = input?.trim().toLowerCase() ?? 'n';
    round++;
  } while (playAgain != 'n');

  pakitaFinalResult(
    playerOneNgalan,
    playerTwoNgalan,
    playerOneScore,
    playerTwoScore,
  );
}
