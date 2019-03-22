//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Steven Phan on 2019-03-20.
//  Copyright © 2019 Steven Phan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
// Outlets, variables and constants
    @IBOutlet weak var gameMessage: UILabel!
    @IBOutlet weak var opponentPicture: UILabel!
    @IBOutlet weak var userScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet var backGround: UIView!
    
    var userScore = Int()
    var opponentScore = Int()
    
// Functions that are used in this ViewController
    

    func updateGameState(user: Sign) {
    // Creates an opponent instance of a Sign enum (defined in Sign.swift) and compares it to the user choice. User can win, lose or draw with the opponent returning an instance of the GameState enum (defined in GameState.swift). Depending on the GameState, the message, opponent picture, score, view background color are updated.
        let opponentSign = randomSign()
        let newGameState = user.determineGameState(opponentSign)
        let pointsGained = newGameState.scoreGameState()

        gameMessage.text = newGameState.returnMessage()
        opponentPicture.text = opponentSign.emoji
        
        addPoints(pointsGained)
        updateScoreTable()
        
        updateBackgroundColor(currentState: newGameState)
    }
    

    func addPoints(_ newGameStatePoint: [Int]) {
    // Add points to the variables for scores defined above accordingly
        userScore += newGameStatePoint[0]
        opponentScore += newGameStatePoint[1]
    }
    

    func updateScoreTable() {
    // Updates the points labels in the app.
        userScoreLabel.text = "\(userScore)"
        opponentScoreLabel.text = "\(opponentScore)"
    }
    
 
    func resetGame() {
    // Returns users and opponents score to zero and returns objects to first state.
        gameMessage.text = GameState.start.returnMessage()
        opponentPicture.text = "🤖"
        userScore = 0
        opponentScore = 0
        updateBackgroundColor(currentState: .start)
        updateScoreTable()
    }
    

    func updateBackgroundColor(currentState: GameState) {
    // Updates the background color depending on the game state. Green for a win, red for a lose, gray for a draw and white when reset.
        switch currentState {
        case .win: backGround.backgroundColor = UIColor(red: 0.5, green: 1, blue: 0.5, alpha: 1)
        case .lose: backGround.backgroundColor = UIColor(red: 1, green: 0.5, blue: 0.5, alpha: 1)
        case .draw: backGround.backgroundColor = .gray
        case .start: backGround.backgroundColor = .white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
        updateScoreTable()
    }

    @IBAction func chooseRock(_ sender: Any) {
        let userSign = Sign.rock
        updateGameState(user: userSign)
    }
    
    @IBAction func chooseScissors(_ sender: Any) {
        let userSign = Sign.scissors
        updateGameState(user: userSign)
    }
    
    @IBAction func choosePaper(_ sender: Any) {
        let userSign = Sign.paper
        updateGameState(user: userSign)
    }
    
    @IBAction func pushPlayAgain(_ sender: Any) {
        resetGame()
    }
}

