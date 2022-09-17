//
//  PastEventsViewController.swift
//  SportLive
//
//  Created by Simon Peter Ojok on 13/09/2022.
//

import UIKit
import RxCocoa
import RxSwift


class PastEventsViewController: UITableViewController {
    private let viewModel: PastEventsViewModel
    
    init(viewModel: PastEventsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        viewModel.loadPastEvents()
    }
}

extension PastEventsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pastEventViewModel = viewModel.getEventForRowAt(indexPath.row)
        
        return PastEventTableViewCell()
    }
}

extension PastEventsViewController: PastEventsViewModelDelegate {
    func eventsDidLoad() {
        tableView.reloadData()
    }
}
