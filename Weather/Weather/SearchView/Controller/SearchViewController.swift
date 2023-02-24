//
//  SearchViewController.swift
//  Weather
//
//  Created by Soniya Vishwakarma on 23/02/23.
//

import UIKit

class SearchViewController: BaseViewController {
    @IBOutlet private weak var tblSearchCity: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
//    let searchController = UISearchController(searchResultsController: nil)
    private let viewModel = SearchViewModel()
    private let cellReuseIdentifier = "cityCell"
    private var arrCitiesData: WeatherData!
    private var arrFilteredCity: WeatherData = []
    private var completionHandler: ((_ selectedCity: WeatherElement) -> Void)?

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIComponents()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        searchController.searchBar.searchTextField.textColor = SubTextColor
  searchBar.searchTextField.textColor = SubTextColor

        checkForClearButton()
    }

    // MARK: Set Up and render UI

    /// Description: Render  UI.
    private func setUpUIComponents() {
        if let txtField = searchBar.value(forKey: "searchField") as? UITextField {
            txtField.tintColor = TintColor
            txtField.textColor = TextColor
            txtField.attributedPlaceholder = NSAttributedString(
                string: WASearchTextPlaceholder,
                attributes: [
                    .font: txtField.font!,
                    .foregroundColor: SubTextColor ?? .lightGray,
                ]
            )
        }
        searchBar.searchTextField.leftView?.tintColor = TextColor
        searchBar.becomeFirstResponder()
        viewModel.getWeatherData { data in
            guard let weatherElements = data
            else {
                return
            }
            self.arrCitiesData = weatherElements
            self.tblSearchCity.reloadData()
        }
        tblSearchCity.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }

    func checkForClearButton() {
        DispatchQueue.main.async {
            if let searchTextField = self.searchBar.value(forKey: WASearchTextfieldKey) as? UITextField,
               let clearButton = searchTextField.value(forKey: WASearchClearButtonKey) as? UIButton {
                clearButton.setImage(UIImage(named: WAClearSearchIcon), for: .normal)
            }
        }
    }


    func getSelectedCity(_ cityCallback: @escaping (WeatherElement?) -> Void) {
        completionHandler = cityCallback
    }

    // MARK: - Navigation

    @IBAction func backButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    /*

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}

// MARK: - Searching Methods
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        guard let cityName = searchBar.text else { return }
        arrFilteredCity = viewModel.filterFromData(cityDetails: cityName) ?? []
        DispatchQueue.main.async {
            self.tblSearchCity.reloadData()
        }
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
//        self.updatePropertyList()
    }
}
// MARK: - TableView Interaction Methods

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrFilteredCity.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)! as UITableViewCell
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = TextColor
        let cityItem = arrFilteredCity[indexPath.row]
        cell.textLabel?.text = "\(cityItem.city?.name ?? ""), \(cityItem.city?.country ?? "")"
        cell.textLabel?.numberOfLines = 0
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblSearchCity.deselectRow(at: indexPath, animated: true)
        let weatherElement = arrFilteredCity[indexPath.row]
        completionHandler!(weatherElement)
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
