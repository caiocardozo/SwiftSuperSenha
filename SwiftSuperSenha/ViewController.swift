//
//  ViewController.swift
//  SwiftSuperSenha
//
//  Created by Caio Cardozo on 10/06/18.
//  Copyright © 2018 Caio Cardozo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swSpecialCharecters: UISwitch!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordsViewController
        //pega os valores da view e atribui a view passwordsViewController
        //verifica se o text tem conteudo, pois o usuario pode nao colocar
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
             passwordsViewController.numbersOfPasswords = numberOfPasswords
        }
        
        if let numbersOfCharacters = Int(tfNumberOfCharacters.text!){
            passwordsViewController.numberOfCharacters = numbersOfCharacters
        }
        
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCapitalLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharecters.isOn
        //forca o encerramento do modo de edição
       view.endEditing(true)
    }


}

