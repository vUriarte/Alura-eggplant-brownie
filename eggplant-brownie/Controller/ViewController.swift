//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Victor Uriarte on 14/04/21.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao:Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionarItensDelegate{
    
    
    // MARK: - Atributos
    var delegate: AdicionaRefeicaoDelegate?
    var itens: Array<Item> = [Item(nome: "Molho de Tomate", calorias: 55),
                              Item(nome: "Queijo", calorias: 65),
                              Item(nome: "Frango", calorias: 75)]
    var itensSelecionados: Array<Item> = []
    
    // MARK: - IBOutlets
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet var felicidadeTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView!
    
    
    // MARK: - View life cicle
    
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionaItem

    
    }
    @objc func adicionarItem() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = itens[indexPath.row].nome
        
        return celula
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
            //dump(itensSelecionados)
            
        } else {
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            guard let position = itensSelecionados.firstIndex(of: item) else { return }
            itensSelecionados.remove(at: position)
        }
    }
    
    // MARK: - AdicionarItensDelegate
    
    func add(_ item: Item) {
        itens.append(item)
        itensTableView.reloadData()
    }
    
    

    // MARK: - IBActions
    @IBAction func adicionar(_ sender: Any) {
        guard let nomeDaRefeicao = nomeTextField?.text  else {
            return
        }

        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)


        print("Comi \(refeicao.nome) e fiquei com felicidade \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)

    }
}
