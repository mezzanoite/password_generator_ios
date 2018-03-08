//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Usuário Convidado on 07/03/18.
//  Copyright © 2018 FIAP. All rights reserved.
//

import Foundation

class PasswordGenerator {
    
    var numberOfCharacters: Int
    var numberOfPasswords: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpacialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "+_-$%#@&!"
    private let numbers = "0123456789"
    
    init(numberOfCharacters: Int, numberOfPasswords: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpacialCharacters: Bool) {
        self.numberOfCharacters = numberOfCharacters
        self.numberOfPasswords = numberOfPasswords
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpacialCharacters = useSpacialCharacters
    }
    
    func generate() -> [String] {
        
        // Limpar antes, pois na tela posso gerar novamente
        passwords.removeAll()
        
        // Monto o universo de opçoes habilitadas pelo usuário
        var universe: String = ""
        if useNumbers {
            universe += numbers
        }
        if useLetters {
            universe += letters
        }
        if useSpacialCharacters {
            universe += specialCharacters
        }
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        let universeArray = Array(universe)
        
        while passwords.count < numberOfPasswords {
            var password: String = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        return passwords
    }
    
}
