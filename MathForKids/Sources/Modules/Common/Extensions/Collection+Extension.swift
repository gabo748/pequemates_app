//
//  Collection+Extension.swift
//  MathForKids
//
//  Created by Gabriel Campos on 5/5/25.

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
