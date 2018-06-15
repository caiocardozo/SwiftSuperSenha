//
//  PasswordsViewController.swift
//  SwiftSuperSenha
//
//  Created by Caio Cardozo on 13/06/18.
//  Copyright © 2018 Caio Cardozo. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {

    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCharacters: Int = 10
    var numbersOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!

    var passwordGenerator : PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //alterando o titulo da tela
        title = "Total de senhas \(numbersOfPasswords)"
        //inicializa o passoword Generator
        passwordGenerator = PasswordGenerator(numbersOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacteres: useSpecialCharacters)
        
        generatePassword()
    }
    
    func generatePassword() {
        //leva o scroll para cima e incializa ele cm 0
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        let passwords = passwordGenerator.generate(total: numbersOfPasswords)
        //adiciona a senha gerada no textview de senhas
        for password in passwords{
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePassword()
    }
    

}
