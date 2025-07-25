//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Lala on 27.03.25.
//

import UIKit

final class RMCharacterDetailViewController: UIViewController {
    private let viewModel : RMCharacterDetailViewViewModel
    
    init(viewModel: RMCharacterDetailViewViewModel ) {
        self.viewModel = viewModel
        super.init(nibName: nil,
                   bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
    }

}
