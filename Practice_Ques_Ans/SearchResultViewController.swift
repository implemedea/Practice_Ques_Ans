//
//  SearchResultViewController.swift
//  Practice_Ques_Ans
//
//  Created by Sebastin on 10/15/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    //MARK:- IBOutlet
    @IBOutlet weak var tblviewSearchResult: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var aryResidence:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.isHidden = true
        self.serviceCall()
     
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
    
    //MARK:- IBAction
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func serviceCall(){
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        let service = serviceHandler.init(url: "https://swapi.co/api/planets/1/", method: "GET")
        
        service.serviceCallUsingGCD()
        
        service.callService { (response) in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                guard let response = response else{
                    return
                }
                self.aryResidence = response.residents
                self.tblviewSearchResult.reloadData()
            }
        }
        print("service called")
    }
}

extension SearchResultViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.aryResidence.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID:String = "cellid"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.textLabel?.text = self.aryResidence[indexPath.row]
        return cell!
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
