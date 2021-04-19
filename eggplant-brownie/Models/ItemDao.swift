//
//  ItemDao.swift
//  eggplant-brownie
//
//  Created by Victor Uriarte on 19/04/21.
//

import UIKit

class ItemDao {
    
    func save(_ itens: Array<Item>) {
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let caminho = recuperaDiretorio() else { return }
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("itens")
        
        return caminho
    }
    
    func recupera() -> Array<Item> {
        do {
            guard let diretorio = recuperaDiretorio() else { return []}
            let dados = try Data(contentsOf: diretorio)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! Array<Item>
            
            return itensSalvos
        } catch {
            print(error.localizedDescription)
            
            return []
        }
    }
}
