//
//  ViewController.swift
//  News
//
//  Created by Emir Keleş on 31.05.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var newsTableViewModel : NewsTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        veriAl()
    }
    
    func veriAl() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        Webservice().downloadNews(url: url!) { haberler in
            if let haberler = haberler {
                self.newsTableViewModel = NewsTableViewModel(newsList: haberler)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0: self.newsTableViewModel.numberOfRowsInSection()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(index: indexPath.row)
        cell.titleLabel.text = newsViewModel.title
        cell.storyLabel.text = newsViewModel.story
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

