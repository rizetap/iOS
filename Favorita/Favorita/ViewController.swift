//
//  ViewController.swift
//  Favorita
//
//  Created by Perizat Muratova on 29.11.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    private let cellIdentifier = "FavoriteItemCell"
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
    }
    
    // MARK: - Setup Methods
    
    private func setupNavigationBar() {
        title = "My Favorites"
        
        // Configure navigation bar appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Optional: Add a nice color scheme
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.systemBackground
            appearance.largeTitleTextAttributes = [
                .foregroundColor: UIColor.label,
                .font: UIFont.boldSystemFont(ofSize: 34)
            ]
            
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
    
    private func setupTableView() {
        // Register the custom cell
        tableView.register(FavoriteItemCell.self, forCellReuseIdentifier: cellIdentifier)
        
        // Set delegates
        tableView.delegate = self
        tableView.dataSource = self
        
        // Configure table view appearance
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 140
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        // Add some spacing between sections
        tableView.sectionHeaderHeight = 44
        tableView.sectionFooterHeight = 0
        
        // Optional: Remove extra separators at bottom
        tableView.tableFooterView = UIView()
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FavoriteItemCell else {
            return UITableViewCell()
        }
        
        // Get the appropriate item based on section and row
        let items = FavoritesData.items(for: indexPath.section)
        let item = items[indexPath.row]
        
        // Configure the cell
        cell.configure(with: item)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return FavoritesData.sectionTitles[section]
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    // Optional: Custom section header view for better design
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.systemGroupedBackground
        
        let titleLabel = UILabel()
        titleLabel.text = FavoritesData.sectionTitles[section]
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = UIColor.label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    // Optional: Add slight animation when cells appear
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 0.3) {
            cell.alpha = 1
        }
    }
    
    // Optional: Handle cell selection (if you want to add detail view later)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // You can add navigation to detail view here in the future
        let items = FavoritesData.items(for: indexPath.section)
        let item = items[indexPath.row]
        print("Selected: \(item.title)")
    }
}
