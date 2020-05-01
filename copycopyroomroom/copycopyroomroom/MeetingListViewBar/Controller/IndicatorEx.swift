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
        naverMapView = NMFMapView(frame: view.frame)
        
        naverMapView!.mapType = .basic
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
        mapViewRegionIsChanging(naverMapView!, byReason: Int(cameraUpdate.reason))
        
        
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
        mapViewRegionIsChanging(naverMapView!, byReason: Int(cameraUpdate!.reason))
        
    }
}

extension IndicatorEx : NMFMapViewTouchDelegate{
    //    private func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
    //        print("\(latlng.lat), \(latlng.lng)")
    //    }
    
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
//        print("\(latlng.lat), \(latlng.lng)")
        print("Test")
        //    }
    }
}

extension IndicatorEx : NMFMapViewCameraDelegate{
    func mapViewRegionIsChanging(_ mapView: NMFMapView, byReason reason: Int) {
        print("카메라 변경 - reason: \(reason)")
    }
}

