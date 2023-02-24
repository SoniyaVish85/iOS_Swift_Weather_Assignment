//
//  BaseViewController.swift
//  Weather
//
//  Created by Soniya Vishwakarma on 24/02/23.
//

import UIKit

class BaseViewController: UIViewController {
    var screenHeight: CGFloat = 0
    var screenWidth: CGFloat = 0
    var imgbackground: UIImageView!

    // MARK: - View Life Cycle
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: Set Up and render UI
    
    /// Description: Render common UI.
    func setUpUI() {
        let screenRect: CGRect = UIScreen.main.bounds

        screenHeight = screenRect.size.height
        screenWidth = screenRect.size.width

        view.backgroundColor = BackgroundColor
        imgbackground = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        imgbackground.contentMode = .scaleAspectFit
        imgbackground.image = UIImage(named: "Background")
        view.insertSubview(imgbackground, at: 0)
    }
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
