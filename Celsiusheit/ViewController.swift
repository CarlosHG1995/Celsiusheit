//
//  ViewController.swift
//  Celsiusheit
//
//  Created by cmu CARLOS HORACIO GARCIA CASTRILLÓN on 29/10/2019.
//  Copyright © 2019 UPV. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var gradosEntrada: UITextField!
    @IBOutlet weak var escalaSwitch: UISwitch!
    
    let celsius : Double = 32.0 // constante de la formula
    let factor : Double = 1.8 //hace ref al 9/5 de la formula
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    } //función para cerrar el teclado al dar clic area vacia
  
    @IBAction func `switch`(_ sender: UISwitch) {
        /*
    if (gradosEntrada.text != "")
    {
        if let num = gradosEntrada.text
   {
   if (sender.isOn == true)
   {  //hace la conversion a °F
        print ("switch on conversion F \(num)")
        
    
    if let num2 = Double (num)
            {
            let ans = celsius_fath(num: num2) //hago el llamado de la funcion
            print (ans)
            let gE1 = gradosEntrada.text! //unwrap para mostrar el valor de entrada
            print (gE1)
            let rta1 = String (format: "La conversión de \(gE1)°C es: %.4f", ans)
            resultLabel.text = String (format: "\(rta1) °F")
            }
        else{ resultLabel.text = String("Valor no válido")
        //si no es un dato double numerico muestra en el label ese mensaje
        }
    
   }
   else {  //si el switch está apagado hace la conversión a °C
            if let num3 = Double (num)
            {
                print ("switch on conversion C \(num3)")
                let ans1 = fath_cel(num2: num3) //llamo la funcion
                let gE = gradosEntrada.text!
                print(ans1)
                let rta = String (format: "La conversión de \(gE)°F es: %.4f", ans1) //mostrar el ans con 4 decimales
                resultLabel.text = String(format: "\(rta) °C")
            }  else{ resultLabel.text = String("Valor no válido..")}
    
        }
    }
    } //si el textlfield está vacío muestra esto cierro if gradosEntrada
   else { resultLabel.text = String (format: "No hay datos")   }
        */
        if (gradosEntrada.text != "")
        {
        let num = self.gradosEntrada!
        if (sender.isOn == true) {
            textFieldDidChangeSelection(num)
        }else {
            textFieldDidChangeSelection(num)
        }
        } else {
            resultLabel.text = NSLocalizedString("sin_datos", comment: "no hay datos.")//String (format: "No hay datos")
        }
    }
    
    func celsius_fath (num: Double) -> Double { //funcion para conversion de °C a °F
        return (num * factor) + celsius
    }
    func fath_cel (num2: Double) -> Double { //Funcion para conversion de °F a °C
        return (num2 - celsius) / factor
    }
  
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == self.gradosEntrada
        {
            guard let degreeInput = Double(textField.text!)
            else { resultLabel.text = NSLocalizedString("valor_no_valido", comment: ""); return}
            if (escalaSwitch.isOn == true ){  //hace la conversion a °F
                let ValorRta = celsius_fath(num: degreeInput)
             print("conversión valor \(ValorRta)°F ")
                let rta1 = String (format:NSLocalizedString("resultado", comment: ""),degreeInput, ValorRta)
                resultLabel.text =   String(format:"\(rta1)")
                /*let title = "Error"
                let code = "123456"
                let alertMessage = String(format: NSLocalizedString("localizable_text", comment: ""), title, code)
                print(alertMessage)*/
            }
            else {  //hace la conversion a °C
                let ValorRta2 = fath_cel(num2: degreeInput)
                print(String (format: "conversión de %.4f°C ",ValorRta2 ))
                let rta1 = String (format:NSLocalizedString("resultado1", comment: ""),degreeInput, ValorRta2)
                resultLabel.text = String (format: "\(rta1)")
            }
        }
    }
    
    func custom_labels_border() {
        resultLabel.text = ""
        gradosEntrada.delegate = self
        gradosEntrada.layer.borderColor = #colorLiteral(red: 0.8008424493, green: 0.6271415564, blue: 0.06138798167, alpha: 1)
        gradosEntrada.layer.borderWidth = 2.5
        gradosEntrada.layer.cornerRadius = 15.5
        
        resultLabel.layer.cornerRadius = 10.0
        resultLabel.layer.borderWidth = 3.0
        resultLabel.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
        custom_labels_border()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
