//
//  HomeViewController.swift
//  Foody - UIKit
//
//  Created by Luka Podrug on 05.09.2023..
//

import UIKit

class HomeViewController: UIViewController {
    var mealCategoriesMenuOptions: [String] = []
    var mealAreasMenuOptions: [String] = []
    
    var activeMealCategoryOption: Int = 0
    var activeMealAreaOption: Int = 0
    
    var mealsByCategory: [MealSummary] = []
    var mealsByArea: [MealSummary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeView = self.view as! HomeView
        
        getMealCategories()
        
        homeView.categoryMenuCollectionView.dataSource = self
        homeView.categoryMenuCollectionView.delegate = self
        homeView.categoryMenuCollectionView.register(UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")

        homeView.categoryMealCollectionView.dataSource = self
        homeView.categoryMealCollectionView.delegate = self
        homeView.categoryMealCollectionView.register(UINib(nibName: "MealCell", bundle: nil), forCellWithReuseIdentifier: "MealCell")
        
        getMealAreas()
        
        homeView.areaMenuCollectionView.dataSource = self
        homeView.areaMenuCollectionView.delegate = self
        homeView.areaMenuCollectionView.register(UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        
        homeView.areaMealCollectionView.dataSource = self
        homeView.areaMealCollectionView.delegate = self
        homeView.areaMealCollectionView.register(UINib(nibName: "MealCell", bundle: nil), forCellWithReuseIdentifier: "MealCell")
    }
    
    func getMealCategories() {
        let homeView = self.view as! HomeView
        
        APIManager.shared.getMealCategoriesList() { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    response.forEach({ mealCategory in
                        self.mealCategoriesMenuOptions.append(mealCategory.category)
                    })
                    homeView.categoryMenuCollectionView.animatedReload()
                    self.getMealsByCategoryName()
                case .failure:
                    //self.presentAlertVC(title: "Error", message: "Unable to fetch games")
                    print("Error with fetching meal categories")
                }
            }
        }
    }
    
    func getMealAreas() {
        let homeView = self.view as! HomeView
        
        APIManager.shared.getMealAreasList() { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    response.forEach({ mealArea in
                        self.mealAreasMenuOptions.append(mealArea.area)
                    })
                    homeView.areaMenuCollectionView.animatedReload()
                    self.getMealsByAreaName()
                case .failure:
                    //self.presentAlertVC(title: "Error", message: "Unable to fetch games")
                    print("Error with fetching meal areas")
                }
            }
        }
    }
    
    func getMealsByCategoryName() {
        let homeView = self.view as! HomeView

        APIManager.shared.getMealListByCategoryName(name: mealCategoriesMenuOptions[activeMealCategoryOption]) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.mealsByCategory = response
                    homeView.categoryMealCollectionView.animatedReload()
                case .failure:
                    //self.presentAlertVC(title: "Error", message: "Unable to fetch games")
                    print("Error with fetching meals by category name")
                }
            }
        }
    }
    
    func getMealsByAreaName() {
        let homeView = self.view as! HomeView
        
        APIManager.shared.getMealListByAreaName(name: mealAreasMenuOptions[activeMealAreaOption]) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.mealsByArea = response
                    homeView.areaMealCollectionView.animatedReload()
                case .failure:
                    //self.presentAlertVC(title: "Error", message: "Unable to fetch games")
                    print("Error with fetching meals by area name")
                }
            }
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let homeView = self.view as! HomeView
        
        var numberOfItems: Int = 0
        
        if collectionView == homeView.categoryMenuCollectionView {
            numberOfItems = mealCategoriesMenuOptions.count
        }
        else if collectionView == homeView.categoryMealCollectionView {
            numberOfItems = mealsByCategory.count
        }
        else if collectionView == homeView.areaMenuCollectionView {
            numberOfItems =  mealAreasMenuOptions.count
        }
        else if collectionView == homeView.areaMealCollectionView {
            numberOfItems =  mealsByArea.count
        }
        
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let homeView: HomeView = self.view as! HomeView
        
        var cell: UICollectionViewCell = UICollectionViewCell()
        
        if collectionView == homeView.categoryMenuCollectionView {
            cell = categoryMenuCellCustomization(homeView: homeView, indexPath: indexPath)
        }
        else if collectionView == homeView.categoryMealCollectionView {
            cell = categoryMealCellCustomization(homeView: homeView, indexPath: indexPath)
        }
        else if collectionView == homeView.areaMenuCollectionView {
            cell = areaMenuCellCustomization(homeView: homeView, indexPath: indexPath)
        }
        else if collectionView == homeView.areaMealCollectionView {
            cell = areaMealCellCustomization(homeView: homeView, indexPath: indexPath)
        }
        
        return cell
    }
    
    func categoryMenuCellCustomization(homeView: HomeView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MenuCell = homeView.categoryMenuCollectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        let menuItem: String = mealCategoriesMenuOptions[indexPath.row]
        
        cell.menuItemLabel.text = menuItem
        
        cell.backgroundColor = .lightGray.withAlphaComponent(Constants.shared.mealCellBackgroundImageAlphaComponent)
        cell.menuItemLabel.textColor = .black
        if indexPath.row == activeMealCategoryOption {
            cell.backgroundColor = .systemBlue
            cell.menuItemLabel.textColor = .white
        }
        
        return cell
    }
    
    func categoryMealCellCustomization(homeView: HomeView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MealCell = homeView.categoryMealCollectionView.dequeueReusableCell(withReuseIdentifier: "MealCell", for: indexPath) as! MealCell
        
        let meal = mealsByCategory[indexPath.row]
        
        let labelSize = UILabel().calculateWidth(text: meal.name, font: .systemFont(ofSize: Constants.shared.mealCellNameLabelFontSize))
        
        cell.mealNameLabel.text = meal.name

        cell.mealNameLabel.numberOfLines = 100
        cell.mealNameLabel.constraints.forEach({ constraint in
            constraint.isActive = false
        })
        
        if labelSize.width + Constants.shared.mealCellNameLabelLeftInset + Constants.shared.mealCellNameLabelRightInset > cell.frame.width {
            cell.mealNameLabel.widthAnchor.constraint(equalToConstant: labelSize.width / 2 + Constants.shared.mealCellNameLabelLeftInset + Constants.shared.mealCellNameLabelRightInset).isActive = true
            cell.mealNameLabel.heightAnchor.constraint(equalToConstant: 2 * labelSize.height + Constants.shared.mealCellNameLabelTopInset + Constants.shared.mealCellNameLabelBottomInset).isActive = true
        }
        else {
            cell.mealNameLabel.widthAnchor.constraint(equalToConstant: labelSize.width + Constants.shared.mealCellNameLabelLeftInset + Constants.shared.mealCellNameLabelRightInset).isActive = true
            cell.mealNameLabel.heightAnchor.constraint(equalToConstant: labelSize.height + Constants.shared.mealCellNameLabelTopInset + Constants.shared.mealCellNameLabelBottomInset).isActive = true
        }
        
        let backgroundImageView: UIImageView = UIImageView()
        backgroundImageView.loadImageFromURL(url: URL(string: meal.thumbnailUrl)!)
        
        cell.backgroundView = backgroundImageView
        
        return cell
    }
    
    func areaMenuCellCustomization(homeView: HomeView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MenuCell = homeView.areaMenuCollectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        let menuItem: String = mealAreasMenuOptions[indexPath.row]
        
        cell.menuItemLabel.text = menuItem
        
        cell.backgroundColor = .lightGray.withAlphaComponent(Constants.shared.mealCellBackgroundImageAlphaComponent)
        cell.menuItemLabel.textColor = .black
        if indexPath.row == activeMealAreaOption {
            cell.backgroundColor = .systemGreen
            cell.menuItemLabel.textColor = .white
        }
        
        return cell
    }
    
    func areaMealCellCustomization(homeView: HomeView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MealCell = homeView.areaMealCollectionView.dequeueReusableCell(withReuseIdentifier: "MealCell", for: indexPath) as! MealCell
        
        let meal = mealsByArea[indexPath.row]
        
        let labelSize = UILabel().calculateWidth(text: meal.name, font: .systemFont(ofSize: Constants.shared.mealCellNameLabelFontSize))
        
        cell.mealNameLabel.text = meal.name

        cell.mealNameLabel.numberOfLines = 100
        cell.mealNameLabel.constraints.forEach({ constraint in
            constraint.isActive = false
        })

        if labelSize.width + Constants.shared.mealCellNameLabelLeftInset + Constants.shared.mealCellNameLabelRightInset > cell.frame.width {
            cell.mealNameLabel.widthAnchor.constraint(equalToConstant: labelSize.width / 2 + Constants.shared.mealCellNameLabelLeftInset + Constants.shared.mealCellNameLabelRightInset).isActive = true
            cell.mealNameLabel.heightAnchor.constraint(equalToConstant: 2 * labelSize.height + Constants.shared.mealCellNameLabelTopInset + Constants.shared.mealCellNameLabelBottomInset).isActive = true
        }
        else {
            cell.mealNameLabel.widthAnchor.constraint(equalToConstant: labelSize.width + Constants.shared.mealCellNameLabelLeftInset + Constants.shared.mealCellNameLabelRightInset).isActive = true
            cell.mealNameLabel.heightAnchor.constraint(equalToConstant: labelSize.height + Constants.shared.mealCellNameLabelTopInset + Constants.shared.mealCellNameLabelBottomInset).isActive = true
        }
        
        let backgroundImageView: UIImageView = UIImageView()
        backgroundImageView.loadImageFromURL(url: URL(string: meal.thumbnailUrl)!)
        
        cell.backgroundView = backgroundImageView
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let homeView: HomeView = self.view as! HomeView
        
        if collectionView == homeView.categoryMenuCollectionView {
            if activeMealCategoryOption != indexPath.row {
                activeMealCategoryOption = indexPath.row
                homeView.categoryMenuCollectionView.animatedReload()
                getMealsByCategoryName()
                homeView.categoryMealCollectionView.setContentOffset(CGPoint(x: Constants.shared.mealCellReloadXOffset, y: 0), animated: true)
            }
        }
        else if collectionView == homeView.categoryMealCollectionView {
            openMealDetailsModal(meal: mealsByCategory[indexPath.row])
        }
        else if collectionView == homeView.areaMenuCollectionView {
            if activeMealAreaOption != indexPath.row {
                activeMealAreaOption = indexPath.row
                homeView.areaMenuCollectionView.animatedReload()
                getMealsByAreaName()
                homeView.areaMealCollectionView.setContentOffset(CGPoint(x: Constants.shared.mealCellReloadXOffset, y: 0), animated: true)
            }
        }
        else if collectionView == homeView.areaMealCollectionView {
            openMealDetailsModal(meal: mealsByArea[indexPath.row])
        }
    }
    
    func openMealDetailsModal(meal: MealSummary) {
        let mealDetailsViewController: MealDetailsViewController = MealDetailsViewController(meal: meal)
        
        navigationController?.present(mealDetailsViewController, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let homeView: HomeView = self.view as! HomeView
        
        var size: CGSize = CGSize(width: 0, height: 0)
        
        if collectionView == homeView.categoryMenuCollectionView {
            let labelSize = UILabel().calculateWidth(text: mealCategoriesMenuOptions[indexPath.row], font: .boldSystemFont(ofSize: Constants.shared.menuCellItemLabelFontSize))
            
            size = CGSize(width: labelSize.width + abs(Constants.shared.menuCellItemLabelLeadingAnchorConstraint) + abs(Constants.shared.menuCellItemLabelTrailingAnchorConstraint), height: labelSize.height + abs(Constants.shared.menuCellItemLabelTopAnchorConstraint) + abs(Constants.shared.menuCellItemLabelBottomAnchorConstraint))
        }
        else if collectionView == homeView.categoryMealCollectionView {
            size = CGSize(width: homeView.categoryMealCollectionView.frame.height - Constants.shared.mealCollectionViewRightInset - Constants.shared.mealCollectionViewLeftInset, height: homeView.categoryMealCollectionView.frame.height)
        }
        else if collectionView == homeView.areaMenuCollectionView {
            let labelSize = UILabel().calculateWidth(text: mealAreasMenuOptions[indexPath.row], font: .boldSystemFont(ofSize: Constants.shared.menuCellItemLabelFontSize))
            
            size = CGSize(width: labelSize.width + abs(Constants.shared.menuCellItemLabelLeadingAnchorConstraint) + abs(Constants.shared.menuCellItemLabelTrailingAnchorConstraint), height: labelSize.height + abs(Constants.shared.menuCellItemLabelTopAnchorConstraint) + abs(Constants.shared.menuCellItemLabelBottomAnchorConstraint))
        }
        else if collectionView == homeView.areaMealCollectionView {
            size = CGSize(width: homeView.categoryMealCollectionView.frame.height - Constants.shared.mealCollectionViewRightInset - Constants.shared.mealCollectionViewLeftInset, height: homeView.categoryMealCollectionView.frame.height)
        }
        
        return size
    }
}
