//
//  MainTabBarController.swift
//  TMSFinalProject-TeaTasting
//
//  Created by Наталья Мазур on 27.02.24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    private func setupTabBarController() {
        let mainViewController = MainViewController()
        let searchViewController = SearchViewController()
        let favouritesViewController = FavouritesViewController()
        let profileViewController = ProfileViewController()

        let homeImage = UIImage(systemName: "house.fill")
        let searchImage = UIImage(systemName: "magnifyingglass.circle.fill")
        let favouritesImage = UIImage(systemName: "heart.fill")
        let profileImage = UIImage(systemName: "person.crop.circle.fill")
        
        mainViewController.tabBarItem = UITabBarItem(title: "Главная", image: homeImage, tag: 0)
        searchViewController.tabBarItem = UITabBarItem(title: "Поиск", image: searchImage, tag: 1)
        favouritesViewController.tabBarItem = UITabBarItem(title: "Избранное", image: favouritesImage, tag: 2)
        profileViewController.tabBarItem = UITabBarItem(title: "Профиль", image: profileImage, tag: 3)

        viewControllers = [mainViewController, searchViewController, favouritesViewController, profileViewController]
        
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .systemYellow
        tabBar.backgroundColor = .systemRed
    }

}
