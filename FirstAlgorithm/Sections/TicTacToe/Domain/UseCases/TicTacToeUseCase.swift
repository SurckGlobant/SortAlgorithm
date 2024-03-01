//
//  TicTacToeUseCase.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 29/02/24.
//

import Foundation
import Combine

//MARK: - TicTacToeUseCase - class

class TicTacToeUseCase: TicTacToeUseCaseProtocol{
  
  private var subscriptions = Set<AnyCancellable>()
  
  func execute(text: String) -> AnyPublisher<String, ConversionError> {
    return Future { promise in
      
      self.convertTextToArray(text: text)
        .map { array in
          let result = self.finalResult(board: array)
          return result
        }
        .sink(receiveCompletion: { completion in
          switch completion {
          case .finished:
            break
          case .failure(let error):
            promise(.failure(error))
          }
        }, receiveValue: { value in
          promise(.success(value))
        })
        .store(in: &self.subscriptions)
      
    }.eraseToAnyPublisher()
  }
  
  private func convertTextToArray(text: String) -> AnyPublisher<[[String]], ConversionError> {
    return Future { promise in
      // First of all, we divide the text into a array of coordinates, at the same time it is verified that the parentheses are correct
      guard let coordinates = self.getMainArray(text: text) else {
        promise(.failure(.incorrectFormat))
        return
      }
      
      // Check if the text contains the correct number of coordinates. The game can have a maximum of 9 entries
      guard coordinates.count <= 9 else {
        promise(.failure(.extraElements))
        return
      }
      
      // The array must not be empty
      guard coordinates.count != 0 else {
        promise(.failure(.errorEmpty))
        return
      }
      
      // Now we are going to create the array, we are going to initialize it with spaces
      var array:[[String]] = Array(repeating: Array(repeating: " ", count: 3), count: 3)
      
      // Now we are going to fill the matrix with the coordinates we have
      
      //We will use a variable that we will change in each iteration
      var nextValue = PlayerTurn.playerA
      
      // We iterate the coordinates
      for coordinate in coordinates {
        // We divide the coordinate into row and column
        let values = coordinate.components(separatedBy: ",")
        
        // Now we are going to check if the coordinate has exactly two values, within our 3x3 array
        guard values.count == 2,
              let row:Int = Int(values[0]),
              let column:Int = Int(values[1]),
              row >= 0 && row < 3,
              column >= 0 && column < 3 else {
          promise(.failure(.invalidCoordinate))
          return
        }
        
        // Now we are going to check if the box to be assigned is free or occupied.
        guard array[row][column] == " " else {
          promise(.failure(.occupiedSquare))
          return
        }
        
        // Now that we validate that the input is correct, we assign the value
        array[row][column] = nextValue.rawValue
        
        // Now we update the next value to assign
        nextValue = (nextValue == .playerA) ? .playerB : .playerA
      }
      
      promise(.success(array))
      
    }.eraseToAnyPublisher()
  }
  
  private func getMainArray(text: String) -> [String]?{
    var elements: [String] = []
    var insideBrackets = false
    var currentElement = ""
    
    for caracter in text {
      if caracter == "[" {
        insideBrackets = true
        currentElement = ""
      } else if caracter == "]" {
        insideBrackets = false
        if !currentElement.isEmpty {
          elements.append(currentElement)
          currentElement = ""
        }
      } else if insideBrackets {
        currentElement.append(caracter)
      }
    }
    
    if insideBrackets {
      return nil
    }
    
    return elements
  }
  
  private func finalResult(board: [[String]]) -> String{
    if let winner = checkWinner(board: board) {
      return("Player \(winner.rawValue) has won!")
    } else if checkDraw(board: board) {
      return("The game has ended in a tie!")
    } else {
      return("The game is not over yet!")
    }
  }
  
  private func checkDraw(board: [[String]]) -> Bool {
    for row in board {
      if row.contains(" ") {
        //There are still empty cells, it's not a tie
        return false
      }
    }
    
    return checkWinner(board: board) == nil
  }
  
  private func checkWinner(board: [[String]]) -> PlayerTurn? {
    for player in [PlayerTurn.playerA, PlayerTurn.playerB] {
      if checkHorizontalWin(board: board, player: player) || checkVerticalWin(board: board, player: player) || checkDiagonalWin(board: board, player: player) {
        return player
      }
    }
    return nil
  }
  
  private func checkHorizontalWin(board: [[String]], player: PlayerTurn) -> Bool {
    for row in board {
      if row.allSatisfy({ $0 == player.rawValue }) {
        return true
      }
    }
    return false
  }
  
  private func checkVerticalWin(board: [[String]], player: PlayerTurn) -> Bool {
    for column in 0..<3 {
      var columnValue:[String] = []
      
      for row in 0..<3 {
        columnValue.append(board[row][column])
      }
      if columnValue.allSatisfy({ $0 == player.rawValue }) {
        return true
      }
    }
    return false
  }
  
  private func checkDiagonalWin(board: [[String]], player: PlayerTurn) -> Bool {
    // First diagonal
    var firstDiagonal = [String]()
    
    for index in 0..<3 {
      firstDiagonal.append(board[index][index])
    }
    
    if firstDiagonal.allSatisfy({ $0 == player.rawValue }) {
      return true
    }
    
    // Second diagonal
    var secondDiagonal = [String]()
    
    for index in 0..<3 {
      secondDiagonal.append(board[index][2 - index])
    }
    
    if secondDiagonal.allSatisfy({ $0 == player.rawValue }) {
      return true
    }
    
    return false
  }
}
