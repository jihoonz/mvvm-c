//
//  OnboardingViewModel.swift
//  FinUp.Chat.iOS.Mvvmc
//
//  Created by FINUP on 2022/03/01.
//

import Foundation
import Combine

class OnboardingViewModel: BaseViewModel<OnboardingCoordinator> {
    let bindingSubject = PassthroughSubject<Int, Error>()
    
    var updateModel: VersionUpdateModel?
    
    func checkApplicationNeedUpdate() {
        APIService.loadUpdateVersion { [weak self] data, response, error in
            guard let resultData = data else { return }
            guard let resultDict: [String : Any?] = try? JSONSerialization.jsonObject(with: resultData, options: []) as? [String : Any?] else { return }
            
            let dataModel: ApiResultModel = ApiResultModel(dictionary: resultDict)
            
            if dataModel.result1.isEmpty == true {
                self?.bindingSubject.send(1)
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
}
