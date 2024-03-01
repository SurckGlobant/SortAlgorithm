//
//  TicTacToeViewModelProtocol.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 29/02/24.
//

import Combine

//MARK: - TicTacToeViewModelProtocol - protocol
protocol TicTacToeViewModelProtocol{
  var ticTacToeReviewSubject: PassthroughSubject<Result<String, ConversionError>, Never> { get }
  func ticTacToeReview(text: String)
}

protocol TicTacToeUseCaseProtocol {
  func execute(text: String) -> AnyPublisher<String, ConversionError>
}
