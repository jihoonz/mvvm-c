//
//  SplashViewController.swift
//  FinUp.Chat.iOS.Mvvmc
//
//  Created by FINUP on 2022/03/01.
//

import UIKit
import Combine

class SplashViewController: BaseViewController<SplashViewModel> {
    @IBOutlet weak var splashImageView: UIImageView!
    
    let splashImagesArray: [UIImage] = {
        var images: [UIImage] = []
        
        if let image6 = UIImage(named: "imgIconStock06") {
            images.append(image6)
        }
        if let image1 = UIImage(named: "imgIconStock01") {
            images.append(image1)
        }
        if let image2 = UIImage(named: "imgIconStock02") {
            images.append(image2)
        }
        if let image3 = UIImage(named: "imgIconStock03") {
            images.append(image3)
        }
        if let image4 = UIImage(named: "imgIconStock04") {
            images.append(image4)
        }
        if let image5 = UIImage(named: "imgIconStock05") {
            images.append(image5)
        }
        if let image6 = UIImage(named: "imgIconStock06") {
            images.append(image6)
            images.append(image6)
            images.append(image6)
        }
        
        return images
    }()
 
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
            self.viewModel?.loadRoutingData()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnimation()
        bindingDate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
                self.viewModel?.startOnboarding()
            }
            if value == 2 {
                self.viewModel?.checkApplicationNeedUpdate()
            }
            if value == 3 {
                self.viewModel?.displayHomeTabController()
            }
        }).store(in: &cancelStore)
    }
    
    //MARK:  ------------------------ LOADING_ANIMATION
    func setAnimation() {
        splashImageView.animationImages = splashImagesArray
        splashImageView.animationDuration = 1.6
        splashImageView.startAnimating()
    }
}
