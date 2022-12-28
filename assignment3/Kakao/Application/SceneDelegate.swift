//
//  SceneDelegate.swift
//  Kakao
//
//  Created by 이승헌 on 2022/10/14.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else {return}
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            /*
             overrideUserInterfaceStyle
             공식문서:
             The user interface adopted by the view and all of its subviews
             
             해석 해보면 해당 뷰와 하위뷰에 모두 공통으로 적용된다는 소리같다 그래서 여기서 다크모드랑 라이트모드 이런거 설정해주는 듯
             */
            if UITraitCollection.current.userInterfaceStyle == .dark {
                window.overrideUserInterfaceStyle = .dark
            } else {
                window.overrideUserInterfaceStyle = .light
            }
            
            let rootViewController = TabBarViewController()
            
            window.rootViewController = rootViewController
            window.makeKeyAndVisible()
            self.window = window
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

