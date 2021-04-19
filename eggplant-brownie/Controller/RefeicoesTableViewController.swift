//
//  RefeicoesTableViewController.swift
//  eggplant-brownie
//
//  Created by Victor Uriarte on 15/04/21.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes: Array<Refeicao> = []
    
    override func viewDidLoad() {
        refeicoes = RefeicaoDao().recupera()
    }
    

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = refeicoes[indexPath.row].nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        return celula
    }
    
    func add(_ refeicao:Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
        RefeicaoDao().save(refeicoes)
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            RemoveRefeicaoViewController(controller: self).exibe(refeicao, handler: { alerta in
                                                                    self.refeicoes.remove(at: indexPath.row)
                                                                    self.tableView.reloadData()
            })
        }
    }
    
    func removeRefeicao(alerta: UIAlertAction) {
        print("tá executando")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Adicionar" {
            if let ViewController = segue.destination as? ViewController {
                ViewController.delegate = self
            }
        }
    }
}
