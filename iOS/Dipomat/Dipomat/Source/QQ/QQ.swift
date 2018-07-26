//
//  QQ.swift
//  Dipomat
//
//  Created by enjoy on 2018/7/24.
//  Copyright © 2018 enjoy. All rights reserved.
//

import Foundation


class QQ: Wrapper {
    
    private var tencentOAuth: TencentOAuth?
    
    override func register() {
        guard let appID = self.info?.key else { return }
        tencentOAuth = TencentOAuth(appId: appID, andDelegate: self)
    }
    
    override var isInstalled: Bool {
        return TencentOAuth.iphoneQQInstalled()
    }
    
    fileprivate var completeBlock: ((Result<User, RError>) -> Void)?
    
    override func auth(complete: @escaping (Result<User, RError>) -> Void)  {
        self.completeBlock = complete
        self.tencentOAuth?.authorize([kOPEN_PERMISSION_ADD_TOPIC,
                                      kOPEN_PERMISSION_ADD_ONE_BLOG,
                                      kOPEN_PERMISSION_ADD_ALBUM,
                                      kOPEN_PERMISSION_UPLOAD_PIC,
                                      kOPEN_PERMISSION_LIST_ALBUM,
                                      kOPEN_PERMISSION_ADD_SHARE,
                                      kOPEN_PERMISSION_CHECK_PAGE_FANS,
                                      kOPEN_PERMISSION_GET_INFO,
                                      kOPEN_PERMISSION_GET_OTHER_INFO,
                                      kOPEN_PERMISSION_GET_VIP_INFO,
                                      kOPEN_PERMISSION_GET_VIP_RICH_INFO,
                                      kOPEN_PERMISSION_GET_USER_INFO,
                                      kOPEN_PERMISSION_GET_SIMPLE_USER_INFO]
            , inSafari: true)
    }
 
    override func handleOpenUrl(with url: URL) -> Bool {
        
        let qq = QQApiInterface.handleOpen(url, delegate: self)
        let tencent = TencentOAuth.handleOpen(url)
        
        return qq && tencent
    }
    
}

extension QQ: QQApiInterfaceDelegate {
    
    func onReq(_ req: QQBaseReq!) { }
    
    func onResp(_ resp: QQBaseResp!) { }
    
    func isOnlineResponse(_ response: [AnyHashable : Any]!) { }
    
    func getUserInfoResponse(_ response: APIResponse) {
        
        guard let completeBlock = completeBlock else { return }
        
        defer { self.completeBlock = nil }
        
        guard response.retCode == Int32(URLREQUEST_SUCCEED.rawValue) else {
            completeBlock(Result.failure(RError.OauthFail(reason: .urlRequestFailed)))
            return
        }
        
        let user = User()
        user.uid = self.tencentOAuth?.appId
        user.nickName = response.jsonResponse?["nickname"] as? String
        user.gender = response.jsonResponse?["gender"] as? String
        user.avatar = response.jsonResponse?["figureurl_qq_2"] as? String
        user.accessToken = self.tencentOAuth?.accessToken
        completeBlock(Result.success(user))
    }
}

extension QQ: TencentSessionDelegate {
    
    func tencentDidLogin() {
        self.tencentOAuth?.getUserInfo()
    }
    
    func tencentDidNotLogin(_ cancelled: Bool) {
        
        guard let completeBlock = completeBlock else { return }
        
        defer { self.completeBlock = nil }
        
        completeBlock(Result.failure(RError.OauthFail(reason: .userCancelLogin)))
        
    }
    
    func tencentDidNotNetWork() {
        guard let completeBlock = completeBlock else { return }
        
        defer { self.completeBlock = nil }
        
        completeBlock(Result.failure(RError.netWorkLoss))
    }
    
}

