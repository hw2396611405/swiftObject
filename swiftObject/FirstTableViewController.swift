//
//  FirstTableViewController.swift
//  swiftObject
//
//  Created by yicheng on 2017/5/2.
//  Copyright © 2017年 yicheng. All rights reserved.
//

import UIKit


class FirstTableViewController: UITableViewController {
    //声明属性
    var userName :String = "" 
    var person :Person = Person(name: "")
    var student : Student = Student(name: "", age: 1, score: 11)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationItem.title = "第一个"
    self.view.backgroundColor = UIColor.blue
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle(rawValue: 0)!
    self.logAction(log: "你好吗")
        //手动注册cell
//        self.tableView.register(UITableV iewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        // xib 注册cell
        self.tableView.register(UINib(nibName : "FirstTableViewCell", bundle :nil), forCellReuseIdentifier: "FirstTableViewCell")
        
        
        let country = Country(name: "Canada", capitalName: "Ottawa")
        print("\(country.name)'s capital city is called \(country.capitalCity.name)")
        
        
 
        //写在外部的网络请求
        let manager : AFHTTPSessionManager = AFHTTPSessionManager.init()
        
        manager.requestSerializer = AFHTTPRequestSerializer()
        manager.responseSerializer = AFJSONResponseSerializer.init()
        // 信任证书
        manager.securityPolicy = AFSecurityPolicy.init(pinningMode: AFSSLPinningMode.none)
       manager.securityPolicy.allowInvalidCertificates = true
       manager.securityPolicy.validatesDomainName = false
        let contentTypes: Set = ["application/json", "text/json", "text/javascript","text/html", "application/x-javascript"]
        manager.responseSerializer.acceptableContentTypes = contentTypes
        manager.post("url", parameters: "参数", progress: nil, success: { (task :URLSessionDataTask, data:Any) in
            print(data)
            
            }, failure: { (task:URLSessionDataTask, error:Error ) in
                
        } as? (URLSessionDataTask?, Error) -> Void)
    }
    
    
    // 声明两个类
    class Country {
        let name: String
        var capitalCity: City!
        init(name: String, capitalName: String) {
            self.name = name
            self.capitalCity = City(name: capitalName, country: self)
        }
    }
    class City {
        let name: String
        unowned let country: Country
        init(name: String, country: Country) {
            self.name = name
            self.country = country
        }
    }

    
    
    
    func logAction (log: String) {
        self.userName = log
        print(self.userName)
        self.person.name = self.userName
        print(self.person.name ?? String())
    }
    
    
    func remeoArr () -> Void {
        let  romeoAndJuliet = [
            "Act 1 Scene 1: Verona, A public place",
            "Act 1 Scene 2: Capulet's mansion",
            "Act 1 Scene 3: A room in Capulet's mansion",
            "Act 1 Scene 4: A street outside Capulet's mansion",
            "Act 1 Scene 5: The Great Hall in Capulet's mansion",
            "Act 2 Scene 1: Outside Capulet's mansion",
            "Act 2 Scene 2: Capulet's orchard",
            "Act 2 Scene 3: Outside Friar Lawrence's cell",
            "Act 2 Scene 4: A street in Verona",
            "Act 2 Scene 5: Capulet's mansion",
            "Act 2 Scene 6: Friar Lawrence's cell"
        
        ]
        var act1SceneCount = 0
        for scene in romeoAndJuliet {
            if scene.hasPrefix("Act 1 ") {
                act1SceneCount += 1
            } }
        print("There are \(act1SceneCount) scenes in Act 1")
        
        var mansionCount = 0
        var cellCount = 0
        for scene in romeoAndJuliet {
            if scene.hasSuffix("Capulet's mansion") {
                mansionCount += 1
            } else if scene.hasSuffix("Friar Lawrence's cell") {
                cellCount += 1
            } }
        print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell")
//        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        if (cell == nil)
        {
           cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "reuseIdentifier")
        }
       cell?.textLabel?.text = "测试"


        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("我被点击了", indexPath)
        let  secondVC  = SecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
