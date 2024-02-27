//
//  File.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 27/02/24.
//

//MARK: - AlgorithmUseCaseProvider - class
class AlgorithmUseCaseProvider{
  lazy var sortText: SortTextUseCaseProtocol = {
    return SortTextUseCase()
  }()
  
  func provide() -> AlgorithmViewModel.UseCases{
    let useCases = AlgorithmViewModel.UseCases(sortText: sortText)
    return useCases
  }
}
