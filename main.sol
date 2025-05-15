// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MiniFootball {
    address public player1;
    address public player2;
    address public ballOwner;
    bool public gameStarted;
    bool public gameEnded;

    uint8 public goalsPlayer1;
    uint8 public goalsPlayer2;

    uint8 public constant GOALS_TO_WIN = 3;

    event GameStarted(address player1, address player2);
    event BallPassed(address from, address to);
    event Dribbled(address player);
    event Shot(address player, bool goal);
    event GameEnded(address winner);

    modifier onlyPlayers() {
        require(msg.sender == player1 || msg.sender == player2, "Not a player");
        _;
    }

    modifier onlyBallOwner() {
        require(msg.sender == ballOwner, "You don't have the ball");
        _;
    }

    modifier gameInProgress() {
        require(gameStarted && !gameEnded, "Game not active");
        _;
    }

    function joinGame() external {
        require(!gameStarted, "Game already started");
        if (player1 == address(0)) {
            player1 = msg.sender;
        } else if (player2 == address(0)) {
            require(msg.sender != player1, "Player1 already joined");
            player2 = msg.sender;
            gameStarted = true;
            ballOwner = player1; // player1 starts with ball
            emit GameStarted(player1, player2);
        }
    }

    function passBall() external onlyPlayers onlyBallOwner gameInProgress {
        ballOwner = msg.sender == player1 ? player2 : player1;
        emit BallPassed(msg.sender, ballOwner);
    }

    function dribble() external onlyPlayers onlyBallOwner gameInProgress {
        emit Dribbled(msg.sender);
    }

    function shoot() external onlyPlayers onlyBallOwner gameInProgress {
        // Pseudo-randomness using block data
        uint rand = uint(keccak256(abi.encodePacked(block.timestamp, blockhash(block.number - 1), msg.sender))) % 100;

        bool goal = rand < 50; // 50% chance

        if (goal) {
            if (msg.sender == player1) {
                goalsPlayer1++;
            } else {
                goalsPlayer2++;
            }

            if (goalsPlayer1 >= GOALS_TO_WIN || goalsPlayer2 >= GOALS_TO_WIN) {
                gameEnded = true;
                emit Shot(msg.sender, true);
                emit GameEnded(msg.sender);
                return;
            }
        }

        // Ball goes to the other player whether goal or miss
        ballOwner = msg.sender == player1 ? player2 : player1;
        emit Shot(msg.sender, goal);
    }

    function getScore() external view returns (uint8, uint8) {
        return (goalsPlayer1, goalsPlayer2);
    }

    function getBallOwner() external view returns (address) {
        return ballOwner;
    }
}
