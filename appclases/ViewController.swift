//
//  ViewController.swift
//  appclases
//
//  Created by labdesarrollo5 on 9/12/19.
//  Copyright © 2019 labdesarrollo5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var productos = [producto]()
    
    @IBOutlet weak var txtexisten: UITextField!
    @IBOutlet weak var txtnom: UITextField!
    @IBOutlet weak var txtclave: UITextField!
    @IBAction func btnagregar(_ sender: UIButton) {
        
        let clave =
            txtclave.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let nom =
            txtnom.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let existe =
            txtexisten.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if(clave?.isEmpty)!{
            showAlerta(titulo: "Error", mensaje: "Caja vacia")
            txtclave.becomeFirstResponder()
            return
        }
        
        if(nom?.isEmpty)!{
            showAlerta(titulo: "Error", mensaje: "Caja vacia")
            txtnom.becomeFirstResponder()
            return
        }
        
        if(existe?.isEmpty)!{
            showAlerta(titulo: "Error", mensaje: "Caja vacia")
            txtexisten.becomeFirstResponder()
            return
        }
        productos.append(producto(idprod: clave!, nomProd: nom!, existen: existe!))
        txtclave.text=""
        txtnom.text=""
        txtexisten.text="0"
        txtclave.becomeFirstResponder()
    }
    
    @IBAction func btnconsultar(_ sender: UIButton) {
        
    }
    
    func showAlerta(titulo: String, mensaje: String){
        //Crea La Alerta
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)
        //Agregar Un Boton
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        //Muestra El Alerta
        self.present(alert, animated: true, completion: nil)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="push"){
            let tablesegue=segue.destination as! TableViewController
            tablesegue.productos=productos
        }
    }

}

