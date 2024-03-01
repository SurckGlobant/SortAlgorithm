//
//  TicTacToeUseCaseProvider.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 29/02/24.
//

//MARK: - TicTacToeUseCaseProvider - class
class TicTacToeUseCaseProvider{
  lazy var ticTacToe: TicTacToeUseCaseProtocol = {
    return TicTacToeUseCase()
  }()
  
  func provide() -> TicTacToeViewModel.UseCases{
    let useCases = TicTacToeViewModel.UseCases(ticTacToeReview: ticTacToe)
    return useCases
  }
}
