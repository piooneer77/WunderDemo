//
//  VehicleCell.swift
//  WunderDemo
//
//  Created by Karem Gohar on 26.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class VehicleCell: UITableViewCell, ClassIdentifiable, NibIdentifiable, DisposableProtocol, BindableProtocol {
    
    typealias ViewModelType = VehicleCellViewModel
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fuelLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var engineTypeLabel: UILabel!
    @IBOutlet weak var interiorLabel: UILabel!
    @IBOutlet weak var exteriorLabel: UILabel!
    
    // MARK: - Properties
    var disposeBag: DisposeBag = DisposeBag()
    var viewModel: VehicleCellViewModel?
    
    // MARK: - BindableProtocol methods
    func bindViewModel() {
        viewModel?.name.asDriver()
            .drive(nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel?.fuel.asDriver()
            .drive(fuelLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel?.address.asDriver()
            .drive(addressLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel?.engineType.asDriver()
            .drive(engineTypeLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel?.interior.asDriver()
            .drive(interiorLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel?.exterior.asDriver()
            .drive(exteriorLabel.rx.text)
            .disposed(by: disposeBag)
        
    }
}
