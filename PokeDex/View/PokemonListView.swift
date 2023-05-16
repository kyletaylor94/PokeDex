//
//  PokemonListView.swift
//  PokeDex
//
//  Created by Turdesán Csaba on 2023. 05. 16..
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel = ApiManager()
    
    @Binding var showPopup: Bool
    
    private let items = [GridItem(.fixed(120)), GridItem(.fixed(120)), GridItem(.fixed(120))]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: items, spacing: 15){
                ForEach(viewModel.pokemons) { pokemon in
                        Button {
                            viewModel.selectedPokemon = pokemon
                            showPopup = true
                        } label: {
                            PokemonCell(pokemon: pokemon)
                                .padding(.top)
                                .sheet(item: $viewModel.selectedPokemon, onDismiss: {
                                    showPopup = false
                                }) { selectedPokemon in
                                    PopUpView(pokemon: selectedPokemon)
                                        .background(
                                            BackgroundClearView().ignoresSafeArea()
                                        )
                                }
                        }
                    }
                }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView(showPopup: .constant(false))
    }
}
