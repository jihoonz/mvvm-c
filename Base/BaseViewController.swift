//
//  BaseViewController.swift
//  FinUp.Chat.iOS.Mvvmc
//
//  Created by FINUP on 2022/03/01.
//

import UIKit

protocol BaseViewControllerPolicy {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType? { get }
    var cancelStore: Set<AnyCancellable> { get }
}

class BaseViewController<T>: UIViewController, BaseViewControllerPolicy {
    typealias ViewModelType = T
    
    var viewModel: T?
    var cancelStore: Set<AnyCancellable> = Set<AnyCancellable>()
    
    func create(viewModel: T) -> UIViewController? {
        let name: String = String(describing: Self.self)
        let storyboard: UIStoryboard = UIStoryboard(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: name) as? BaseViewController
        
        vc?.viewModel = viewModel
        
        return vc
    }
}
