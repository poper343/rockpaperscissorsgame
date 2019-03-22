//
//  Sign.swift
//  RockPaperScissors
//
//  Created by Steven Phan on 2019-03-20.
//  Copyright © 2019 Steven Phan. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
// Generates a random Int from 0 to 2 and uses that number to initialize an instance of Sign.
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock: return "✊"
        case .paper: return "✋"
        case .scissors: return "✌️"
        }
    }
    
    func determineGameState(_ opponent: Sign) -> GameState {
    // Possible outcomes for the Rock, paper scissors game.
        switch self {
        case .rock:
            switch opponent {
            case .rock:
                return GameState.draw
            case .scissors:
                return GameState.win
            case .paper:
                return GameState.lose
            }
        case .paper:
            switch opponent {
            case .rock:
                return GameState.win
            case .scissors:
                return GameState.lose
            case .paper:
                return GameState.draw
            }
        case .scissors:
            switch opponent {
            case .rock:
                return GameState.lose
            case .scissors:
                return GameState.draw
            case .paper:
                return GameState.win
            }
        }
    }
}
