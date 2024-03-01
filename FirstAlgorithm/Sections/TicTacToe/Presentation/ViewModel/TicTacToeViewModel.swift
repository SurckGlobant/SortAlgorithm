//
//  TicTacToeViewModel.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 29/02/24.
//

import Combine

//MARK: - TicTacToeViewModel - class

final class TicTacToeViewModel: TicTacToeViewModelProtocol{
  
  //MARK: - Variables
  let useCases: UseCases
  private var subscriptions = Set<AnyCancellable>()
  let ticTacToeReviewSubject = PassthroughSubject<Result<String, ConversionError>, Never>()

  //MARK: - Init class
  init(useCases: UseCases) {
    self.useCases = useCases
  }
  
  //MARK: - UseCases
  func ticTacToeReview(text: String) {
    self.useCases.ticTacToeReview.execute(text: text)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .finished: 
          break
        case .failure(let error):
          self.ticTacToeReviewSubject.send(.failure(error))
        }
      }, receiveValue: { result in
        self.ticTacToeReviewSubject.send(.success(result))
      })
      .store(in: &subscriptions)
  }
}

extension TicTacToeViewModel {
  struct UseCases {
    let ticTacToeReview:TicTacToeUseCaseProtocol
  }
}
