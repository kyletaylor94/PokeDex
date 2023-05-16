//
//  Pokemon.swift
//  PokeDex
//
//  Created by Turdesán Csaba on 2023. 05. 15..
//

import Foundation
import SwiftUI

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String?
    let description: String
    let height: Int
    let weight: Int
    let attack: Int
    let defense: Int
    let type: pokeType.RawValue //String?
    let evolutionChain: [EvolutionChain]?
}

struct EvolutionChain: Decodable{
    let id: String?
    let name: String?
    let imageUrl: String?
}

enum pokeType: String{
    case poison
    case fire
    case water
    case bug
    case flying
    case normal
    case electric
    case ground
    case fairy
    case grass
    case fighting
    case psychic
    case steel
    case ice
    case rock
    case dragon
    
    var pokeColor: Color{
        switch self{
            
        case .poison:
            return .green.opacity(0.8)
        case .fire:
            return .red.opacity(0.8)
        case .water:
            return .cyan.opacity(0.8)
        case .bug:
            return .gray.opacity(0.8)
        case .flying:
            return .gray.opacity(0.6)
        case .normal:
            return .gray.opacity(0.9)
        case .electric:
            return .orange.opacity(0.7)
        case .ground:
            return .brown.opacity(0.7)
        case .fairy:
            return .pink.opacity(0.7)
        case .grass:
            return .green.opacity(0.6)
        case .fighting:
            return .gray.opacity(0.4)
        case .psychic:
            return .yellow.opacity(0.7)
        case .steel:
            return .gray.opacity(0.3)
        case .ice:
            return .blue.opacity(0.7)
        case .rock:
            return .gray.opacity(0.5)
        case .dragon:
            return .red.opacity(0.7)
        }
    }
   
}
