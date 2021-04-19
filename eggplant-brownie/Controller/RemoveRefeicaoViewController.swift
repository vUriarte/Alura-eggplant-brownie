//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Victor Uriarte on 19/04/21.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(botaoCancelar)
        let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: handler)
        alerta.addAction(botaoRemover)
        controller.present(alerta, animated: true, completion: nil)
    }
}
