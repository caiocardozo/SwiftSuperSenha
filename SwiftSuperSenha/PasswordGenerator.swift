//
//  PasswordGenerator.swift
//  SwiftSuperSenha
//
//  Created by Caio Cardozo on 13/06/18.
//  Copyright © 2018 Caio Cardozo. All rights reserved.
//

import Foundation

class PasswordGenerator  {
    
    var numbersOfCharacters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacteres: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%ˆ&*()_+-=˜`|}]{['/?.>,<:;"
    private let numbers = "0123456789"
    
    init(numbersOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLetters: Bool, useSpecialCharacteres: Bool) {
        
        //limitando o numero de caracteres na escolha do usuario
        var numchars = min(numbersOfCharacters, 16)
        numchars = max(numchars, 1)
        
        self.numbersOfCharacters = numchars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacteres = useSpecialCharacteres
    }
    
    func generate(total: Int) -> [String] {
        //remover todo conteudo do array
        passwords.removeAll()
        //armazenar os caracteres que serao utilizados para gerar a senha
        var universe: String = ""
        
        if useLetters{
            universe += letters
        }
        
        if useNumbers{
            universe += numbers
        }
        
        if useSpecialCharacteres{
            universe += specialCharacters
        }
        
        if useCapitalLetters{
            universe += letters.uppercased()
        }
        //convertendo a string de caracteres em um array onde cada caractere e uma posicao do array assim tenho um array de charactere
        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...numbersOfCharacters{
                //pego um indice aleatorio dentro do array, a posicao de uma letra dentro desse array
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            //depois que adicionar todos os caracteres na senha entao adiciono a senha no array e repito o processo
            //ate dar o numero de senhas que o usuario soliticou.
            passwords.append(password)
        }
        
        return passwords
    }
}
