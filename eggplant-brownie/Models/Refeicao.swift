//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Victor Uriarte on 15/04/21.
//

import UIKit

class Refeicao: NSObject {
    // Atributos
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
        
        
    // Construtor
    init(nome: String, felicidade: Int, itens: Array<Item> = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
        
    // Metodos
    func totalCalorias() -> Double {
        var total: Double = 0
        for item in itens {
            total += item.calorias
        }
        return total
        }
    func detalhes() -> String {
        var mensagem = "Felicidade : \(felicidade)"
        
        for item in itens {
            mensagem += ", \(item.nome) - Calorias: \(item.calorias)"
        }
        
        return mensagem
    }
}
