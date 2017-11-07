## Program Narrative
The object of a 3 Stones game is to score the most points by getting as many three stones of your color in a horizontal, vertical or diagonal line. 

Every turn you must play a stone in the same row or column as the last piece played. If there is no available space, you are allowed to play in any other slot available.

To begin, the client will establish a connection to the server by entering the ip address and the port number. This will let the server know that the player is ready to start a new game. The server will respond that they are also ready to begin. 

The player makes the first move and sends their row and column position to the server, which has an inner board that logs the position and type of each move. The server will know that it is their turn to place a piece on the board. This will loop until every slot is filled (30 moves).

When it is the AI's turn to make a move, the AI will look for all valid moves that will result in the highest possible points. Every time a piece is added to the board, the total score of each player is added up as well.

When the client receives the computer's move, it updates its own board and displays it to the player. At the end of the game, the winner is announced and the scores are shown. The client will ask if the player would like to play again, and if they do, a new game session will begin. Otherwise the session will end and the client will close the connection to the server. 