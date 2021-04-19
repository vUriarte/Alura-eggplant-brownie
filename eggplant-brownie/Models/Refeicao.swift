//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Victor Uriarte on 15/04/21.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
    // MARK: -Atributos
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
        
        
    // MARK: - Construtor
    init(nome: String, felicidade: Int, itens: Array<Item> = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    // MARK: - NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(felicidade, forKey: "felicidade")
        aCoder.encode(itens, forKey: "itens")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        felicidade = aDecoder.decodeInteger(forKey: "felicidade")
        itens = aDecoder.decodeObject(forKey: "itens") as! Array<Item>
    }
        
    // MARK: - Metodos
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
