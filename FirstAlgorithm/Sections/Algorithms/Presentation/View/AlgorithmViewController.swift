//
//  AlgorithmViewController.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 27/02/24.
//

import UIKit

//MARK: - AlgorithmViewController - class
final class AlgorithmViewController: UIViewController {
  
  //MARK: - UI
  let rulesLabel: UILabel = {
    let label = UILabel()
    label.text = "Rules\n\n- Numbers go after Letters\n- Uppercase letters go after Lowercase\n- Odd numbers go before Even numbers\n- Any character that is not a letter or number should go after the letters and numbers"
    label.textAlignment = .left
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let inputTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Enter the text to sort"
    textField.borderStyle = .roundedRect
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  let sortButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Sort text", for: .normal)
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
  var viewModel: AlgorithmViewModelProtocol
  
  //MARK: - Init class
  init(viewModel: AlgorithmViewModelProtocol) {
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
    title = "Sorting algorithm"
    view.backgroundColor = .systemBackground
    self.navigationController?.navigationBar.prefersLargeTitles = true
    
    view.addSubview(rulesLabel)
    view.addSubview(inputTextField)
    view.addSubview(sortButton)
    self.sortButton.addTarget(self, action: #selector(sortText), for: .touchUpInside)
    view.addSubview(resultLabel)
  }
  
  private func setConstraints() {
    NSLayoutConstraint.activate([
      rulesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      inputTextField.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 20),
      inputTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      inputTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      sortButton.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 20),
      sortButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      sortButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      
      resultLabel.topAnchor.constraint(equalTo: sortButton.bottomAnchor, constant: 20),
      resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
    ])
  }
  
  //MARK: - Actions
  @objc func sortText() {
    let result = self.viewModel.sortText(text: self.inputTextField.text ?? "")
    resultLabel.text = "Result:\n \(result)"
  }
}
