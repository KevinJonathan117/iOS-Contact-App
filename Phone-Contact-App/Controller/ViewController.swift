//
//  ViewController.swift
//  Phone-Contact-App
//
//  Created by IOS on 09/10/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = [String]()
    var filteredData: [String]!
    var dataDict = [String: [String]]()
    var dataSectTitles = [String]()
    var myContacts = [Contact]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        APIcall()
    }
    //call API
    func APIcall() {
        let contactURL = "https://randomuser.me/api/?results=20"
        let request = NSMutableURLRequest(url: NSURL(string: contactURL)! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
                    request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: handle(data: response: error:))
        task.resume()
    }

    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error ?? "")
        }
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse ?? "")
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString ?? "")
            self.parseJSON(contactData: safeData)
        }
    }
    
    func parseJSON(contactData: Data)  {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(ContactData.self, from: contactData)
            DispatchQueue.main.async {
                for i in 0...19 {
                    let myContact = Contact(name: String(decodeData.results[i].name.first + " " + decodeData.results[i].name.last), dob: String(decodeData.results[i].dob.date), email: String(decodeData.results[i].email), cell: String(decodeData.results[i].cell), country: String(decodeData.results[i].location.country))
                    self.myContacts.append(myContact)
                    self.data.append(self.myContacts[i].name)
                }
                self.filteredData = self.data
                self.makeSections()
                print(self.myContacts[19].name)
                //print(decodeData.results[10].name.first)
                self.tableView.reloadData()
            }
        } catch {
            print(error)
        }
    }
    //layout
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
        let sect = dataSectTitles[indexPath.section]
        let sectRow = dataDict[sect]![indexPath.row]
        print(sectRow)
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
        print("hello")
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

