//
//  DeviceMotionViewController.swift
//  RxCoreMotion_Example
//
//  Created by Carlos García on 23/05/16.
//  Copyright © 2016 RxSwiftCommunity - https://github.com/RxSwiftCommunity. All rights reserved.
//

import UIKit
import RxSwift
import CoreMotion
import RxCoreMotion

class DeviceMotionViewController: UIViewController {

    let disposeBag = DisposeBag()
    let coreMotionManager = CMMotionManager.rx.manager()
    let pedometerManager = CMPedometer()


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        coreMotionManager
            .flatMapLatest { manager in
                manager.deviceMotion ?? Observable.empty()
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { deviceMotion in
                print(deviceMotion.attitude)
            })
            .addDisposableTo(disposeBag)
    }

}
