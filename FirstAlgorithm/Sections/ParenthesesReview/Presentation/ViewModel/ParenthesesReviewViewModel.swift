//
//  ParenthesesReviewViewModel.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 28/02/24.
//

//MARK: - ParenthesesReviewViewModel - class

final class ParenthesesReviewViewModel: ParenthesesReviewViewModelProtocol{
  
  //MARK: - Variables
  let useCases: UseCases
  
  //MARK: - Init class
  init(useCases: UseCases) {
    self.useCases = useCases
  }
  
  //MARK: - UseCases
  func parenthesesReview(text: String) -> Bool {
    return self.useCases.parenthesesReview.execute(text: text)
  }
}

extension ParenthesesReviewViewModel {
  struct UseCases {
    let parenthesesReview:ParenthesesReviewUseCaseProtocol
  }
}
