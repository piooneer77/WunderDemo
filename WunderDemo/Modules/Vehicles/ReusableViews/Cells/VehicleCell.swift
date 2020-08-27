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

final class VehicleCell: UITableViewCell, ClassIdentifiable, NibIdentifiable, DisposableProtocol, BindableProtocol {
    
    typealias ViewModelType = VehicleCellViewModel
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: ThemableLabel!
    @IBOutlet weak var fuelLabel: ThemableLabel!
    @IBOutlet weak var addressLabel: ThemableLabel!
    @IBOutlet weak var engineTypeLabel: ThemableLabel!
    @IBOutlet weak var interiorLabel: ThemableLabel!
    @IBOutlet weak var exteriorLabel: ThemableLabel!
    
    // MARK: - Properties
    var disposeBag: DisposeBag = DisposeBag()
    var viewModel: VehicleCellViewModel?
    
    // MARK: - life cycle methods
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
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
