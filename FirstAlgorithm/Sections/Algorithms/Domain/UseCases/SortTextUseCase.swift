//
//  SortTextUseCase.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 27/02/24.
//

//MARK: - SortTextUseCase - class

class SortTextUseCase: SortTextUseCaseProtocol{
  func execute(text: String) -> String {
    return sortText(text: text)
  }
  
  private func sortText(text: String) -> String {
    // Convert the input string to a character array
    var charactersArray:[Character] = Array(text)
    let n:Int = charactersArray.count
    
    // Iterate over the array using the bubble sort algorithm
    for currentIteration in 0..<n {
      for index in 0..<(n - currentIteration - 1) {
        if !shouldComeBefore(char1: charactersArray[index], char2: charactersArray[index + 1]) {
          // Swap characters using tuples
          (charactersArray[index], charactersArray[index + 1]) = (charactersArray[index + 1], charactersArray[index])
        }
      }
    }
    // Convert the ordered array of characters back to a string and return it
    return String(charactersArray)
  }
  
  private func shouldComeBefore(char1: Character, char2: Character) -> Bool {
    if char1.isLetter && char2.isLetter {                  //If both characters are letters
      if char1.isLowercase && char2.isUppercase {               //If character1 is lowercase and character2 is uppercase
        return true
      } else if char1.isUppercase && char2.isLowercase {   //Otherwise, if character1 is uppercase and character2 is lowercase
        return false
      }
    }else if char1.isNumber && char2.isNumber {                 //If both characters are numbers
      if let num1 = Int(String(char1)),
         let num2 = Int(String(char2)) {                        //Convert character1 and character2 to numbers
        if num1 % 2 != num2 % 2 {                               //If the number of character1 is odd and the number of character2 is even
          return num1 % 2 == 1                                  //Otherwise, if the number of character1 is even and the number of character2 is odd
        }                                                       //Since they are numbers, the operations can be summarized in a few simple operations
      }
    }else if char1.isNumber && char2.isLetter {            //If character1 is a number and character2 is a letter
      return false
    }else if char1.isLetter && char2.isNumber {            //Otherwise, if character1 is a letter and character2 is a number
      return true
    }
    
    return char1 < char2                                  //In case the 2 chars are not in the previous if
                                                          //By setting a default, both chars will be compared with the unicode value
  }
}
