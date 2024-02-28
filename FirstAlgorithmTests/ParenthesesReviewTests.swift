//
//  ParenthesesReviewTests.swift
//  FirstAlgorithmTests
//
//  Created by David Bautista on 28/02/24.
//

import XCTest
@testable import FirstAlgorithm

final class ParenthesesReviewTests: XCTestCase {
  
  private var sut: ParenthesesReviewViewModel!
  private var parenthesesReviewUseCase: ParenthesesReviewUseCase!
  
  override func setUp() {
    parenthesesReviewUseCase = ParenthesesReviewUseCase()
    sut = ParenthesesReviewViewModel(useCases: ParenthesesReviewViewModel.UseCases(parenthesesReview: parenthesesReviewUseCase))
  }

  override func tearDown() {
    parenthesesReviewUseCase = nil
    sut = nil
  }
  
  func testParenthesesReviewMethod(){
    XCTAssertTrue(sut.parenthesesReview(text: "(.)(.)"))
    XCTAssertTrue(sut.parenthesesReview(text: "()()"))
    XCTAssertTrue(sut.parenthesesReview(text: "((3434)((433)))"))
    XCTAssertFalse(sut.parenthesesReview(text: "(((())"))
  }
}
