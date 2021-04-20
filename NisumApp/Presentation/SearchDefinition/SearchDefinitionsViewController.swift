//
//  SearchDefinitionsViewController.swift
//  NisumApp
//
//  Created by Josean Donato Jaulis Nina on 4/7/21.
//  Copyright © 2021 Josean Donato Jaulis Nina. All rights reserved.
//

import UIKit
import Foundation

protocol SearchDefinitionsView {
    func reloadTableview()
    func showEmptyResult()
}


class SearchDefinitionsViewController: UIViewController, SearchDefinitionsView {
    
    @IBOutlet weak var tvbDefinitions : UITableView!
    @IBOutlet weak var searchBar : UISearchBar!
    
    private var presenter : SearchDefinitionPresenter?
    
    private var isEmpty = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = SearchDefinitionPresenter()
        self.presenter?.addView(view: self)
        
        self.searchBar.delegate = self
    }
    
    
    func reloadTableview() {
        isEmpty = false
        tvbDefinitions.separatorStyle = .singleLine
        tvbDefinitions.reloadData()
    }
    
    func showEmptyResult() {
        isEmpty = true
        tvbDefinitions.separatorStyle = .none
        tvbDefinitions.reloadData()
    }
}

extension SearchDefinitionsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.isEmpty {
            return 1
        } else {
            return self.presenter?.lstDefinitions.count ?? 0 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.isEmpty {
            return tableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath)
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDefinitionCell", for: indexPath) as! ItemDefinitionCell
        let data = self.presenter?.lstDefinitions[indexPath.row]
        cell.lblDefinition.text = data?.lf
        cell.lblYear.text = "\(data!.since)"
        return cell
    }
    
    
    
}

extension SearchDefinitionsViewController : UITableViewDelegate {
    
}


extension SearchDefinitionsViewController : UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.presenter?.searchAllDefinitions(text: searchBar.text ?? "")
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return  true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.presenter?.searchAllDefinitions(text: searchBar.text ?? "")
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.presenter?.searchAllDefinitions(text: searchText)
    }
}

