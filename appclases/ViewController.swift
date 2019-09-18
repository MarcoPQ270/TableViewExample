//
//  ViewController.swift
//  appclases
//
//  Created by labdesarrollo5 on 9/12/19.
//  Copyright © 2019 labdesarrollo5. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    
    var productos = [producto]()
    var db: OpaquePointer?
    
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
        
        //if(clave?.isEmpty)!{
          //  showAlerta(titulo: "Error", mensaje: "Caja vacia")
            //txtclave.becomeFirstResponder()
           // return
        //}
        
        if(nom?.isEmpty)!{
            showAlerta(titulo: "Error", mensaje: "El nombre esta vacio")
            txtnom.becomeFirstResponder()
            return
        }
        
        if(existe?.isEmpty)!{
            showAlerta(titulo: "Error", mensaje: "La existencia esta vacia")
            txtexisten.becomeFirstResponder()
            return
        }
        
        let nombr : NSString = nom! as NSString
        let existen : Int32 = Int32(existe!) as! Int32
        var stmt: OpaquePointer?
        let sentencia = "INSERT INTO Producto(nomProducto, existencia) values (?,?)"
        if sqlite3_prepare(db, sentencia, -1, &stmt, nil) == SQLITE_OK{
            sqlite3_bind_text(stmt, 1, nombr.utf8String, -1, nil)
            sqlite3_bind_int(stmt, 2, existen)
        }
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            showAlerta(titulo: "Error al insertar", mensaje: errmsg)
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
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("ProductosDatabase.sqlite")
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            
            showAlerta(titulo: "Base de datos", mensaje: "error al abrir base de datos")
            
        }
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS producto(idProducto INTEGER PRIMARY KEY AUTOINCREMENT, nomProducto TEXT, existencia INTEGER)", nil, nil, nil) != SQLITE_OK {
            
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            showAlerta(titulo: "Error al crear la tabla", mensaje: errmsg)
            
        }
        
        txtclave.becomeFirstResponder()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="push"){
            let tablesegue=segue.destination as! TableViewController
            tablesegue.productos=productos
        }
    }
}

