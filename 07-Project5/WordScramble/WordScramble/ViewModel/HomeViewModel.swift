//
//  HomeViewModel.swift
//  WordScramble
//
//  Created by Rabel Ahmed on 31/03/2021.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var usedWords: [String] = [String]()
    @Published var rootWord: String = ""
    @Published var newWord: String = ""
    @Published var wordError: WordErrorModel = WordErrorModel()
    
    var textFieldPlaceHolderText: String {
        "Enter your word"
    }
    
    var title: String {
        rootWord
    }
    
    var alertTitle: String {
        wordError.title
    }
    
    var alertMessage: String {
        wordError.message
    }
    
    func startGame() {
        
        guard let textFileURL = Bundle.main.url(forResource: "start", withExtension: "txt") else {
            fatalError("Could not load start.txt from bundle.")
        }
        
        if let startWords = try? String(contentsOf: textFileURL) {
            let allWords = startWords.components(separatedBy: "\n")
            rootWord = allWords.randomElement() ?? "silkworm"
        }
    }
    
    func addNewWord() {
        let word = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard word.count > 0 else {
            return
        }
        
        guard isOriginal(word: word) else {
            wordError = WordErrorModel("Word used already", "Be more original", true)
            return
        }
        
        guard isPossible(word: word) else {
            wordError = WordErrorModel("Word not recognized", "You can't just make them up, you know!", true)
            return
        }
        
        guard isReal(word: word) else {
            wordError = WordErrorModel("Word not possible", "That isn't a real word.", true)
            return
        }
        
        usedWords.insert(word, at: 0)
        newWord = ""
        startGame()
    }
}

extension HomeViewModel {
    
    private func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    private func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        return true
    }
    
    private func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
}
