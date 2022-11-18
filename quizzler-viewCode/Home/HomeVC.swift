//
//  HomeVC.swift
//  quizzler-viewCode
//
//  Created by Hugo Silva on 18/11/22.
//

import UIKit

class HomeVC: UIViewController {
   
   var screen = HomeView()
   var currentQuestion = 0
   var score = 0
   
   override func loadView() {
      self.view = self.screen
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      self.screen.delegate = self
      self.setQuestion()
   }
}

extension HomeVC: HomeViewProtocol {
   func answerButtonPressed(_ answer: String?) {
      if QuizData.questions[currentQuestion].correctAnswer == answer {
         score += 1
      }
      if currentQuestion < QuizData.questions.count - 1 {
         currentQuestion += 1
         setQuestion()
      } else {
         screen.questionLabel.text = "Congratulations!\n Score: \(score)"
         screen.secondButton.isHidden = true
         screen.thirdButton.isHidden = true
         screen.firstButton.setTitle("Restart", for: .normal)
         screen.firstButton.addTarget(self, action: #selector(restartGame), for: .touchUpInside)
      }
   }
   func setQuestion () {
      screen.questionLabel.text = QuizData.questions[currentQuestion].q
      screen.firstButton.setTitle(QuizData.questions[currentQuestion].a[0], for: .normal)
      screen.secondButton.setTitle(QuizData.questions[currentQuestion].a[1], for: .normal)
      if QuizData.questions[currentQuestion].a.count > 2 {
         screen.thirdButton.isHidden = false
         screen.thirdButton.setTitle(QuizData.questions[currentQuestion].a[2], for: .normal)
      } else {
         screen.thirdButton.isHidden = true
      }
   }
   @objc func restartGame () {
      self.currentQuestion = 0
      self.score = 0
      screen.firstButton.isHidden = false
      screen.secondButton.isHidden = false
      screen.thirdButton.isHidden = false
      self.setQuestion()
   }
}
