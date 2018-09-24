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
    var totalWins = 0
    var totalLosses = 0
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
    }
    
    func newRound() {
        
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
        
    }
    
    func updateUI() {
        
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
    }
    
    
}

