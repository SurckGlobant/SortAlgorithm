//
//  PageViewController.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 28/02/24.
//

import Foundation
import UIKit

//MARK: - PageViewController - class
final class PageViewController: UIPageViewController{
  
  //MARK: - Variables
  private var viewModel:PageViewModelProtocol
  private var pageControl:UIPageControl = UIPageControl()
  
  //MARK: - Init
  
  init(viewModel:PageViewModelProtocol) {
    self.viewModel = viewModel
    super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    configurePageControl()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Lifecycle app
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupUI()
    self.setDelegates()
    self.getData()
  }
  
  //MARK: - Methods
  private func setupUI(){
    title = "Algorithms"
  }
  
  private func setDelegates(){
    dataSource = self
    delegate = self
  }
  
  private func getData(){
    if let firstViewController = viewModel.viewController(at: 0) {
      setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
    }
  }
  
  private func configurePageControl() {
    pageControl = UIPageControl(frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 50, width: UIScreen.main.bounds.width, height: 50))
    pageControl.numberOfPages = viewModel.numberOfPages()
    pageControl.currentPage = 0
    pageControl.tintColor = UIColor.black
    pageControl.pageIndicatorTintColor = UIColor.gray
    pageControl.currentPageIndicatorTintColor = UIColor.black
    view.addSubview(pageControl)
  }
}

//MARK: - UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDataSource{
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let index = viewModel.viewControllers.firstIndex(of: viewController) else {
      return nil
    }
    let previousIndex = index - 1
    guard previousIndex >= 0 else {
      return nil
    }
    return viewModel.viewController(at: previousIndex)
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let index = viewModel.viewControllers.firstIndex(of: viewController) else {
      return nil
    }
    let nextIndex = index + 1
    guard nextIndex < viewModel.numberOfPages() else {
      return nil
    }
    return viewModel.viewController(at: nextIndex)
  }
}

//MARK: - UIPageViewControllerDelegate
extension PageViewController: UIPageViewControllerDelegate {
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    if completed, let currentViewController = viewControllers?.first,
       let index = viewModel.viewControllers.firstIndex(of: currentViewController) {
      pageControl.currentPage = index
    }
  }
}
