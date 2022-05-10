//
//  SplashViewModel.swift
//  FinUp.Chat.iOS.Mvvmc
//
//  Created by FINUP on 2022/03/01.
//

import Foundation
import Combine

class SplashViewModel: BaseViewModel<SplashCoordinator> {
    let bindingSubject = PassthroughSubject<Int, Error>()
    
    var updateModel: VersionUpdateModel?
    
    func loadRoutingData() {
        APIService.loadRoutingData(completion: { [weak self] (data, response, error) in
            guard let resultData = data else { return }
            guard let resultDict: [String : Any?] = try? JSONSerialization.jsonObject(with: resultData, options: []) as? [String : Any?] else { return }
            let dataModel: ApiResultModel = ApiResultModel(dictionary: resultDict)
            let serverRoutingModel = ServerRoutingModel(apiModel: dataModel)
            
            AppInfoStorage.shared.currentServerType = serverRoutingModel.typeServer
            AppInfoStorage.shared.routingIP = serverRoutingModel.ip
            
            self?.bindingSubject.send(1)
        })
    }
    
    func startOnboarding() {
        if Storage.isFirstTime() {
            displayOnBoardingViewController()
        } else {
            self.bindingSubject.send(2)
        }
    }
    
    func checkApplicationNeedUpdate() {
        APIService.loadUpdateVersion { [weak self] data, response, error in
            guard let resultData = data else { return }
            guard let resultDict: [String : Any?] = try? JSONSerialization.jsonObject(with: resultData, options: []) as? [String : Any?] else { return }
            
            let dataModel: ApiResultModel = ApiResultModel(dictionary: resultDict)
            
            if dataModel.result1.isEmpty == true {
                self?.bindingSubject.send(3)
            } else {
                guard let firstModel = dataModel.result1.first else { return }
                let updateModel: VersionUpdateModel = VersionUpdateModel(dictionary: firstModel)
                self?.displayUpdateViewController(updateModel: updateModel)
            }
        }
    }
    func displayHomeTabController() {
        coordinator?.startTab()
    }
    
    func displayUpdateViewController(updateModel: VersionUpdateModel) {
        coordinator?.startUpdateView()
    }
    
    func displayOnBoardingViewController() {
        coordinator?.startOnBoardingView()
    }
}
