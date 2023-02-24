//
//  SplashViewController.swift
//  Weather
//
//  Created by Soniya Vishwakarma on 23/02/23.
//

import Lottie
import UIKit

class SplashViewController: BaseViewController {
    @IBOutlet private weak var cloudAnimationView: LottieAnimationView!

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        performSplashAnimation()
        perform(#selector(navigateToMainScreen), with: nil, afterDelay: 3.0)

        // Do any additional setup after loading the view.
    }

    // MARK: - Handle and supervise the Animation

    func performSplashAnimation() {
        // 1. Set animation content mode

        cloudAnimationView.contentMode = .scaleAspectFit

        // 2. Set animation loop mode

        cloudAnimationView.loopMode = .loop

        // 3. Adjust animation speed

        cloudAnimationView.animationSpeed = 0.5

        // 4. Play animation
        cloudAnimationView.play()
    }

    // MARK: - Navigation

    @objc func navigateToMainScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dashboard = storyboard.instantiateViewController(withIdentifier: "HomeViewController")
        let arrRootController = [dashboard]
        navigationController?.setViewControllers(arrRootController, animated: true)
    }
    /*
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
