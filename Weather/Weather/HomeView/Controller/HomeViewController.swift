//
//  HomeViewController.swift
//  Weather
//
//  Created by Soniya Vishwakarma on 22/02/23.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet private weak var tblForecastCity: UITableView!
    private var arrSelectedCityForecast: WeatherData = []
    private let cellReuseIdentifier = "WeatherTableViewCell"

    private let SearchCitySegue = "SearchCity"
    
    @IBOutlet private weak var vwInfoMessage: UIView!
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let cell = UINib(nibName: "WeatherTableViewCell", bundle: nil)
        tblForecastCity.register(cell, forCellReuseIdentifier: "WeatherTableViewCell")
        if arrSelectedCityForecast.count == 0 {
            performSegue(withIdentifier: SearchCitySegue, sender: nil)
            vwInfoMessage.isHidden = false
            tblForecastCity.isHidden = true
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SearchCitySegue{
            guard let searchVC = segue.destination as? SearchViewController else { return }
            searchVC.getSelectedCity { selectedCity in
                if let city = selectedCity {
                    self.arrSelectedCityForecast.append(city)
                    DispatchQueue.main.async {
                        self.vwInfoMessage.isHidden = true
                        self.tblForecastCity.isHidden = false
                        self.tblForecastCity.reloadData()
                    }
                }
            }
        }
    }

    func navigateToWeatherScreen(row: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let weatherVC = storyboard.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        weatherVC.selectedForecastCity = arrSelectedCityForecast[row]
        weatherVC.modalPresentationStyle = .fullScreen
        present(weatherVC, animated: true)
    }
}

// MARK: TableView Interaction Methods

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrSelectedCityForecast.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(WAForecastCellHeight)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! WeatherTableViewCell

        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        let cityForecast = arrSelectedCityForecast[indexPath.row]
        cell.setData(item: cityForecast)
        return cell
    }

    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tblForecastCity.deselectRow(at: indexPath, animated: true)
        navigateToWeatherScreen(row: indexPath.row)
    }
}
