//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!

    let quiz: Array<Question> = [
        Question(
            title: "A slug's blood is green.",
            answer: true
        ),
        Question(
            title: "Approximately one quarter of human bones are in the feet.",
            answer: true
        ),
        Question(
            title: "The total surface area of two human lungs is approximately 70 square metres.",
            answer: true
        ),
        Question(
            title: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.",
            answer: true
        ),
        Question(
            title: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.",
            answer: false
        ),
        Question(
            title: "It is illegal to pee in the Ocean in Portugal.",
            answer: true
        ),
        Question(
            title: "You can lead a cow down stairs but not up stairs.",
            answer: false
        ),
        Question(
            title: "Google was originally called 'Backrub'.",
            answer: true
        ),
        Question(
            title: "Buzz Aldrin's mother's maiden name was 'Moon'.",
            answer: true
        ),
        Question(
            title: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.",
            answer: false
        ),
        Question(
            title: "No piece of square dry paper can be folded in half more than 7 times.",
            answer: false
        ),
        Question(
            title: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.",
            answer: true
        )
    ]
    var currentQuestion: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer: String = sender.currentTitle!
        let correctAnswer: String = String(quiz[currentQuestion].answer).capitalized

        if (userAnswer == correctAnswer) {
            sender.backgroundColor = UIColor.green
            print("Você Acertou!")
        } else {
            sender.backgroundColor = UIColor.red
            print("Você Errou!")
        }

        if (currentQuestion + 1 < quiz.count) {
            currentQuestion += 1
        } else {
            currentQuestion = 0
        }
        
        Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(updateUI),
            userInfo: nil,
            repeats: false
        )
    }
    
    @objc func updateUI() {
        questionLabel.text = quiz[currentQuestion].title
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(currentQuestion + 1) / Float(quiz.count)
    }
    
}

