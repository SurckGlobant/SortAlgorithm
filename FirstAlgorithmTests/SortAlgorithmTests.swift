//
//  SortAlgorithmTests.swift
//  FirstAlgorithmTests
//
//  Created by David Bautista on 27/02/24.
//

import XCTest
@testable import FirstAlgorithm

final class SortAlgorithmTests: XCTestCase {
  
  private var sut: SortAlgorithmViewModel!
  private var sortTextUseCase: SortTextUseCase!
  
  override func setUp() {
    sortTextUseCase = SortTextUseCase()
    sut = SortAlgorithmViewModel(useCases: SortAlgorithmViewModel.UseCases(sortText: sortTextUseCase))
  }

  override func tearDown() {
    sortTextUseCase = nil
    sut = nil
  }
  
  func testSortMethod(){
    XCTAssertEqual("aceghjlnpqsuwyBDFIKMORTVXZ13590246®", sut.sortText(text: "aB4cD3eFg5®hIjKl2Mn1OpqR6sT9uVwX0yZ"))
    XCTAssertEqual("abeCD4®", sut.sortText(text: "®DbeCa4"))
    XCTAssertEqual("jjnW7024==", sut.sortText(text: "4jn70Wj==2"))
    XCTAssertEqual("acgimnorruçîAIPR1÷ąřūʻ@", sut.sortText(text: "P@rAngar1cu÷iRImîçūąřoʻ"))
  }
}
