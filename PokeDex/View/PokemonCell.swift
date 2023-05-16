//
//  PokemonCell.swift
//  PokeDex
//
//  Created by Turdesán Csaba on 2023. 05. 15..
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    
    @ObservedObject var apiManager = ApiManager()
    let pokemon: Pokemon
    
    var backgroundColor: Color{
        if let type = pokeType(rawValue: pokemon.type){
            return type.pokeColor
        }
        return .gray
    }
    
    var body: some View {
        VStack(spacing: 0){
            if let image = pokemon.imageUrl {
                KFImage(URL(string: image))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
            } else {
                ProgressView()
            }
          
            ZStack{
                Text(pokemon.name)
                    .font(.system(size: 20,weight: .heavy))
                    .foregroundColor(.white)
            }
            .frame(width: 120)
            .background(backgroundColor)
            .cornerRadius(20)
        }
    }
}



