//
//  VehiclesListController.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class VehiclesListController: UIViewController, DisposableProtocol, BindableProtocol {
    
    typealias VehicleListSectionModel = SectionModel<String, Vehicle>
    typealias ViewModelType = VehiclesListViewModel
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let disposeBag: DisposeBag = DisposeBag()
    var viewModel: VehiclesListViewModel?
    var dataSource: RxTableViewSectionedReloadDataSource<VehicleListSectionModel>!
    
    // MARK: initializzers
    init(viewModel: VehiclesListViewModel?) {
        super.init(nibName: "VehiclesListController", bundle: .main)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.fetchNetworkData()
        setupNavigationBar()
        setupTableView()
    }
    
    // MARK: - private methods
    private func setupNavigationBar() {
        title = viewModel?.pageTitle
    }
    
    private func setupTableView() {
//        tableView
//            .rx.setDelegate(self)
//            .disposed(by: disposeBag)
        registerCells()
        setupDataSource()
        bindViewModel()
    }
    
    private func registerCells() {
        tableView.register(cellType: VehicleCell.self)
    }
    
    private func setupDataSource() {
        dataSource = RxTableViewSectionedReloadDataSource<VehicleListSectionModel>(configureCell: configureCell)
    }
    
    // MARK: - RxTableViewSectionedReloadDataSource Configuration
    private var configureCell: RxTableViewSectionedReloadDataSource<VehicleListSectionModel>.ConfigureCell {
        return { _, tableView, indexPath, vehicle in
            var cell: VehicleCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.bind(viewModel: VehicleCellViewModel(vehicle: vehicle))
            cell.bindViewModel()
            return cell
        }
    }
    
    // MARK: - BindableProtocol methods
    func bindViewModel() {
        bindDataSource()
        bindSelected()
    }
    
    private func bindDataSource() {
        viewModel?.dataSource
            .asDriver()
            .map { [VehicleListSectionModel(model: "Vehicles", items: $0)] }
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    private func bindSelected() {
        tableView.rx.modelSelected(Vehicle.self)
            .asDriver()
            .drive(onNext: { [unowned self] vehicle in
                print(vehicle.name)
//                let coordinator = RecipeDetailsCoordinator(navigationController: self.navigationController, recipe: recipe)
//                coordinator.start()
            })
            .disposed(by: disposeBag)
    }
    
}
