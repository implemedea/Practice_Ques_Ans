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
       let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vcSearch = storyBoard.instantiateViewController(withIdentifier: "SearchResultViewController")
        self.present(vcSearch, animated: true, completion: nil)
    }
    
    
    
    
}

extension ViewController:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if((string.range(of: "1234567890")) != nil){
            return true
        }
        return false
    }
    
}
