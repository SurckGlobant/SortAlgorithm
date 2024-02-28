//
//  File.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 28/02/24.
//

import Foundation
import UIKit

//MARK: - PageViewModel - class
class PageViewModel: PageViewModelProtocol{
  
  //MARK: - Variables
  let viewControllers: [UIViewController]
  
  //MARK: - Init
  init() {
  viewControllers = [AlgorithmFactory().algorithmViewController(),
                       AlgorithmFactory().parenthesesReviewController() ]
  }
  
  //MARK: - Methods
  func numberOfPages() -> Int {
    return viewControllers.count
  }
  
  func viewController(at index: Int) -> UIViewController? {
    guard index >= 0 && index < viewControllers.count else {
      return nil
    }
    return viewControllers[index]
  }
}
