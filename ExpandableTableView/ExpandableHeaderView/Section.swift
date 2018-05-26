//
//  Section.swift
//  ExpandableTableView
//
//  Created by EthanLin on 2018/5/26.
//  Copyright © 2018 EthanLin. All rights reserved.
//

import Foundation

class Section {
    var genre:String
    var movies:[String]
    var expanded:Bool
    init(genre:String,movies:[String],expanded:Bool) {
        self.genre = genre
        self.movies = movies
        self.expanded = expanded
    }
}
