//
//  MainView.swift
//  PokeDex
//
//  Created by Turdesán Csaba on 2023. 05. 15..
//

import SwiftUI
import UIKit

struct MainView: View {
    @State private var showPopup = false
    @State var searchText = ""
    @StateObject var viewModel = ApiManager()
    
    private let items = [GridItem(.fixed(120)), GridItem(.fixed(120)), GridItem(.fixed(120))]
    
    var body: some View {
        
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: items, spacing: 15){
                    ForEach(searchResults){ pokemon in
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
            .navigationTitle("PokeDex")
            .blur(radius: showPopup ? 17 : 0)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.red, for: .navigationBar)
        }
        .searchable(text: $searchText)
        .foregroundColor(.black)
        .accentColor(.black)
        .onChange(of: searchText) { newValue in
            searchText = newValue.lowercased()
        }
    }
    var searchResults: [Pokemon] {
           if searchText.isEmpty {
               return viewModel.pokemons
           } else {
               return viewModel.pokemons.filter { $0.name.contains(searchText) }
               
           }
       }
    }




struct MainView_PreviewProvider: PreviewProvider{
    static var previews: some View{
        MainView()
    }
}


struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear.withAlphaComponent(0.1)
        }
        return view
    }
    
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
