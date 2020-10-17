//
//  ViewController.swift
//  SpotifyAPI
//
//  Created by Karthik on 16/10/20.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var responseTextView: UITextView!
    
    // MARK: - Dependencies
    private let viewModel = ViewModel()
}

// MARK: - IBActions
private extension ViewController {
    @IBAction func makeAPIRequestButtonPressed(_ sender: Any) {
        viewModel.makeAPIRequestButtonPressed { response in
            DispatchQueue.main.async { [weak self] in
                self?.responseTextView.text = response
            }
        }
    }
}
