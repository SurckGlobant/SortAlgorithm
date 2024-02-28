//
//  AlgorithmFactory.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 27/02/24.
//

import UIKit

//MARK: - AlgorithmFactory - class

public final class AlgorithmFactory{

  func pageViewController() -> UIViewController{
    let viewModel:PageViewModelProtocol = PageViewModel()
    let vc: UIViewController = PageViewController(viewModel: viewModel)
    return vc
  }
  
  func algorithmViewController() -> UIViewController{
    let provider:SortTextmUseCaseProvider = SortTextmUseCaseProvider()
    let useCases: SortAlgorithmViewModel.UseCases = provider.provide()
    let viewModel:SortAlgorithmViewModelProtocol = SortAlgorithmViewModel(useCases: useCases)
    let vc: UIViewController = SortAlgorithmViewController(viewModel: viewModel)
    return vc
  }
  
  func parenthesesReviewController() -> UIViewController{
    let provider:ParenthesesReviewUseCaseProvider = ParenthesesReviewUseCaseProvider()
    let useCases: ParenthesesReviewViewModel.UseCases = provider.provide()
    let viewModel:ParenthesesReviewViewModelProtocol = ParenthesesReviewViewModel(useCases: useCases)
    let vc: UIViewController = ParenthesesReviewViewController(viewModel: viewModel)
    return vc
  }
}
