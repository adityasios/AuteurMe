//
//  DetailViewController.swift
//  AuteurMe
//
//  Created by Rakhi on 15/12/18.
//  Copyright © 2018 Rakhi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedAuteur: Auteur!
    let moreInfoText = "Tap For Details >"
    @IBOutlet weak var tableView: UITableView!
    
    // MARK:-  VC LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedAuteur.name
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedAuteur.films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmTableViewCell", for: indexPath) as! FilmTableViewCell
        let film = selectedAuteur.films[indexPath.row]
        
        cell.filmTitleLabel.text = film.title
        cell.filmTitleLabel.textColor = .white
        cell.filmTitleLabel.textAlignment = .center
        
        cell.filmImageView.image = UIImage(named: film.poster)
        
        cell.moreInfoTextView.textColor = .red
        cell.selectionStyle = .none
        
        
        cell.moreInfoTextView.text = film.isExpanded ? film.plot : moreInfoText
        cell.moreInfoTextView.textAlignment = film.isExpanded ? .left : .center
        cell.moreInfoTextView.textColor = film.isExpanded ?
            UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0) :
            .red

        
        return cell
    }
}



extension DetailViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? FilmTableViewCell else {
            return
        }
        var film = selectedAuteur.films[indexPath.row]
        
        film.isExpanded = !film.isExpanded
        selectedAuteur.films[indexPath.row] = film
        
        cell.moreInfoTextView.text = film.isExpanded ? film.plot : moreInfoText
        cell.moreInfoTextView.textAlignment = film.isExpanded ? .left : .center
        cell.moreInfoTextView.textColor = film.isExpanded ?UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0) : .red
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        
    }
}



