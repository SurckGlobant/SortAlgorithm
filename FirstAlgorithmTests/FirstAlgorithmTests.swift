//
//  FirstAlgorithmTests.swift
//  FirstAlgorithmTests
//
//  Created by David Bautista on 27/02/24.
//

import XCTest
@testable import FirstAlgorithm

final class FirstAlgorithmTests: XCTestCase {
  
  private var sut: AlgorithmViewModel!
  private var sortTextUseCase: SortTextUseCase!
  
  override func setUp() {
    sortTextUseCase = SortTextUseCase()
    sut = AlgorithmViewModel(useCases: AlgorithmViewModel.UseCases(sortText: sortTextUseCase))
  }

  override func tearDown() {
    sortTextUseCase = nil
    sut = nil
  }
  
  func testSortMethod(){
    XCTAssertEqual("aceghjlnpqsuwyBDFIKMORTVXZ13590246®", sut.sortText(text: "aB4cD3eFg5®hIjKl2Mn1OpqR6sT9uVwX0yZ"))
    XCTAssertEqual("abeCD4®", sut.sortText(text: "®DbeCa4"))
    XCTAssertEqual("jjnW7024==", sut.sortText(text: "4jn70Wj==2"))
  }
}
