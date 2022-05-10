//
//  OnboardingViewController.swift
//  FinUp.Chat.iOS.Mvvmc
//
//  Created by FINUP on 2022/03/01.
//

import UIKit

class OnboardingViewController: BaseViewController<OnboardingViewModel> {

    @IBOutlet weak var goToButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToButtonClicked(_ sender: Any) {
        viewModel?.checkApplicationNeedUpdate()
        bindingDate()
    }
    
    private func bindingDate() {
        _ = viewModel?.bindingSubject.sink(receiveCompletion: { result in
            switch result {
            case .finished:
                break
            case .failure(let error):
                print("failure: \(error)")
                break
            }
        }, receiveValue: { value in
            print(value)
            if value == 1 {
                self.viewModel?.displayHomeTabController()
            }
        }).store(in: &cancelStore)
    }
}
