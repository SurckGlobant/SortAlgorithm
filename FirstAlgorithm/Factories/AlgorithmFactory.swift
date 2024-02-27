//
//  AlgorithmFactory.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 27/02/24.
//

import UIKit

//MARK: - AlgorithmFactory - class

public final class AlgorithmFactory{

  func algorithmViewController() -> UIViewController{
    let provider:AlgorithmUseCaseProvider = AlgorithmUseCaseProvider()
    let useCases: AlgorithmViewModel.UseCases = provider.provide()
    let viewModel:AlgorithmViewModelProtocol = AlgorithmViewModel(useCases: useCases)
    let vc: UIViewController = AlgorithmViewController(viewModel: viewModel)
    return vc
  }
}
