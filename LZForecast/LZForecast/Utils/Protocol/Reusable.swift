//
//  Reusable.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//
import UIKit

protocol Reusable { }

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reusable { }
extension UICollectionViewCell: Reusable { }
