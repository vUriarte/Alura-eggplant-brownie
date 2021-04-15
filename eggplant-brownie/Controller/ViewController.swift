//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Victor Uriarte on 14/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    var TableViewController: RefeicoesTableViewController?
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?

    @IBAction func adicionar(_ sender: Any) {
        guard let nomeDaRefeicao = nomeTextField?.text  else {
            return
        }

        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)

        print("Comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
        
        TableViewController?.add(refeicao)
        
        navigationController?.popViewController(animated: true)

    }
}
