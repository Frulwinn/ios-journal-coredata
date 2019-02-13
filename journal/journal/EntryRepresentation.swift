//
//  EntryRepresentation.swift
//  journal
//
//  Created by Lambda_School_Loaner_34 on 2/13/19.
//  Copyright © 2019 Frulwinn. All rights reserved.
//

import Foundation

struct EntryRepresentation: Codable, Equatable {
    
    var title: String
    var bodyText: String
    var mood: String
    var timestamp: String
    var identifier: String
    
}

func ==(lhs: EntryRepresentation, rhs: Entry) -> Bool {
    return rhs == lhs
}

func !=(lhs: EntryRepresentation, rhs: Entry) -> Bool {
    return !(rhs == lhs)
}

func ==(lhs: Entry, rhs: EntryRepresentation) -> Bool {
    return rhs != lhs
}
