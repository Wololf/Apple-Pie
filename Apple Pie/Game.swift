//
//  Game.swift
//  Apple Pie
//
//  Created by Student on 1/11/18.
//  Copyright © 2018 Maggie Cromwell. All rights reserved.
//

import Foundation

struct Game{
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    //defines variables
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.characters.contains(letter){
            incorrectMovesRemaining -= 1
        }
    }

    var formattedWord:String {
        var guessedWord = ""
        for letter in word.characters {
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            }else{
                guessedWord += "-"
            }
        }
        return guessedWord
}
}//if guessed word is right, return it, if not, set it to dashes
