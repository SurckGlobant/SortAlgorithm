//
//  SortAlgorithmViewModel.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 27/02/24.
//

//MARK: - SortAlgorithmViewModel - class

final class SortAlgorithmViewModel: SortAlgorithmViewModelProtocol{
  
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

extension SortAlgorithmViewModel {
  struct UseCases {
    let sortText:SortTextUseCaseProtocol
  }
}

