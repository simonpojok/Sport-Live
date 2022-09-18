//
//  MainTabViewController.swift
//  SportLive
//
//  Created by Simon Peter Ojok on 13/09/2022.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureViewControllers()
    }
    
    private func configureViewControllers(){
        let scheduledEventsViewController = templateNavigationController(
            unselectedImage: UIImage(systemName: "calendar.badge.clock"),
            selectedImage: UIImage(systemName: "calendar.badge.clock"),
            rootViewController: ScheduledEventsViewController(
                scheduleEventsViewModel: ScheduledEventsViewModel()
            )
        )
        
        let pastEventsViewController = templateNavigationController(
            unselectedImage: UIImage(systemName: "square.fill"),
            selectedImage: UIImage(systemName: "square.fill"),
            rootViewController: PastEventsViewController(
                viewModel: PastEventsViewModel()
            )
        )
        
        viewControllers = [pastEventsViewController, scheduledEventsViewController]
    }
    
    private func templateNavigationController(
        unselectedImage: UIImage?,
        selectedImage: UIImage?,
        rootViewController: UIViewController
    ) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.navigationBar.tintColor = .black
        navigationController.tabBarItem.image = unselectedImage
        navigationController.tabBarItem.selectedImage = selectedImage
        
        return navigationController
    }

}
