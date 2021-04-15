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
    let itens: Array<Item> = []
        
        
    // Construtor
    init(nome: String, felicidade: Int) {
        self.nome = nome
        self.felicidade = felicidade
    }
        
    // Metodos
    func totalCalorias() -> Double {
        var total: Double = 0
        for item in itens {
            total += item.calorias
        }
        return total
        }
    }
