//
//  ViewController.swift
//  Apple Pie
//
//  Created by Student on 1/3/18.
//  Copyright © 2018 Maggie Cromwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["food", "cat", "running", "washington", "marker", "mouse", "buccaneer"]
    //define words to guess
    let incorrectMovesAllowed = 7
    //defines amount of incorrect moves allowed
    var totalWins = 0{    //defines totalWins variable
        didSet{
            newRound()
        }
    }
    var totalLoses = 0 {    //defines total loses variable
        didSet {
            newRound()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound() }
        // Do any additional setup after loading the view, typically from a nib.
    var currentGame: Game!
    
    func newRound(){
        if !listOfWords.isEmpty{
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord,
       incorrectMovesRemaining: incorrectMovesAllowed,
       guessedLetters: [])
        enableLetterButtons(true)
        updateUI()
        }else{
        enableLetterButtons(false)
        }
    }
     // if new round starts, start new game,enable buttons, if not do not enable buttons
    
    func enableLetterButtons(_ enable: Bool){
        for button in leterButtons {
            button.isEnabled = enable
        }
    }
    //enable letter buttons func, to be called up later

    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formattedWord.characters{
            letters.append(String(letter))
        }
        //letters is formattedWord but in a string

        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        //gives dashes so they don't look like a line
        scoreLabel.text = "wins: \(totalWins), Losses: \(totalLoses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }        //change labels + tree image


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var leterButtons: [UIButton]!
    //outlets for objects

    @IBAction func buttonPressed(_ sender: UIButton) {
    sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }   //when button is pressed disable button and if it's in the word then add it

    
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0{
            totalLoses += 1
                
            }else if currentGame.word == currentGame.formattedWord{
                totalWins += 1
        }else{
            updateUI()
        }
    }
    
    // update game state, adds wins/losses
}

