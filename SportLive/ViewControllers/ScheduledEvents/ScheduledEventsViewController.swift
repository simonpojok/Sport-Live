//
//  ScheduledEventsViewController.swift
//  SportLive
//
//  Created by Simon Peter Ojok on 13/09/2022.
//

import UIKit

class ScheduledEventsViewController: UIViewController {
    private let eventsTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(PastEventTableViewCell.self, forCellReuseIdentifier: "PastEventTableViewCell")
        return tableView
    }()
    
    private let viewModel: ScheduledEventsViewModel
    
    init(scheduleEventsViewModel: ScheduledEventsViewModel) {
        self.viewModel = scheduleEventsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(eventsTableView)
        viewModel.loadScheduleEvents()

    }
    
    override func viewDidLayoutSubviews() {
        eventsTableView.frame = view.bounds
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
        viewModel.eventsDelegate = self
    }
}


extension ScheduledEventsViewController: UITableViewDelegate, UITableViewDataSource, ScheduledEventsProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PastEventTableViewCell", for: indexPath)
        as! PastEventTableViewCell
        
        let event = viewModel.getEventForRowAt(indexPath.row)
        cell.configure(viewModel: event)
        return cell
    }
    
    func eventsDidLoad() {
        eventsTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
