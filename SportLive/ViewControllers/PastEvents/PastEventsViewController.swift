//
//  PastEventsViewController.swift
//  SportLive
//
//  Created by Simon Peter Ojok on 13/09/2022.
//

import UIKit
import RxCocoa
import RxSwift


class PastEventsViewController: UIViewController {
    private let viewModel: PastEventsViewModel

    init(viewModel: PastEventsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let eventsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PastEventTableViewCell.self, forCellReuseIdentifier: "PastEventTableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(eventsTableView)
        viewModel.loadPastEvents()
    }
    
    override func viewDidLayoutSubviews() {
        eventsTableView.frame = view.bounds
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
        viewModel.eventsDelegate = self
    }
}

extension PastEventsViewController: UITableViewDelegate, UITableViewDataSource, PastEventsViewModelDelegate {
    func eventsDidLoad() {
        eventsTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PastEventTableViewCell", for: indexPath)
        as! PastEventTableViewCell
        
        let event = viewModel.getEventForRowAt(indexPath.row)
        cell.configure(viewModel: event)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
