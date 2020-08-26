//
//  VehiclesMapController.swift
//  WunderDemo
//
//  Created by Karem Gohar on 26.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa
import MapKit
import CoreLocation
import RxMKMapView

class VehiclesMapController: UIViewController, DisposableProtocol, BindableProtocol, CLLocationManagerDelegate {
    
    typealias ViewModelType = VehiclesMapViewModel
    
    // MARK: IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Properties
    let disposeBag: DisposeBag = DisposeBag()
    var viewModel: VehiclesMapViewModel?
    let locationManager: CLLocationManager = CLLocationManager()
    
    // MARK: initializzers
    init(viewModel: VehiclesMapViewModel?) {
        super.init(nibName: "VehiclesMapController", bundle: .main)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupLocationManager()
        setupMapView()
    }
    
    // MARK: - private methods
    private func setupNavigationBar() {
        title = viewModel?.pageTitle
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
            locationManager.startUpdatingLocation()
        }
    }
    
    private func setupMapView() {
        mapView.mapType = MKMapType.standard
        mapView.showsUserLocation = true
        bindViewModel()
        zoomToSelectedVehicle()
    }
    
    private func zoomMapTo(location: CLLocation){
        let zoomRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude), latitudinalMeters: 20000, longitudinalMeters: 20000)
        mapView.setRegion(zoomRegion, animated: true)
    }
    
    private func zoomToSelectedVehicle() {
        if viewModel?.shouldZoomOnUserLocation == false {
            guard let lon = viewModel?.dataSource.value.first?.coordinates.first,
                let lat = viewModel?.dataSource.value.first?.coordinates[1] else { return }
            zoomMapTo(location: CLLocation(latitude: lat, longitude: lon))
        }
    }
    
    // MARK: - BindableProtocol methods
    func bindViewModel() {
        viewModel?.dataSource
            .asDriver()
            .map { $0.map { VehicleAnnotation(vehicle: $0) } }
            .drive(mapView.rx.annotations)
            .disposed(by: disposeBag)
    }
    
    // MARK: CLLocationManagerDelegate Methods
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first, viewModel?.shouldZoomOnUserLocation == true {
            zoomMapTo(location: location)
        }
    }
    
}
