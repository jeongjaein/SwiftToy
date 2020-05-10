//
//  IndicatorEx.swift
//  copycopyroomroom
//
//  Created by 정재인 on 2020/04/29.
//

import UIKit
import NMapsMap


class IndicatorEx : UIViewController{
    var naverMapView : NMFMapView?
    var cameraUpdate : NMFCameraUpdate?
    var marker = NMFMarker()
    override func viewDidLoad() {
        super.viewDidLoad()
        mapCreate()
        var cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: 37.5670135, lng: 126.9783740))
        naverMapView!.moveCamera(cameraUpdate)
        cameraUpdate.reason = 1000
        marker.position = naverMapView!.cameraPosition.target
        marker.captionText = "Hello"
        marker.mapView = naverMapView
        naverMapView!.moveCamera(cameraUpdate)
    }
    override func viewDidAppear(_ animated: Bool){
        print("Enter viewDidAppear")
        cameraToFriend()
    }
    fileprivate func mapCreate() {
        naverMapView = NMFMapView(frame: view.frame)
        naverMapView?.addCameraDelegate(delegate: self)
        naverMapView?.setLayerGroup(NMF_LAYER_GROUP_BUILDING, isEnabled: false)
        naverMapView?.isIndoorMapEnabled = true
        naverMapView!.mapType = .navi
        naverMapView!.symbolScale = 0.78
        naverMapView!.positionMode = .disabled
        view.addSubview(naverMapView!)
    }
    fileprivate func cameraToFriend() {
        //친구 한테 이동 하는 걸로 쓰면 될듯
        cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: 37.668, lng: 126.978375))
        cameraUpdate!.animation = .fly
        cameraUpdate!.animationDuration = 3
        naverMapView!.moveCamera(cameraUpdate!)
        marker.position = naverMapView!.cameraPosition.target
        marker.captionText = "Hello"
        marker.mapView = naverMapView
        naverMapView!.moveCamera(cameraUpdate!)
    }
}
extension IndicatorEx : NMFMapViewCameraDelegate{
    func mapViewCameraIdle(_ mapView: NMFMapView) {
        print(naverMapView!.cameraPosition.target)
    }
}


