//
//  ApiManager.swift
//  PokeDex
//
//  Created by Turdesán Csaba on 2023. 05. 15..
//

import SwiftUI


class ApiManager: ObservableObject{
    let endpoint = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json")
    
    @Published var pokemons = [Pokemon]()
    @Published var selectedPokemon: Pokemon?
    
    init(){
        fetchingData()
    }
    
    func fetchingData() {
        guard let url = endpoint else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                print("DEBUG: \(error.localizedDescription)")
                return
            }
            guard let data = data?.parseData(removeString: "null,") else{
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let pokemon = try decoder.decode([Pokemon].self, from: data)
                
                DispatchQueue.main.async {
                    self.pokemons = pokemon
                }
                
            } catch {
                print("DEBUG: Decoding error \(error.localizedDescription)")
            }
        }.resume()
    }
}

extension Data{
    func parseData(removeString string: String) -> Data?{
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}





   
    
    
    
    



