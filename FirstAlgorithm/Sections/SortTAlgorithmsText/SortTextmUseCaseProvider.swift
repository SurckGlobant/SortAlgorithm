//
//  SortTextmUseCaseProvider.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 27/02/24.
//

//MARK: - SortTextmUseCaseProvider - class
class SortTextmUseCaseProvider{
  lazy var sortText: SortTextUseCaseProtocol = {
    return SortTextUseCase()
  }()
  
  func provide() -> SortAlgorithmViewModel.UseCases{
    let useCases = SortAlgorithmViewModel.UseCases(sortText: sortText)
    return useCases
  }
}
