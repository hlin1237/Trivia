//
//  ViewController.swift
//  Trivia
//
//  Created by Huimin Lin on 3/12/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionCounterLabel: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    var currentQuestionIndex = 0
    

    var score = 0
    var questions: [Question] = [
        Question(question: "What is the capital of France?",
                 answers: ["Paris", "London", "Berlin", "Madrid"],
                 correctAnswer: "Paris",
                 category: "Geography"),

        Question(question: "Which planet is known as the Red Planet?",
                 answers: ["Earth", "Mars", "Jupiter", "Saturn"],
                 correctAnswer: "Mars",
                 category: "Science"),

        Question(question: "What is 2 + 2?",
                 answers: ["3", "4", "5", "6"],
                 correctAnswer: "4",
                 category: "Math")
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartButton.isHidden = true
        restartButton.setTitle("Restart", for: .normal)

        displayQuestion()
    }
    func showFinalScore(){
        question.text = "Quiz Finished! Your score: \(score)/\(questions.count)"
        answer1.isHidden = true
        answer2.isHidden = true
        answer3.isHidden = true
        answer4.isHidden = true

        // Hide question counter and category
        questionCounterLabel.isHidden = true
        categoryLabel.isHidden = true

        // Show the restart button
        restartButton.isHidden = false
    }
    func displayQuestion() {
            let currentQuestion = questions[currentQuestionIndex]
            question.text = currentQuestion.question
            answer1.setTitle(currentQuestion.answers[0], for: .normal)
            answer2.setTitle(currentQuestion.answers[1], for: .normal)
            answer3.setTitle(currentQuestion.answers[2], for: .normal)
            answer4.setTitle(currentQuestion.answers[3], for: .normal)
            questionCounterLabel.text = "Question: \(currentQuestionIndex + 1)/\(questions.count)"

            // Update category label
            categoryLabel.text = "Category: \(currentQuestion.category)"

            // Ensure labels are visible
            questionCounterLabel.isHidden = false
            categoryLabel.isHidden = false
        }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func restartGame(_ sender: UIButton) {
        print("✅ Restart button was clicked!")  // Debugging check

        currentQuestionIndex = 0
        score = 0

        // Unhide answer buttons
        answer1.isHidden = false
        answer2.isHidden = false
        answer3.isHidden = false
        answer4.isHidden = false

        // Hide the restart button
        restartButton.isHidden = true

        displayQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let selectedAnswer = sender.currentTitle
            let correctAnswer = questions[currentQuestionIndex].correctAnswer

            if selectedAnswer == correctAnswer {
                print("Correct!")
                score += 1  // Increase score if correct
            } else {
                print( "Wrong!")
            }

            if currentQuestionIndex + 1 < questions.count {
                currentQuestionIndex += 1
                displayQuestion()
            } else {
                print("🏁 Quiz Finished - Calling showFinalScore()") // Debugging check
                showFinalScore()
            }
    }

}
