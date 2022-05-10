//
//  AppCoordinator.swift
//  FinUp.Chat.iOS.Mvvmc
//
//  Created by FINUP on 2022/03/01.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    var window: UIWindow?
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.window = window
        super.init(navigationController: navigationController)
    }
    
    func startSpalshView() {
        let splashCoordinator: SplashCoordinator? = SplashCoordinator(navigationController: navigationController, window: window!)
        let splashViewModel: SplashViewModel = SplashViewModel(viewFlow: splashCoordinator)
        guard let splashView = SplashViewController().create(viewModel: splashViewModel) else {
            return
        }
        setRootViewController(splashView)
    }
    
    func startOnBoardingView() {
        let onBoardingCoordinator: OnboardingCoordinator? = OnboardingCoordinator(navigationController: navigationController, window: window!)
        let onboardingViewModel: OnboardingViewModel = OnboardingViewModel(viewFlow: onBoardingCoordinator)
        guard let onBoardingView = OnboardingViewController().create(viewModel: onboardingViewModel) else {
            return
        }
        setRootViewController(onBoardingView)
    }
    
    func startUpdateView() {
        let updateCoordiantor: UpdateCoordinator? = UpdateCoordinator(navigationController: navigationController)
        let updateViewModel: UpdateViewModel = UpdateViewModel(viewFlow: updateCoordiantor)
        guard let updateView = UpdateViewController().create(viewModel: updateViewModel) else {
            return
        }
        setRootViewController(updateView)
    }
    
    func startLoginView() {
        
    }
    
    func startTab() {
        
    }
}

extension AppCoordinator {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let rootWindow = window else {
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
            return
        }
        
        rootWindow.rootViewController = vc
        rootWindow.makeKeyAndVisible()
        
        UIView.transition(with: rootWindow,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
