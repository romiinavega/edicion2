//
//  ViewController.swift
//  Edicion
//
//  Created by Alumno on 10/28/21.
//  Copyright © 2021 Alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaContacto") as! CeldaContactoController
        
        celda.lblNombre.text = contactos[indexPath.row].nombre
        celda.lblCorreo.text = contactos[indexPath.row].correo
        celda.lblCelular.text = contactos[indexPath.row].celular
        
        return celda
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToEditar" {
            
            let contactoSeleccionado = contactos[tvContactos.indexPathForSelectedRow!.row]
            let destino = segue.destination as! EditarContactoController
            destino.contacto = contactoSeleccionado
            destino.indice = tvContactos.indexPathForSelectedRow!.row
            destino.callbackActualizarTVContactos = actualizarTVContactos
            destino.callbackEliminarContacto = eliminarContacto
            
        }
        
        if segue.identifier == "goToAgregar" {
            
            let destino = segue.destination as! AgregarContactoController
            destino.callbackAgregarContacto = agregarContacto
            
        }
        
        
    }
    
  
    @IBOutlet weak var tvContactos: UITableView!
    var contactos : [Contacto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Contactos"
        
        contactos.append(Contacto(nombre: "José", celular: "6442059823", correo: "jose14@gmail.com"))
        contactos.append(Contacto(nombre: "Maria", celular: "64420457812", correo: "mary@gmail.com"))
        contactos.append(Contacto(nombre: "Ana", celular: "6442059823", correo: "ana03@gmail.com"))
        
    }
    
    func actualizarTVContactos() {
        tvContactos.reloadData()
    }
    
    func eliminarContacto(indice: Int) {
        contactos.remove(at: indice)
        actualizarTVContactos()
    }
    
    func agregarContacto(contacto: Contacto) {
        contactos.append(contacto)
        actualizarTVContactos()
    }
    
}

