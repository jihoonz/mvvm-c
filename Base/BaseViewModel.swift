//
//  BaseViewModel.swift
//  FinUp.Chat.iOS.Mvvmc
//
//  Created by FINUP on 2022/03/01.
//

import UIKit

protocol BaseViewModelPolicy {
    associatedtype CoordinatorType
    var coordinator: CoordinatorType? { get }
}

class BaseViewModel<T>: BaseViewModelPolicy {
    typealias CoordinatorType = T
    
    var coordinator: CoordinatorType?
    
    init(viewFlow coordinator: T?) {
        self.coordinator = coordinator
    }
}
