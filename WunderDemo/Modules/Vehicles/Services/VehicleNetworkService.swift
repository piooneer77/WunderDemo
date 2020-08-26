//
//  VehicleNetworkService.swift
//  WunderDemo
//
//  Created by Karem Gohar on 25.08.20.
//  Copyright © 2020 Karem Gohar. All rights reserved.
//

import RxSwift
import RxCocoa

class VehicleNetworkService<T: Codable>: VehicleBaseService<T> {
    
    override func getVehiclesList() -> Observable<T> {
        let urlString = "https://wunder-test-case.s3-eu-west-1.amazonaws.com/ios/locations.json"
        let url: URL = URL(string: urlString)!
        return Observable.create { observer -> Disposable in
            super.fireRequest(url: url) { (responseObject, error) in
                if let error = error {
                    observer.onError(error)
                    return
                } else if let list = responseObject {
                    observer.onNext(list)
                }
            }
            return Disposables.create {
                self.dataTask?.cancel()
            }
        }
    }
    
}
