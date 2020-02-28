//
//  MasterViewController.swift
//  NhiQuery
//
//  Created by KaeJer Cho on 2020/2/26.
//  Copyright © 2020 KaeJer Cho. All rights reserved.
//

import UIKit
class MasterViewController: UITableViewController, UISearchResultsUpdating {
    
    var objects = [Service]()
    var filtered = [Service]()
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJson()
       
        
        let cellNib = UINib(nibName: ServiceTableViewCell.cellNibName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: ServiceTableViewCell.cellIdentifier)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        // Do any additional setup after loading the view.


    }

    func loadJson(){
        if let url = Bundle.main.url(forResource: "service_data", withExtension: "json") {
             do {
                 let data = try Data(contentsOf: url)
                 let result = try? JSONDecoder().decode(DataResponse.self, from: data)
                var ary = result?.data ?? [Service]()
                for (idx,item) in ary.enumerated() {
                    ary[idx].key = "\(item.service_code)/\(item.service_english)/\(item.service_chinese)/\(item.service_point)/\(item.service_note)/\(item.service_other)/\(item.service_from)"
                }
                objects = ary
                tableView.reloadData()
                } catch let err {
                    print("error:\(err)")
                }
             }
         }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }


    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filtered.count
        }
        else {
             return objects.count
        }
//        return result?.count ?? 0
       
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ServiceTableViewCell.cellIdentifier) as! ServiceTableViewCell
        let row = indexPath.row
        var service: Service!

        if searchController.isActive {
            service = filtered[row]
        }
        else {
            service = objects[row]
        }
        cell.code.text = service.service_code
        cell.english.text = service.service_english
        cell.chinese.text = service.service_chinese
        cell.point.text = service.service_point
        cell.period.text = "\(service.service_from) ～ 迄今"
        cell.note.text = service.service_note
        cell.other.text = service.service_other
        return cell
    }
    

    func updateSearchResults(for searchController: UISearchController) {
           let string = searchController.searchBar.text!
           if searchController.isActive {
               filtered = objects.filter({ (service: Service) -> Bool in
                   let isMatch = service.key?.lowercased().contains(string.lowercased())
           
                   if string != "" {
                    return isMatch ?? true
                   }
                   else {
                       return true
                   }
                       
                   }
            )
                tableView.reloadData()
           }
           else {
               filtered.removeAll(keepingCapacity: false)
               tableView.reloadData()
           }
       }
       


}

