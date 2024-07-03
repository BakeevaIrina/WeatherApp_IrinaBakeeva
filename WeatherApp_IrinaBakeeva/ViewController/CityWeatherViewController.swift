//
//  CityWeatherViewController.swift
//  WeatherApp_IrinaBakeeva
//
//  Created by Irina Marmyl on 5/28/24.
//

import UIKit
import SnapKit
import SafariServices
import WebKit

final class CityWeatherViewController: UIViewController {
    private enum Constants {
        static let titleText = "Weather"
        static let textPlaceholder = " Search city or airport"
        static let titleInfo = "Show Info"
        static let link = "https://meteoinfo.ru/t-scale"
    }
    
    private let titleLabel = UILabel()
    private let textField = UISearchTextField()
    private let placeView = PlaceView()
    private let unitSelectionView = UnitSelectionView()
    private let showHideButton = UIButton()
    private let showInfoButton = UIButton()
    private let searchResultsController = SearchResultViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundCity
    
        setupNavigationBar()
        setupPlaceView()
        setupUnitSelectionView()
        setupShowInfoButton()
        setupSearchController()
        
    }
    
    private func setupNavigationBar() {
        title = Constants.titleText
        
        let navigationBar = navigationController?.navigationBar
        navigationBar?.prefersLargeTitles = true
        navigationBar?.largeTitleTextAttributes = [.foregroundColor:UIColor.white]
        navigationBar?.barStyle = .black
        navigationBar?.tintColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemSymbol: .ellipsisCircle),
            style: .plain,
            target: self, 
            action: #selector(onBarButtonTap))
    }
    
    @IBAction private func onBarButtonTap() {
        unitSelectionView.isHidden.toggle()
    }
    
    private func setupSearchController() {
        let searchResultsController = SearchResultViewController()
        let searchController = UISearchController(searchResultsController: searchResultsController)
        searchController.searchResultsUpdater = searchResultsController
        searchController.showsSearchResultsController = true
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let searchTextField = navigationItem.searchController?.searchBar.searchTextField
        searchTextField?.placeholder = Constants.textPlaceholder
        searchTextField?.tintColor = .red
        
        searchController.searchBar.setImage(UIImage(systemSymbol: .listBullet), for: .bookmark, state: .normal)
        searchController.searchBar.showsBookmarkButton = true
    }
    
    private func setupPlaceView() {
        view.addSubview(placeView)
        
        placeView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.horizontalEdges.equalToSuperview()
        }
        
    }
    
    private func setupUnitSelectionView() {
        view.addSubview(unitSelectionView)
        
        unitSelectionView.backgroundColor = .gray
        unitSelectionView.isHidden = true
        
        unitSelectionView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(100)
        }
    }
    
    private func setupShowInfoButton() {
        view.addSubview(showInfoButton)
        
        showInfoButton.backgroundColor = .systemBlue
        showInfoButton.layer.cornerRadius = 5
        showInfoButton.setTitle(Constants.titleInfo, for: .normal)
        
        showInfoButton.snp.makeConstraints { make in
            make.top.equalTo(unitSelectionView.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        showInfoButton.addAction(UIAction { _ in
            guard let url = URL(string: Constants.link) else { return }
                let webViewController = WebViewController()
            let navigationController = UINavigationController(rootViewController: webViewController)
                webViewController.open(url)
                self.present(navigationController, animated: true)
        }, for: .touchUpInside)
    }
}

extension SearchResultViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.searchTextField.text else { return }
        
        view.backgroundColor = .black.withAlphaComponent(text.isEmpty ? 0.7 : 1)
    }
}

extension CityWeatherViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
    }
}
