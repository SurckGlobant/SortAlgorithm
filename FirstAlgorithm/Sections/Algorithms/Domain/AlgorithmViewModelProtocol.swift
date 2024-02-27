//
//  AlgorithmViewModelProtocol.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 27/02/24.
//

//MARK: - AlgorithmViewModelProtocol - protocol
protocol AlgorithmViewModelProtocol{
  func sortText(text: String) -> String
}

protocol SortTextUseCaseProtocol {
  func execute(text: String) -> String
}
