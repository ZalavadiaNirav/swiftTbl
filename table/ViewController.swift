//
//  ViewController.swift
//  table
//
//  Created by Gaurav Amrutiya on 08/11/17.
//  Copyright © 2017 Gaurav Amrutiya. All rights reserved.


import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tbl: UITableView!
    var articleArr:[Article]?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tbl.delegate=self;
        tbl.dataSource=self;
        self.callApi()
    
    }
    
    func callApi()
    {
        let url=URL(string:"https://swift.mrgott.pro/blog.json")!
        URLSession.shared.dataTask(with:url){ (data,response,error) in
            if error != nil
            {
                print(error!.localizedDescription)
            }
            guard let data = data else { return }
            do
            {
                let articleData = try JSONDecoder().decode([Article].self,from:data)
                DispatchQueue.main.async
                {
                    self.articleArr=articleData
                    print("article \(articleData)")
                    self.tbl.reloadData()
                }
            }
            catch let jsonerror
            {
                print(jsonerror)
            }
        }.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //we check that articlearr count > 0
        return self.articleArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell") as! articleCell
        cell.article=articleArr?[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

