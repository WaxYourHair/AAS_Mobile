import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TicTacToeScreen(),
    );
  }
}

class TicTacToeScreen extends StatefulWidget {
  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  late List<List<String>> board;
  late String currentPlayer;
  late bool gameEnded;
  late String winner;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    board = List.generate(3, (_) => List.generate(3, (_) => ''));
    currentPlayer = 'X';
    gameEnded = false;
    winner = '';
  }

  void _makeMove(int row, int col) {
    if (board[row][col] == '' && !gameEnded) {
      setState(() {
        board[row][col] = currentPlayer;
        if (_checkWinner(row, col)) {
          gameEnded = true;
          winner = currentPlayer;
        } else if (_isBoardFull()) {
          gameEnded = true;
          winner = 'Draw';
        } else {
          currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
        }
      });
    }
  }

  bool _checkWinner(int row, int col) {
    // Check row
    if (board[row].every((cell) => cell == currentPlayer)) {
      return true;
    }
    // Check column
    if (board.every((row) => row[col] == currentPlayer)) {
      return true;
    }
    // Check diagonals
    if (row == col && board.every((row) => row[board.indexOf(row)] == currentPlayer)) {
      return true;
    }
    if (row + col == 2 && board.every((row) => row[2 - board.indexOf(row)] == currentPlayer)) {
      return true;
    }
    return false;
  }

  bool _isBoardFull() {
    return board.every((row) => row.every((cell) => cell != ''));
  }

  void _resetGame() {
    setState(() {
      _initializeGame();
    });
  }

  Widget _buildBoard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (col) {
            return GestureDetector(
              onTap: () => _makeMove(row, col),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    board[row][col],
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBoard(),
            if (gameEnded)
              Column(
                children: [
                  Text(
                    winner == 'Draw' ? 'It\'s a Draw!' : '$winner Wins!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _resetGame,
                    child: Text('Play Again'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
