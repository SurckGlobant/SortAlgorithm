//
//  AlgorithmViewModel.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 27/02/24.
//

//MARK: - AlgorithmViewModel - class

final class AlgorithmViewModel: AlgorithmViewModelProtocol{
  
  //MARK: - Variables
  let useCases: UseCases
  
  //MARK: - Init class
  init(useCases: UseCases) {
    self.useCases = useCases
  }
  
  //MARK: - UseCases
  func sortText(text: String) -> String {
    return useCases.sortText.execute(text: text)
  }
}

extension AlgorithmViewModel {
  struct UseCases {
    let sortText:SortTextUseCaseProtocol
  }
}

