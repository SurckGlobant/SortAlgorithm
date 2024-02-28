//
//  PageViewModelProtocol.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 28/02/24.
//

import UIKit

//MARK: - PageViewModelProtocol - protocol

protocol PageViewModelProtocol{
  var viewControllers: [UIViewController] { get }
  
  func numberOfPages() -> Int
  func viewController(at index: Int) -> UIViewController?
}
