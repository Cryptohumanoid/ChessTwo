//
//  ContentView.swift
//  ChessTwo
//
//  Created by Сергей Кулагин on 24.12.2019.
//  Copyright © 2019 ООО "ММК-Информсервис". All rights reserved.
//

import SwiftUI


enum CsFigure:Int16  {                           /* field state */
    
    case
    
    whitePawn,                             /* white */
    whiteBishop,
    whiteKnight,
    whiteRook,
    whiteQueen,
    whiteKing,
    blackPawn,                            /* Black */
    blackBishop,
    blackKnight,
    blackRook,
    blackQueen,
    blackKing,
    
    empty           // Empty
    
    struct CsFugureImages {
        let whiteKingImage   = Image(systemName: "wK")
        let whiteQueenImage  = Image(systemName: "wQ")
        let whiteRookImage   = Image(systemName: "wR")
        let whiteBishopImage = Image(systemName: "wB")
        let whiteKnightImage = Image(systemName: "wN")
        let whitePawnImage   = Image(systemName: "wP")
        let blackKingImage   = Image(systemName: "bK")
        let blackQueenImage  = Image(systemName: "bQ")
        let blackRookImage   = Image(systemName: "bR")
        let blackBishopImage = Image(systemName: "bB")
        let blackKnightImage = Image(systemName: "bN")
        let blackPawnImage   = Image(systemName: "bP")
    }
    
    
    var csSign: String  {
        switch self {
            case .whiteKing:    return "♔"
            case .whiteQueen:   return "♕"
            case .whiteRook:    return "♖"
            case .whiteBishop:  return "♗"
            case .whiteKnight:  return "♘"
            case .blackKing:    return "♚"
            case .blackQueen:   return "♛"
            case .blackRook:    return "♜"
            case .blackBishop:  return "♝"
            case .blackKnight:  return "♞"
            case .blackPawn:    return "♟"
            case .empty:       return " "
            default:            return "#"
        }
    }
}

struct CsField
{
    var     row: Int = 0
    var     col: Int = 0
    var     isFieldColorWhite = true
    var     notation = ".."
    var     figure = CsFigure.empty
    
    init(myRow : Int, myCol :Int , myFigure: CsFigure)  {
        row = myRow
        col = myCol
        figure = myFigure
        
        if (row+col) % 2 == 0 {
            isFieldColorWhite = true
        }
        
        switch self.col {
            case 0:     notation = "a"
            case 1:     notation = "b"
            case 2:     notation = "c"
            case 3:     notation = "d"
            case 4:     notation = "e"
            case 5:     notation = "f"
            case 6:     notation = "g"
            case 7:     notation = "h"
      
            default:     notation = "#"
        }
        switch self.row {
              case 0:     notation = "1"
              case 1:     notation = "2"
              case 2:     notation = "3"
              case 3:     notation = "4"
              case 4:     notation = "5"
              case 5:     notation = "6f"
              case 6:     notation = "7"
              case 7:     notation = "8"
        
              default:     notation = "#"
          }
        
    }
}



struct ContentView: View {
    
    @State private var csBoard = [
        
        [       CsField(myRow: 0,myCol: 0,myFigure: .whiteRook), CsField(myRow: 0,myCol: 1,myFigure: .whiteKnight),
                CsField(myRow: 0,myCol: 2,myFigure: .whiteBishop), CsField(myRow: 0,myCol: 3,myFigure: .whiteKing),
                CsField(myRow: 0,myCol: 4,myFigure: .whiteQueen), CsField(myRow: 0,myCol: 5,myFigure: .whiteBishop),
                CsField(myRow: 0,myCol: 6,myFigure: .whiteKnight), CsField(myRow: 0,myCol: 7,myFigure: .whiteRook)      ],
        
        [       CsField(myRow: 1,myCol: 0,myFigure: .whitePawn), CsField(myRow: 1,myCol: 1,myFigure: .whitePawn),
                CsField(myRow: 1,myCol: 2,myFigure: .whitePawn), CsField(myRow: 1,myCol: 3,myFigure: .whitePawn),
                CsField(myRow: 1,myCol: 4,myFigure: .whitePawn), CsField(myRow: 1,myCol: 5,myFigure: .whitePawn),
                CsField(myRow: 1,myCol: 6,myFigure: .whitePawn), CsField(myRow: 1,myCol: 7,myFigure: .whitePawn)        ],
        
        [       CsField(myRow: 2,myCol: 0,myFigure: .empty), CsField(myRow: 2,myCol: 1,myFigure: .empty),
                CsField(myRow: 2,myCol: 2,myFigure: .empty), CsField(myRow: 2,myCol: 3,myFigure: .empty),
                CsField(myRow: 2,myCol: 4,myFigure: .empty), CsField(myRow: 2,myCol: 5,myFigure: .empty),
                CsField(myRow: 2,myCol: 6,myFigure: .empty), CsField(myRow: 2,myCol: 7,myFigure: .empty)        ],
        
        [       CsField(myRow: 3,myCol: 0,myFigure: .empty), CsField(myRow: 3,myCol: 1,myFigure: .empty),
                CsField(myRow: 3,myCol: 2,myFigure: .empty), CsField(myRow: 3,myCol: 3,myFigure: .empty),
                CsField(myRow: 3,myCol: 4,myFigure: .empty), CsField(myRow: 3,myCol: 5,myFigure: .empty),
                CsField(myRow: 3,myCol: 6,myFigure: .empty), CsField(myRow: 3,myCol: 7,myFigure: .empty)        ],
        
        [       CsField(myRow: 4,myCol: 0,myFigure: .empty), CsField(myRow: 4,myCol: 1,myFigure: .empty),
                CsField(myRow: 4,myCol: 2,myFigure: .empty), CsField(myRow: 4,myCol: 3,myFigure: .empty),
                CsField(myRow: 4,myCol: 4,myFigure: .empty), CsField(myRow: 4,myCol: 5,myFigure: .empty),
                CsField(myRow: 4,myCol: 6,myFigure: .empty), CsField(myRow: 4,myCol: 7,myFigure: .empty)        ],
        
        [       CsField(myRow: 5,myCol: 0,myFigure: .empty), CsField(myRow: 5,myCol: 1,myFigure: .empty),
                CsField(myRow: 5,myCol: 2,myFigure: .empty), CsField(myRow: 5,myCol: 3,myFigure: .empty),
                CsField(myRow: 5,myCol: 4,myFigure: .empty), CsField(myRow: 5,myCol: 5,myFigure: .empty),
                CsField(myRow: 5,myCol: 6,myFigure: .empty), CsField(myRow: 5,myCol: 7,myFigure: .empty)        ],
        
        [       CsField(myRow: 6,myCol: 0,myFigure: .blackPawn), CsField(myRow: 6,myCol: 1,myFigure: .blackPawn),
                CsField(myRow: 6,myCol: 2,myFigure: .blackPawn), CsField(myRow: 6,myCol: 3,myFigure: .blackPawn),
                CsField(myRow: 6,myCol: 4,myFigure: .blackPawn), CsField(myRow: 6,myCol: 5,myFigure: .blackPawn),
                CsField(myRow: 6,myCol: 6,myFigure: .blackPawn), CsField(myRow: 6,myCol: 7,myFigure: .blackPawn)        ],
        
        [       CsField(myRow: 7,myCol: 0,myFigure: .blackRook), CsField(myRow: 7,myCol: 1,myFigure: .blackKnight),
                CsField(myRow: 7,myCol: 2,myFigure: .blackBishop), CsField(myRow: 7,myCol: 3,myFigure: .blackKing),
                CsField(myRow: 7,myCol: 4,myFigure: .blackQueen), CsField(myRow: 7,myCol: 5,myFigure: .blackBishop),
                CsField(myRow: 7,myCol: 6,myFigure: .blackKnight), CsField(myRow: 7,myCol: 7,myFigure: .blackRook)        ],
      
    ]
    
    
    var body: some View {
        
        VStack {
            Text ("Chess")
        
            Form {
                 ForEach(0 ..< 8) { row in
                    HStack {
                        ForEach(0 ..< 8) { col in
                            Text(" \(row)\(col)")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
