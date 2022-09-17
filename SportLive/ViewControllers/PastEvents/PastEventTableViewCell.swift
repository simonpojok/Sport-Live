//
//  PastEventTableViewCell.swift
//  SportLive
//
//  Created by Simon Peter Ojok on 17/09/2022.
//

import UIKit
import RxSwift
import RxCocoa

class PastEventTableViewCell: UITableViewCell {
    private let disposeBag = DisposeBag()
    
    private let eventImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = false
        return iv
    }()
    
    private let eventTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let eventSubTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let eventDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PastEventTableViewCell {
    func configureViews() {
        addSubview(eventImageView)
        
        eventImageView.anchor(
            top: topAnchor,
            left: leftAnchor,
            bottom: bottomAnchor,
            width: frame.width * 0.4
        )
        
        addSubview(eventTitleLabel)
        
        eventTitleLabel.anchor(
            top: topAnchor,
            left: eventImageView.rightAnchor,
            right: rightAnchor,
            paddingTop: 10,
            paddingLeft: 10
        )
        
        addSubview(eventSubTitleLabel)
        
        eventSubTitleLabel.anchor(
            top: eventTitleLabel.bottomAnchor,
            left: eventTitleLabel.leftAnchor,
            right: rightAnchor
        )
        
        addSubview(eventDateLabel)
        
        eventDateLabel.anchor(
            left: eventTitleLabel.leftAnchor,
            bottom: bottomAnchor,
            right: rightAnchor,
            paddingBottom: 10
        )
    }
    
    func configure(viewModel: PastEventViewModel) {
        viewModel.image.asDriver(onErrorJustReturn: UIImage(systemName: "photo.artframe")!)
            .drive(eventImageView.rx.image)
            .disposed(by: self.disposeBag)
        
        viewModel.title.asDriver(onErrorJustReturn: "")
            .drive(eventTitleLabel.rx.text)
            .disposed(by: self.disposeBag)
        
        viewModel.subtitle.asDriver(onErrorJustReturn: "")
            .drive(eventSubTitleLabel.rx.text)
            .disposed(by: self.disposeBag)
        
        viewModel.date.asDriver(onErrorJustReturn: "")
            .drive(eventDateLabel.rx.text)
            .disposed(by: self.disposeBag)
    }
}
