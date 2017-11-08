//
//  articleCell.swift
//  table
//
//  Created by Gaurav Amrutiya on 08/11/17.
//  Copyright © 2017 Gaurav Amrutiya. All rights reserved.
//
//http://mrgott.com/swift-programing/33-rest-api-in-swift-4-using-urlsession-and-jsondecode
import UIKit

class articleCell: UITableViewCell {

    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    var article:Article? {
        didSet {
            titleLbl.text = article?.title
            descLbl.text = article?.description
        }
    }
}
