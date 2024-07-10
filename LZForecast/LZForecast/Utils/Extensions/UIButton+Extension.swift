//
//  UIButton+Extension.swift
//  LZForecast
//
//  Created by user on 7/11/24.
//

import UIKit

extension UIButton {
    var config: UIButton.Configuration {
        return self.configuration ?? UIButton.Configuration.plain()
    }
    
    func image(named: String) -> Self {
        var config = self.config
        config.image = UIImage(named: named)
        
        self.configuration = config
        return self
    }
    
    func image(systemName: String) -> Self {
        var config = self.config
        config.image = UIImage(systemName: systemName)
        
        self.configuration = config
        return self
    }
}
