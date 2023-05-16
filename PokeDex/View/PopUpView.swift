//
//  PopUpView.swift
//  PokeDex
//
//  Created by Turdesán Csaba on 2023. 05. 15..
//

import SwiftUI
import Kingfisher

struct PopUpView: View {
    @ObservedObject var apiManager = ApiManager()

    let pokemon: Pokemon
    
    var backgroundColor: Color{
        if let type = pokeType(rawValue: pokemon.type ){
            return type.pokeColor
        }
        return .gray
    }
    
    var body: some View {
    
            VStack(alignment: .center){
                    Text(pokemon.name.uppercased())
                        .font(.system(size: 30, weight: .heavy))
                        .foregroundColor(.white)
                        .frame(width: 350, height: 50)
                        .background(backgroundColor)
                        .cornerRadius(10)
                    if let image = pokemon.imageUrl{
                        KFImage(URL(string: image))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(20)
                    } else {
                        ProgressView()
                    }
                
                    
                    HStack(spacing: 80){
                        Text("Type: ")
                            .foregroundColor(.red)
                            .fontWeight(.semibold) + Text(pokemon.type)
                      
                        Text("Defense: ")
                            .foregroundColor(.red)
                            .fontWeight(.semibold) + Text("\(pokemon.defense)")
                        
                    }
                    .fontWeight(.heavy)
                 
                    Divider().frame(height: 10)
                    
                    HStack(spacing: 80){
                        Text("Height: ")
                            .foregroundColor(.red)
                            .fontWeight(.semibold) + Text("\(pokemon.height)")
                      
                        Text("PokeDex ID: ")
                            .foregroundColor(.red)
                            .fontWeight(.semibold) + Text("\(pokemon.id)")
                         
                    }
                    .fontWeight(.heavy)
                    .padding()
                    
                    
                    HStack(spacing: 80){
                        Text("Weight: ")
                            .foregroundColor(.red)
                            .fontWeight(.semibold) + Text("\(pokemon.weight)")
                      
                        Text("Base Attack: ")
                            .foregroundColor(.red)
                            .fontWeight(.semibold) + Text("\(pokemon.attack)")
                    }
                    .padding(.bottom)
                    .fontWeight(.heavy)
                    
                    
                    Text("Description")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
          
                    .padding()
                    .frame(width: 360)
                    .background(Color.red.opacity(0.8))
                    .cornerRadius(10)
                 
                    
                    Text(pokemon.description)
                    .padding(.top)
                    .font(.system(size: 16, weight: .semibold))
                   
                    .foregroundColor(.black)
                    .frame(width: 300)
                    Spacer()
                    
                }
                .padding(.vertical, 10)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
   
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(pokemon: Pokemon.init(id: 0, name: "balbasaur", imageUrl: "asd", description: "asdasd", height: 0, weight: 2, attack: 0, defense: 0, type: "asd", evolutionChain: [EvolutionChain.init(id: "asd", name: "aasdfg", imageUrl: "asdasd")]))
    }
}
