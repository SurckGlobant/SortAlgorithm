//
//  ParenthesesReviewViewController.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 28/02/24.
//

import UIKit

//MARK: - AlgorithmViewController - class
final class ParenthesesReviewViewController: UIViewController {
  
  //MARK: - UI
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Parentheses review"
    label.textAlignment = .center
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let rulesLabel: UILabel = {
    let label = UILabel()
    label.text = "Given a string that may contain parentheses validate if it has all being and ending parentheses."
    label.textAlignment = .left
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let inputTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Enter the text to review"
    textField.borderStyle = .roundedRect
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  let reviewButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Review text", for: .normal)
    button.titleLabel?.textAlignment = .left
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let resultLabel: UILabel = {
    let label = UILabel()
    label.text = "Result: "
    label.textAlignment = .left
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  //MARK: - Variables
  var viewModel: ParenthesesReviewViewModelProtocol
  
  //MARK: - Init class
  init(viewModel: ParenthesesReviewViewModelProtocol) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
    self.setupUI()
    self.setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Lifecycle app
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  //MARK: - SetupUI methods
  private func setupUI() {
    view.backgroundColor = .systemBackground
    self.navigationController?.navigationBar.prefersLargeTitles = true
    
    view.addSubview(titleLabel)
    view.addSubview(rulesLabel)
    view.addSubview(inputTextField)
    view.addSubview(reviewButton)
    self.reviewButton.addTarget(self, action: #selector(reviewText), for: .touchUpInside)
    view.addSubview(resultLabel)
  }
  
  private func setConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
      rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      inputTextField.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 20),
      inputTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      inputTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      reviewButton.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 20),
      reviewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      reviewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      resultLabel.topAnchor.constraint(equalTo: reviewButton.bottomAnchor, constant: 20),
      resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
    ])
  }
  
  //MARK: - Actions
  @objc func reviewText() {
    let result:String = (self.viewModel.parenthesesReview(text: self.inputTextField.text ?? "")) ? "Valid" : "Invalid"
    resultLabel.text = result
  }
}

