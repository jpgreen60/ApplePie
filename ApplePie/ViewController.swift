//
//  ViewController.swift
//  ApplePie
//
//  Created by John Green on -09-232018.
//  Copyright © 2018 John P. Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords = ["receiver", "tv", "speakers", "bluray", "playstation", "appletv", "roku", "wii", "fibereceiver"]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var currentGame: Game!
    
    
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
        
    }
    
    func newRound() {
        
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        }
        
        else {
            enableLetterButtons(false)
        }
        
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    
    
    
    func updateGameState() {
        
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        }
        
        else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        }
        
        else {
            updateUI()
        }
        
    }
    
    func updateUI() {
        
        var letters = [String]()
        for letter in currentGame.formattedWord.characters {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
    }
    
}

