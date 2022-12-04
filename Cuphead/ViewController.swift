//
//  ViewController.swift
//  Cuphead
//
//  Created by Adriano Rodrigues Vieira on 03/12/22.
//

import UIKit

class ViewController: UIViewController {
    private let cupheadView: CupheadView

    init() {
        cupheadView = .init()

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = cupheadView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

