//
//  ConversionError.swift
//  FirstAlgorithm
//
//  Created by David Bautista on 29/02/24.
//

//MARK: - ConversionError - enum

enum ConversionError: Error {
  case incorrectFormat
  case extraElements
  case invalidCoordinate
  case occupiedSquare
  case errorEmpty
}
