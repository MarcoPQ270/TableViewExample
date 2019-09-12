//
//  producto.swift
//  appclases
//
//  Created by labdesarrollo5 on 9/12/19.
//  Copyright © 2019 labdesarrollo5. All rights reserved.
//

import Foundation
class producto{
    var idProducto:String
    var nomProducto:String
    var existencia:String
    
    init(idprod:String, nomProd:String, existen:String){
        self.idProducto=idprod
        self.nomProducto=nomProd
        self.existencia=existen
    }
    
}
