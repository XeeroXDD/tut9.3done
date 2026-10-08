//
//  ViewController.swift
//  tut9.3
//
//  Created by Felix KHNEN on 8/10/2026.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let pizzas = ["Supreme", "Meat Lover", "Pepperoni", "Hawaiian", "Bacon Cheeseburger"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
return 1    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzas.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return pizzas[row]
        }
    @IBOutlet weak var sizeControl: UISegmentedControl!
    @IBOutlet weak var quantityStepper: UIStepper!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var pizzaPicker: UIPickerView!
      override func viewDidLoad() {
        super.viewDidLoad()
          pizzaPicker.delegate = self
          pizzaPicker.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func stepperChanged(_ sender: UIStepper) {
        quantityLabel.text = "Quantity: \(Int(sender.value))"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let confirmation = segue.destination as? ConfirmationViewController {
               let pizza = pizzas[pizzaPicker.selectedRow(inComponent: 0)]
               let size = sizeControl.titleForSegment(at: sizeControl.selectedSegmentIndex) ?? ""
               let quantity = Int(quantityStepper.value)
               let address = addressField.text ?? ""

               confirmation.orderText = """
               Order Confirmed!

               Pizza: \(pizza)
               Size: \(size)
               Quantity: \(quantity)
               Deliver to: \(address)
               """
           }
       }
   }

