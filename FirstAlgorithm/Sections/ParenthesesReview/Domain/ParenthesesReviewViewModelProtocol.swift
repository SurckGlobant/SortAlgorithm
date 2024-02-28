//
//  ParenthesesReviewViewModelProtocol.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 28/02/24.
//

//MARK: - ParenthesesReviewViewModelProtocol - protocol
protocol ParenthesesReviewViewModelProtocol{
  func parenthesesReview(text: String) -> Bool
}

protocol ParenthesesReviewUseCaseProtocol {
  func execute(text: String) -> Bool
}
