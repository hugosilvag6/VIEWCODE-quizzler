//
//  HomeView.swift
//  quizzler-viewCode
//
//  Created by Hugo Silva on 18/11/22.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
   func answerButtonPressed(_ answer: String?)
}

class HomeView: UIView {
   
   var delegate: HomeViewProtocol?
   
   lazy var bubbleImageView: UIImageView = {
      let img = UIImageView()
      img.translatesAutoresizingMaskIntoConstraints = false
      img.image = UIImage(named: "Background-Bubbles")
      img.contentMode = .scaleAspectFill
      return img
   }()
   
   lazy var questionLabel: UILabel = {
      let lb = UILabel()
      lb.translatesAutoresizingMaskIntoConstraints = false
      lb.text = "Question 1"
      lb.textColor = .white
      lb.numberOfLines = 0
      lb.font = .systemFont(ofSize: 20, weight: .bold)
      return lb
   }()
   
   lazy var firstButton: UIButton = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.setTitle("True", for: .normal)
      bt.titleLabel?.font = .systemFont(ofSize: 20)
      bt.setTitleColor(.white, for: .normal)
      bt.clipsToBounds = true
      bt.layer.cornerRadius = 10
      bt.layer.borderWidth = 2
      bt.layer.borderColor = UIColor.white.cgColor
      bt.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
      return bt
   }()
   
   lazy var secondButton: UIButton = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.setTitle("False", for: .normal)
      bt.titleLabel?.font = .systemFont(ofSize: 20)
      bt.setTitleColor(.white, for: .normal)
      bt.clipsToBounds = true
      bt.layer.cornerRadius = 10
      bt.layer.borderWidth = 2
      bt.layer.borderColor = UIColor.white.cgColor
      bt.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
      return bt
   }()
   
   lazy var thirdButton: UIButton = {
      let bt = UIButton()
      bt.translatesAutoresizingMaskIntoConstraints = false
      bt.setTitle("False", for: .normal)
      bt.titleLabel?.font = .systemFont(ofSize: 20)
      bt.setTitleColor(.white, for: .normal)
      bt.clipsToBounds = true
      bt.layer.cornerRadius = 10
      bt.layer.borderWidth = 2
      bt.layer.borderColor = UIColor.white.cgColor
      bt.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
      return bt
   }()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.setBackground()
      self.setSubviews()
      self.setConstraints()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

extension HomeView {
   @objc private func answerButtonPressed (sender: UIButton) {
      delegate?.answerButtonPressed(sender.titleLabel?.text)
   }
}

extension HomeView {
   private func setBackground () {
      self.backgroundColor = UIColor(named: "ThemeBlue")
   }
   private func setSubviews () {
      self.addSubview(bubbleImageView)
      self.addSubview(firstButton)
      self.addSubview(secondButton)
      self.addSubview(thirdButton)
      self.addSubview(questionLabel)
   }
   private func setConstraints () {
      NSLayoutConstraint.activate([
         self.bubbleImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         self.bubbleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         self.bubbleImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         
         self.questionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         self.questionLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
         self.questionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
         self.questionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
         
         self.firstButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40),
         self.firstButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
         self.firstButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
         self.firstButton.heightAnchor.constraint(equalToConstant: 60),
         
         self.secondButton.bottomAnchor.constraint(equalTo: self.firstButton.topAnchor, constant: -20),
         self.secondButton.leadingAnchor.constraint(equalTo: self.firstButton.leadingAnchor),
         self.secondButton.trailingAnchor.constraint(equalTo: self.firstButton.trailingAnchor),
         self.secondButton.heightAnchor.constraint(equalTo: self.firstButton.heightAnchor),
         
         self.thirdButton.bottomAnchor.constraint(equalTo: self.secondButton.topAnchor, constant: -20),
         self.thirdButton.leadingAnchor.constraint(equalTo: self.firstButton.leadingAnchor),
         self.thirdButton.trailingAnchor.constraint(equalTo: self.firstButton.trailingAnchor),
         self.thirdButton.heightAnchor.constraint(equalTo: self.firstButton.heightAnchor)
      ])
   }
}
