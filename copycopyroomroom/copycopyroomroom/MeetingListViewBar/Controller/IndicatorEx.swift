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
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print(naverMapView!.cameraPosition.target)
//        print("touch began")
//
//    }
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print(naverMapView!.cameraPosition.target)
//        print("touch ended")
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print(naverMapView!.cameraPosition.target)
//        print("touch moved")
//    }
//    override func touchesEstimatedPropertiesUpdated(_ touches: Set<UITouch>) {
//        print(naverMapView!.cameraPosition.target)
//        print("touchesEstimatedPropertiesUpdated")
//    }
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print(naverMapView!.cameraPosition.target)
//        print("touchesCancelled")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        naverMapView = NMFMapView(frame: view.frame)
        naverMapView?.addCameraDelegate(delegate: self)
        naverMapView?.setLayerGroup(NMF_LAYER_GROUP_BUILDING, isEnabled: false)
        naverMapView?.isIndoorMapEnabled = true
        naverMapView!.mapType = .navi
        view.addSubview(naverMapView!)
        naverMapView!.symbolScale = 0.78
        naverMapView!.positionMode = .disabled
        let status = CLLocationManager.authorizationStatus()
        
        
        if status == CLAuthorizationStatus.denied || status == CLAuthorizationStatus.restricted {
            
            print("위치권한 꺼져있음")
            
            
            
        }
            
        else if status == CLAuthorizationStatus.authorizedWhenInUse {
            
            print("위치권한 켜져있음")
            
            
            
        }
        
        let locationOverlay = naverMapView!.locationOverlay
        locationOverlay.hidden = false
        //        locationOverlay.location = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
        locationOverlay.icon = NMFOverlayImage(name: "user.png")
        //        print(locationOverlay.location)
        
        
        //마커찍기
        
        //        print(marker.position)
        //        naverMapView.showCompass = false
        //        naverMapView.com
        //        naverMapView.showLocationButton = true
        //        naverMapView.position
        
        var cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: 37.5670135, lng: 126.9783740))
        //        cameraUpdate.animation = .fly
        //        cameraUpdate.animationDuration = 2
        naverMapView!.moveCamera(cameraUpdate)
        //        print("center")
        print(naverMapView!.cameraPosition.target)//좌표형태로 나오니 이걸 api로 쏴서 주소나 상호명 받아와서 view에띄워주면 될듯
        cameraUpdate.reason = 1000
        
        
        marker.position = naverMapView!.cameraPosition.target
        marker.captionText = "Hello"
        marker.mapView = naverMapView
        naverMapView!.moveCamera(cameraUpdate)
//        mapViewRegionIsChanging(naverMapView!, byReason: Int(cameraUpdate.reason))
        

    }
    
    override func viewDidAppear(_ animated: Bool){
        print("Enter viewDidAppear")
        
        
        //친구 한테 이동 하는 걸로 쓰면 될듯
        
        
        
        
        
        cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: 37.668, lng: 126.978375))
        cameraUpdate!.animation = .fly
        cameraUpdate!.animationDuration = 3
        naverMapView!.moveCamera(cameraUpdate!)
        
        marker.position = naverMapView!.cameraPosition.target
        marker.captionText = "Hello"
        marker.mapView = naverMapView
        naverMapView!.moveCamera(cameraUpdate!)
//        mapViewRegionIsChanging(naverMapView!, byReason: Int(cameraUpdate!.reason))
        
    }
    
    
    
    
    
}

//extension IndicatorEx : NMFMapViewTouchDelegate{
//    //    private func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
//    //        print("\(latlng.lat), \(latlng.lng)")
//    //    }
//
//    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
//        //        print("\(latlng.lat), \(latlng.lng)")
//        print("Test")
//        //    }
//    }
//}

extension IndicatorEx : NMFMapViewCameraDelegate{
    func mapViewCameraIdle(_ mapView: NMFMapView) {
        print("이동하다멈춤!!")
    }
//    @objc optional func mapViewCameraIdle(_ mapView: NMFMapView)
}

