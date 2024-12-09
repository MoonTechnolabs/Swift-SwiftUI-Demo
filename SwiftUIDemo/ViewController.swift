//
//  ViewController.swift
//  SwiftUIDemo
//
//  Created by Vivek H on 23/07/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnShowAlertAction(_ sender: UIButton) {
        
        let vc = UIHostingController(rootView: CustomAlertView())
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        vc.view.backgroundColor = .clear
//        self.navigationController?.pushViewController(vc, animated: true)
        present(vc, animated: true)
        
    }
    
    @IBAction func btnPushViewAction(_ sender: UIButton) {
        
        let vc = UIHostingController(rootView: SettingListingView().toolbar(.hidden, for: .navigationBar))
        vc.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

