//
//  ViewDetailController.swift
//  Phone-Contact-App
//
//  Created by IOS on 10/10/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

class ViewDetailController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var toLabel : String = ""
    var myNewContacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = toLabel
        for i in 0...19 {
            if(self.myNewContacts[i].name == toLabel) {
                dobLabel.text = "DoB: " + self.myNewContacts[i].dob
                emailLabel.text = "Email: " + self.myNewContacts[i].email
                cellLabel.text = "Cell: " + self.myNewContacts[i].cell
                countryLabel.text = "Country: " + self.myNewContacts[i].country
                break
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
