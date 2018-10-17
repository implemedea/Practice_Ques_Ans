//
//  ViewController.swift
//  Practice_Ques_Ans
//
//  Created by Sebastin on 10/15/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFieldSearch: UITextField!
    @IBOutlet weak var lblOrientation: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        NotificationCenter.default.addObserver(self, selector: #selector(deviceOrientationDidChange), name:  UIDevice.orientationDidChangeNotification, object: nil)
        
        
        
       

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func imageTapped(_ sender: Any) {
        print("image tapped")
    }
    
    @objc func deviceOrientationDidChange(_ notification: Notification) {
        let orientation = UIDevice.current.orientation
        print(orientation)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if(UIDevice.current.orientation.isLandscape){
            self.lblOrientation.text = "landscape"
        }else{
            self.lblOrientation.text = "portrait"
        }
    }
    
    
    @IBAction func search(_ sender: Any) {
        if(self.txtFieldSearch.text == ""){
            let alert = UIAlertController(title: "ALert", message: "Please enter value to search", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
       let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vcSearch = storyBoard.instantiateViewController(withIdentifier: "SearchResultViewController")
        self.present(vcSearch, animated: true, completion: nil)
    }
    
    
    
    
}

extension ViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let set = CharacterSet(charactersIn: "0123456789").inverted
        let seperate = string.components(separatedBy: set)
        let join = seperate.joined(separator: "")
        return string == join
    }
    
}
