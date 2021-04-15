//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Victor Uriarte on 14/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?

    @IBAction func adicionar(_ sender: Any) {
        
        if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text {
            let nome = nomeDaRefeicao
            if let felicidade = Int(felicidadeDaRefeicao) {
                let refeicao : Refeicao = Refeicao (nome: nome, felicidade: felicidade)
                print("Comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")

            } else {
                print ("ERRO AO CRIAR PRATO!")
                
            }
            
        }

    }
    
}


// Abordagem com guard let

//guard let nomeDaRefeicao = nomeTextField?.text  else {
//    return
//}
//
//guard let felicidadeDaRefeicao = Int(felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
//    return
//}
//
//print("Comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
//
