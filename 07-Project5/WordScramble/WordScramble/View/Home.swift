//
//  Home.swift
//  WordScramble
//
//  Created by Rabel Ahmed on 31/03/2021.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                TextField(homeViewModel.textFieldPlaceHolderText, text: $homeViewModel.newWord, onCommit: homeViewModel.addNewWord)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List(homeViewModel.usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
            }
            .navigationBarTitle(homeViewModel.title)
        }
        .onAppear {
            homeViewModel.startGame()
        }
        .alert(isPresented: $homeViewModel.wordError.showError) {
            
            Alert(title: Text(homeViewModel.alertTitle), message: Text(homeViewModel.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
