//
//  SortAlgorithmViewModelProtocol.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 27/02/24.
//

//MARK: - SortAlgorithmViewModelProtocol - protocol
protocol SortAlgorithmViewModelProtocol{
  func sortText(text: String) -> String
}

protocol SortTextUseCaseProtocol {
  func execute(text: String) -> String
}
