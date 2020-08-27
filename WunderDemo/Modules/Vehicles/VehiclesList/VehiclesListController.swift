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

final class VehiclesListController: UIViewController, DisposableProtocol, BindableProtocol {
    
    typealias VehicleListSectionModel = SectionModel<String, Vehicle>
    typealias ViewModelType = VehiclesListViewModel
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    private var mapBarButton: UIBarButtonItem?
    
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
        // TODO: I would put a map image here instead of the search icon
        mapBarButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.rightBarButtonItem = mapBarButton
    }
    
    private func setupTableView() {
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
        bindNavigationBar()
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
                let coordinator = VehiclesMapCoordinator(vehicles: [vehicle], navigationController: self.navigationController)
                coordinator.start()
            })
            .disposed(by: disposeBag)
    }
    
    private func bindNavigationBar() {
        mapBarButton?.rx.tap
            .asDriver()
            .map{ [unowned self] in self.viewModel?.dataSource }
            .drive(onNext: { [unowned self] list in
                let coordinator = VehiclesMapCoordinator(vehicles: list?.value, navigationController: self.navigationController)
                coordinator.start()
            })
            .disposed(by: disposeBag)
    }
    
}
