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
        initFunction()
        setUI()
    }
    
    
    // MARK:-  INIT
    func initFunction()  {
        tblv.rowHeight = UITableViewAutomaticDimension
        tblv.estimatedRowHeight = 500
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        let index = tblv.indexPathForSelectedRow
        destination.selectedAuteur = auteurs[(index?.row)!]
    }
    
    
    
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController,
            let indexPath = tblv.indexPathForSelectedRow {
            destination.selectedAuteur = auteurs[indexPath.row]
        }
    }*/
}


extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return auteurs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let authCell : AuteurTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!  AuteurTableViewCell
        let auteur = auteurs[indexPath.row]
        authCell.lblbio.text = auteur.bio
        
        authCell.auteurImageView.layer.cornerRadius = authCell.auteurImageView.frame.size.width / 2
        authCell.auteurImageView.image = UIImage(named: auteur.image)
        authCell.nameLabel.text = auteur.name
        authCell.source.text = auteur.source
        
        
        authCell.nameLabel.textColor = .white
        authCell.lblbio.textColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
        authCell.source.textColor = UIColor(red:0.74, green:0.74, blue:0.74, alpha:1.0)
        authCell.source.font = UIFont.italicSystemFont(ofSize: authCell.source.font.pointSize)
        authCell.nameLabel.textAlignment = .center
        authCell.selectionStyle = .none


        return authCell
    }
}









