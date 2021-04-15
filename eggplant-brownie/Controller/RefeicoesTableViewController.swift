//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Victor Uriarte on 15/04/21.
//

import UIKit

class RefeicoesTableViewController: UITableViewController {
    
    var refeicoes: Array<Refeicao> = [Refeicao(nome: "Macarrao", felicidade: 4),
                                      Refeicao(nome: "Pizza", felicidade: 3),
                                      Refeicao(nome: "Bolo", felicidade: 5)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = refeicoes[indexPath.row].nome
        return celula
    }
    
    func add(_ refeicao:Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ViewController = segue.destination as? ViewController {
            ViewController.TableViewController = self
        }
    }
}
