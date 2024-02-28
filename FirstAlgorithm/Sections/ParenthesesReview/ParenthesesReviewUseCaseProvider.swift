//
//  ParenthesesReviewUseCaseProvider.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 28/02/24.
//

//MARK: - ParenthesesReviewUseCaseProvider - class
class ParenthesesReviewUseCaseProvider{
  lazy var parenthesesReview: ParenthesesReviewUseCaseProtocol = {
    return ParenthesesReviewUseCase()
  }()
  
  func provide() -> ParenthesesReviewViewModel.UseCases{
    let useCases = ParenthesesReviewViewModel.UseCases(parenthesesReview: parenthesesReview)
    return useCases
  }
}
