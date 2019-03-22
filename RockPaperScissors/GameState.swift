//
//  GameState.swift
//  RockPaperScissors
//
//  Created by Steven Phan on 2019-03-20.
//  Copyright © 2019 Steven Phan. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    func returnMessage() -> String {
        switch self {
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You won!"
        case .lose:
            return "You lose."
        case .draw:
            return "It's a draw."
        }
    }
    
    
    func scoreGameState() -> [Int] {
    // Index 0 is User score and index 1 is computer score
        switch self {
        case .start, .draw:
            return [0, 0]
        case .win:
            return [1, 0]
        case .lose:
            return [0, 1]
        }
    }
}

