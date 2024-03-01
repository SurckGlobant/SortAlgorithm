//
//  TicTacToeViewController.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 29/02/24.
//

import UIKit
import Combine

//MARK: - TicTacToeViewController - class
final class TicTacToeViewController: UIViewController {
  
  //MARK: - UI
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Tic-Tac-Toe"
    label.textAlignment = .center
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let rulesLabel: UILabel = {
    let label = UILabel()
    label.text = "This algorithm checks whether in the game \"Tic-tac-toe\" a player won, tied, or if the game is still in progress.\n\nThe entry format will be through an array like the following:\n[[0,0],[2,0],[1,1],[2,1],[2,2]] -> Player A won.\n\nTaking a 3 x 3 matrix as the board, the first position of the array will be the move of player A, the second position of the array will be the move of player B, and so on."
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
    label.text = ""
    label.textAlignment = .left
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  //MARK: - Variables
  var viewModel: TicTacToeViewModelProtocol
  private var cancellables = Set<AnyCancellable>()

  //MARK: - Init class
  init(viewModel: TicTacToeViewModelProtocol) {
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
    viewModel.ticTacToeReviewSubject
      .sink(receiveValue: { [weak self] result in
        guard let self = self else { return }
        switch result {
        case .success(let result):
          self.resultLabel.text = result
        case .failure(let error):
          switch error {
          case .incorrectFormat:
            self.resultLabel.text = ("The format is incorrect")
          case .extraElements:
            self.resultLabel.text = ("There are more than 9 plays")
          case .invalidCoordinate:
            self.resultLabel.text = ("The plays are incorrect")
          case .occupiedSquare:
            self.resultLabel.text = ("The plays are incorrect")
          case .errorEmpty:
            self.resultLabel.text = ("The format is incorrect, there are no plays")
          }
        }
      })
      .store(in: &cancellables)
    
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
    //self.viewModel.ticTacToeReview(text: self.inputTextField.text ?? "")
    viewModel.ticTacToeReview(text: self.inputTextField.text ?? "")
  }
}


