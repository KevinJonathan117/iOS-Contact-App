//
//  ViewController.swift
//  Phone-Contact-App
//
//  Created by IOS on 09/10/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let data = ["Apples", "Oranges", "Pears", "Bananas", "Plums", "Mango", "Pineapple", "Watermelon", "Peach", "Avocado", "Strawberry", "Blackberry", "Durian", "Jackfruit", "Dragonfruit", "Salak"]
    var filteredData: [String]!
    var dataDict = [String: [String]]()
    var dataSectTitles = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        //api.APIcall()
        filteredData = data
        makeSections()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSectTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = dataSectTitles[section]
        if let fData = dataDict[key] {
            return fData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(data[indexPath.row])
        let sect = dataSectTitles[indexPath.section]
        let sectRow = dataDict[sect]![indexPath.row]
        print(sectRow)
        //print(dataSectTitles[indexPath.section])
        performSegue(withIdentifier: "toDetailScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewDetailController {
            //print(tempName)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        //cell.textLabel?.text = filteredData[indexPath.row]+"\(indexPath.section)"
        let key = dataSectTitles[indexPath.section]
        if let fData = dataDict[key] {
            cell.textLabel?.text = fData[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSectTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return dataSectTitles
    }
    
    func makeSections() {
        for fData in filteredData {
            let key = String(fData.prefix(1))
            if var d = dataDict[key] {
                d.append(fData)
                dataDict[key] = d
            } else {
                dataDict[key] = [fData]
            }
        }
        dataSectTitles = [String](dataDict.keys)
        dataSectTitles = dataSectTitles.sorted(by: { $0 < $1 })
    }
}

