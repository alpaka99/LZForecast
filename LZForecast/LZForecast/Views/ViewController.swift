//
//  ViewController.swift
//  LZForecast
//
//  Created by user on 7/10/24.
//

import UIKit

class ViewController: BaseViewController<BaseView> {
    
    let viewModel = ViewControllerViewModel()
    
    override func configureNavigationItem() {
        super.configureNavigationItem()
        
        navigationItem.title = "LZForecast"
        let barButton = UIBarButtonItem(
            title: "탭",
            style: .plain,
            target: self,
            action: #selector(rightbarButtonTapped)
        )
        
        navigationItem.rightBarButtonItem = barButton
    }
    
    override func bindData() {
        super.bindData()
        
        viewModel.outputNavigationTitle.bind { [weak self] value in
            guard let vc = self else { return }
            vc.navigationItem.title = value
        }
        
        viewModel.outputBackgroundColor.bind { [weak self] value in
            guard let vc = self else { return }
            vc.baseView.backgroundColor = value
        }
    }
    
    @objc
    private func rightbarButtonTapped() {
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.viewModel.inputBoolValue.value.toggle()
        }
    }
}

final class ViewControllerViewModel {
    var inputBoolValue = Observable(true)
    var outputNavigationTitle = Observable("LZForecast")
    var outputBackgroundColor = Observable(UIColor.orange)
    
    init() {
        chageViewUI()
    }
    
    func chageViewUI() {
        inputBoolValue.bind { [weak self] flag in
            guard let vm = self else { return }
            
            if flag {
                vm.outputNavigationTitle.value = "LZForecast"
                vm.outputBackgroundColor.value = .systemOrange
            } else {
                vm.outputNavigationTitle.value = "레츠의 기상예측"
                vm.outputBackgroundColor.value = .systemIndigo
            }
        }
    }
}
