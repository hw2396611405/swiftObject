//
//  SwiftHttpNetwork.swift
//  swiftObject
//
//  Created by yicheng on 2017/8/14.
//  Copyright © 2017年 yicheng. All rights reserved.
//

import UIKit

/**
 *  http请求完成后回调的block
 *
 *  @param NSData  请求的数据，如果请求成功有数据，否则为nil
 *  @param NSError 错误信息，如果请求失败则不为nil。
 *
 */
typealias HDNetCompletionBlock = ( _ data: NSData?,  _ error: NSError?) -> Void


class SwiftHttpNetwork: AFHTTPSessionManager {
    static var networkManager : SwiftHttpNetwork?
    static var _operationQueue :OperationQueue?
    static var _baseURL :NSString?
     var _completionBlock: HDNetCompletionBlock?
    
    func setBaseUrl (baseURL:NSString?,timeOutInterval :Double ){
        SwiftHttpNetwork._baseURL = baseURL
        SwiftHttpNetwork.networkManager = SwiftHttpNetwork.init(baseURL:self.baseURL)
       SwiftHttpNetwork.networkManager?.requestSerializer = AFHTTPRequestSerializer()
       SwiftHttpNetwork.networkManager?.responseSerializer = AFJSONResponseSerializer.init()
        // 信任证书
        SwiftHttpNetwork.networkManager?.securityPolicy = AFSecurityPolicy.init(pinningMode: AFSSLPinningMode.none)
        SwiftHttpNetwork.networkManager?.securityPolicy.allowInvalidCertificates = true
        SwiftHttpNetwork.networkManager?.securityPolicy.validatesDomainName = false
        SwiftHttpNetwork.networkManager?.requestSerializer.timeoutInterval = timeOutInterval
        let contentTypes: Set = ["application/json", "text/json", "text/javascript","text/html", "application/x-javascript"]
        SwiftHttpNetwork.networkManager?.responseSerializer.acceptableContentTypes = contentTypes
    }
    
    class func POST(URLString: String, parameters:Dictionary<String, Any>, completion: @escaping ( _ dataDic: Any  ) ->Void, backError:@escaping ( _ error: Error  ) ->Void) ->Void {
        
        SwiftHttpNetwork.networkManager = SwiftHttpNetwork.init()
        SwiftHttpNetwork.networkManager?.requestSerializer = AFHTTPRequestSerializer()
        SwiftHttpNetwork.networkManager?.responseSerializer = AFJSONResponseSerializer.init()
        // 信任证书
        SwiftHttpNetwork.networkManager?.securityPolicy = AFSecurityPolicy.init(pinningMode: AFSSLPinningMode.none)
        SwiftHttpNetwork.networkManager?.securityPolicy.allowInvalidCertificates = true
        SwiftHttpNetwork.networkManager?.securityPolicy.validatesDomainName = false

        let contentTypes: Set = ["application/json", "text/json", "text/javascript","text/html", "application/x-javascript"]
        SwiftHttpNetwork.networkManager?.responseSerializer.acceptableContentTypes = contentTypes

        SwiftHttpNetwork.networkManager?.post("http://test.5d8.yicheng120.com/api/user/login", parameters: parameters, progress: nil, success: { (task :URLSessionDataTask, data:Any) in
          return completion(data)
            
        }, failure: { (task:URLSessionDataTask, error:Error ) in
            return  backError(error)
            } as? (URLSessionDataTask?, Error) -> Void)
    }
    
   
    
    
    
    
    
}
 
