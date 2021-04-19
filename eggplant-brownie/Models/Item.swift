//
//  Item.swift
//  eggplant-brownie
//
//  Created by Victor Uriarte on 15/04/21.
//

import UIKit

class Item: NSObject, NSCoding {

    // MARK: - Atributos
    
    let nome: String
    let calorias: Double
    
    // MARK: - Init
    
    init (nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
    // MARK: - NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        calorias = aDecoder.decodeDouble(forKey: "calorias")
    }
}
