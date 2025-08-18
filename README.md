# ⚽ Mini Football (Solidity)      
        
A simple yet fun **1v1 on-chain mini football game** written in Solidity. Two players compete to score **3 goals first** by passing, dribbling, and shooting — all verifiable on the Ethereum blockchain.  
        
No tokens. No bets. Just pure strategy and randomness.         
Built for fun, transparency, and Web3 experiments.       
      
---  
       
## 🎮 Gameplay    
   
- 🧍 Two players can join a match.     
- ⚽ Player 1 starts with the ball.       
- 🔁 Turns alternate between players.       
- 🛠️ Actions per turn:     
  - `passBall()` – Pass the ball to your opponent.
  - `dribble()` – Maintain ball possession.     
  - `shoot()` – Try to score! (50% chance)    
- 🎯 First to **3 goals** wins the match. 
  
--- 

## 📦 Contract Info    

- Language: `Solidity ^0.8.24` 
- No external dependencies 
- Gas-optimized for basic play  
- Tested on Remix / local Ethereum VM 

---

## 🧪 How to Play (Remix)

1. Go to [Remix IDE](https://remix.ethereum.org/)
2. Paste the code from `MiniFootball.sol`
3. Compile the contract with **Solidity 0.8.24**
4. Deploy the contract
5. Open 2 accounts in Remix (players)
6. First player: call `joinGame()`
7. Second player: call `joinGame()`
8. Let the match begin 🎉

---

## 🔐 Notes

- ⚠️ Uses pseudo-randomness (for demo only)
- ⛔ Not suitable for real funds or betting
- 🧪 Fully transparent — inspect all actions on-chain

---

## 🚀 Ideas for the Future

- ⏱ Turn timers and auto-forfeits
- 🏆 NFT trophies for winners
- 🎨 Frontend UI with wallet support
- 🤖 Telegram bot integration
- 🤝 2v2 team mode

---

## 📄 License

MIT License — free to use, build on, or fork.

---

