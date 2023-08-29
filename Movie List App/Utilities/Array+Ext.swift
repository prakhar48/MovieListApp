//
//  Array+Ext.swift
//  Movie List App
//
//  Created by Prakhar Pandey on 29/08/23.
//

import Foundation

extension Array {
    mutating func modifyElement(atIndex index: Index, _ modifyElement: (_ element: inout Element) -> ()) {
        var element = self[index]
        modifyElement(&element)
        self[index] = element
    }
}
