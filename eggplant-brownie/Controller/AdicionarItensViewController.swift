//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Victor Uriarte on 16/04/21.
//

import UIKit

protocol AdicionarItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var caloriasTextfield: UITextField!
    
    // MARK: - Atributos
    
    var delegate: AdicionarItensDelegate?
    
    init(delegate: AdicionarItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View life cicle

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        
        guard let nome = nomeTextField.text, let caloria = caloriasTextfield.text else {
            return
        }
        guard let numeroDeCalorias = Double(caloria) else {
            return
        }
        
        let item = Item(nome: nome, calorias: numeroDeCalorias)
        delegate?.add(item)
        navigationController?.popViewController(animated: true)
    }
    


}
