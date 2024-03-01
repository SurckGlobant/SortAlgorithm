//
//  TicTacToeTests.swift
//  FirstAlgorithmTests
//
//  Created by David Bautista on 29/02/24.
//

import XCTest
import Combine
@testable import FirstAlgorithm

final class TicTacToeTests: XCTestCase {
  
  private var sut: TicTacToeViewModel!
  private var ticTacToeUseCase: TicTacToeUseCase!
  
  override func setUp() {
    ticTacToeUseCase = TicTacToeUseCase()
    sut = TicTacToeViewModel(useCases: TicTacToeViewModel.UseCases(ticTacToeReview: ticTacToeUseCase))
  }
  
  override func tearDown() {
    ticTacToeUseCase = nil
    sut = nil
  }
  
  
}
