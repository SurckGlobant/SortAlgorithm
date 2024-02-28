//
//  ParenthesesReviewUseCase.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 28/02/24.
//

//MARK: - ParenthesesReviewUseCase - class

class ParenthesesReviewUseCase: ParenthesesReviewUseCaseProtocol{
  func execute(text: String) -> Bool {
    return parenthesesReview(text: text)
  }
  
  private func parenthesesReview(text: String) -> Bool {
    var dataArray:[Character] = []
    
    // Iterate over each character in the text
    for character in text {
      if character == "(" {
        // Push the opening parenthesis onto the stack
        dataArray.append(character)
      } else if character == ")" {
        
        // If the stack is empty or the last parenthesis on the stack doesm't match '('
        // that means there is an unbalanced parenthesis
        if dataArray.isEmpty || dataArray.removeLast() != "(" {
          return false
        }
      }
    }
    
    //At the end, if the stack is empty, it means that all parentheses are balanced
    return dataArray.isEmpty
  }
}

