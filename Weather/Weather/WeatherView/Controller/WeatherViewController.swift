//
//  WeatherViewController.swift
//  Weather
//
//  Created by Soniya Vishwakarma on 24/02/23.
//

import UIKit

class WeatherViewController: BaseViewController {
    @IBOutlet private weak var vwContainer: UIView!
    var selectedForecastCity: WeatherElement?
    let foreCastView = ForecastView.instanceFromNib()
    @IBOutlet private weak var lblCity: UILabel!

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIComponents()
        // Do any additional setup after loading the view.
    }

    // MARK: Set Up and render UI

    /// Description: Render  UI.
    private func setUpUIComponents() {
        lblCity.text = "\(selectedForecastCity?.city?.name ?? "--")"
        foreCastView.frame = vwContainer.bounds
        vwContainer.addSubview(foreCastView)

        if let selectedCity = selectedForecastCity {
            foreCastView.fillData(details: selectedCity)
        }
    }

    // MARK: - Navigation

    /// Description: Send back to previois screen.
    @IBAction func backClicked(_ sender: Any) {
        dismiss(animated: true)
    }

    /*

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
