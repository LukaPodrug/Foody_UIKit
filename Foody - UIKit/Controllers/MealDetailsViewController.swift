//
//  MealDetailsViewController.swift
//  Foody - UIKit
//
//  Created by Luka Podrug on 08.09.2023..
//

import UIKit

class MealDetailsViewController: UIViewController {
    let meal: MealSummary
    var mealDetails: MealDetails
    
    init(meal: MealSummary) {
        self.meal = meal
        self.mealDetails = MealDetails()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mealDetailsView = self.view as! MealDetailsView
        
        mealDetailsView.mealIngredientsTableView.dataSource = self
        mealDetailsView.mealIngredientsTableView.delegate = self
        mealDetailsView.mealIngredientsTableView.register(UINib(nibName: "IngredientCell", bundle: nil), forCellReuseIdentifier: "IngredientCell")
        mealDetailsView.mealIngredientsTableView.isScrollEnabled = false
        
        getMealDetails()
    }
    
    func getMealDetails() {
        let mealDetailsView = self.view as! MealDetailsView
        
        APIManager.shared.getMealDetailsById(id: meal.id) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self.mealDetails = response
                    self.afterDetails()
                    mealDetailsView.mealIngredientsTableView.reloadData()
                case .failure:
                    //self.presentAlertVC(title: "Error", message: "Unable to fetch games")
                    print("Error with fetching meal details")
                }
            }
        }
    }
    
    func afterDetails() {
        let mealDetailsView = self.view as! MealDetailsView
        
        mealDetailsView.mealImageView.loadImageFromURL(url: URL(string: mealDetails.thumbnailUrl!)!)
        mealDetailsView.mealImageView.contentMode = .scaleAspectFill
        
        mealDetailsView.mealNameLabel.text = mealDetails.name
        mealDetailsView.mealNameLabel.sizeToFit()
        
        mealDetailsView.mealCategoryLabel.text = mealDetails.category
        mealDetailsView.mealCategoryLabel.sizeToFit()
        
        mealDetailsView.mealAreaLabel.text = mealDetails.area
        mealDetailsView.mealAreaLabel.sizeToFit()
        
        mealDetailsView.mealInstructionsTextView.text = mealDetails.instructions
        mealDetailsView.mealInstructionsTextView.sizeToFit()

        mealDetailsView.mealIngredientsTableView.widthAnchor.constraint(equalToConstant: mealDetailsView.frame.width).isActive = true
        mealDetailsView.mealIngredientsTableView.heightAnchor.constraint(equalToConstant: CGFloat(mealDetails.ingredients!.count * 50)).isActive = true
        
        let contentRect: CGRect = mealDetailsView.scrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        mealDetailsView.scrollView.contentSize = contentRect.size
        mealDetailsView.scrollView.contentSize = CGSize(width: mealDetailsView.frame.width, height: contentRect.height + CGFloat(mealDetails.ingredients!.count * 50) + 70)
    }
}

extension MealDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealDetails.ingredients!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mealDetailsView = self.view as! MealDetailsView
        
        let ingredient: String = mealDetails.ingredients![indexPath.row]
        let measure: String = mealDetails.measurements![indexPath.row]
        
        let cell = mealDetailsView.mealIngredientsTableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as! IngredientCell
        
        cell.ingredientImageView.loadImageFromURL(url: APIManager.shared.generateIngredientImageUrl(ingredientName: ingredient, thumbnail: true))
        cell.ingredientNameLabel.text = ingredient
        cell.ingredientMeasureLabel.text = measure
        
        cell.ingredientImageView.translatesAutoresizingMaskIntoConstraints = false
        cell.ingredientImageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 10).isActive = true
        cell.ingredientImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        cell.ingredientImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cell.ingredientNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.ingredientNameLabel.leadingAnchor.constraint(equalTo: cell.ingredientImageView.trailingAnchor, constant: 10).isActive = true
        cell.ingredientNameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        cell.ingredientMeasureLabel.translatesAutoresizingMaskIntoConstraints = false
        cell.ingredientMeasureLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -10).isActive = true
        cell.ingredientMeasureLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return cell
    }
}

extension MealDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
