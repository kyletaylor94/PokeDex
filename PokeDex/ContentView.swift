//
//  ContentView.swift
//  PokeDex
//
//  Created by Turdesán Csaba on 2023. 05. 15..
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        MainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ApiManager())
    }
}
