//
//  ViewController.swift
//  AuteurMe
//
//  Created by Rakhi on 13/12/18.
//  Copyright © 2018 Rakhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let auteurs = Auteur.auteursFromBundle()
    @IBOutlet var tblv: UITableView!
    
    // MARK:-  VC LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    // MARK:-  INIT
    func initFunction()  {
        
    }
    
    // MARK:-  SET UI
    func setUI()  {
        let myAttribute = [NSAttributedStringKey.foregroundColor: UIColor.blue,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 22)]
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.largeTitleTextAttributes = myAttribute
            navigationItem.largeTitleDisplayMode = .automatic
        } else {
            navigationController?.navigationBar.titleTextAttributes = myAttribute
        }
        
    }
    
}


extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return auteurs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let auteur = auteurs[indexPath.row]
        cell.textLabel?.text = auteur.bio
        return cell
    }
}










/*
let myAttribute = [NSAttributedStringKey.foregroundColor: UIColor.blue,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 22)]
navigationController?.navigationBar.largeTitleTextAttributes = myAttribute
navigationItem.largeTitleDisplayMode = .automatic
*/
