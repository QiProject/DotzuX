//
//  YJChangeAccountViewController.swift
//  Example_Objc
//
//  Created by YJHou on 2018/4/18.
//  Copyright © 2018年 liman. All rights reserved.
//

import UIKit

class YJChangeAccountViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView();
        
        RGDebugInfoManager.shared.changeAccountSuccessClosure = exitDebugManager
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func exitDebugManager() -> Void{
        
        SwiftProgressHUD.hideAllHUD()
        
        SwiftProgressHUD.showSuccess("切换成功")
        
        navigationController?.dismiss(animated: true, completion: {
            SwiftProgressHUD.hideAllHUD()
        });
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension YJChangeAccountViewController: UITableViewDataSource, UITableViewDelegate{
    
    func getSaveAccount() -> Array<[String: Any]> {
        
        let saveAccount = UserDefaults.standard.array(forKey: "account")
        if let saveAccounts = saveAccount {
            return saveAccounts as! Array<[String : Any]>;
        }else{
            return Array()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getSaveAccount().count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCell(withIdentifier: "ChangeAccountCellId")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ChangeAccountCellId")
            cell?.selectionStyle = .none
            cell?.backgroundColor = UIColor.black
        }
        
        let accountDict = getSaveAccount()[indexPath.row]
        
        var account = ""
        if let accountValue = accountDict["account"] {
            account = accountValue as! String
        }
        
        var pwd = ""
        if let pwdValue = accountDict["pwd"] {
            pwd = pwdValue as! String
        }
        
        var isLogin = NSNumber(value: 0)
        if let isLoginValue = accountDict["isLogin"] {
            isLogin = isLoginValue as! NSNumber
        }
        
        
        var showAccount = account
        if isLogin.boolValue { // 已经登录
            showAccount += "  [当前登录]"
        }
        
        if showAccount.count > 0 && pwd.count > 0 {
            cell?.textLabel?.text = "Account : " + showAccount
            cell?.detailTextLabel?.text = "Pwd : " + pwd
        }
        
        cell?.textLabel?.textColor = UIColor.white
        cell?.detailTextLabel?.textColor = UIColor.white
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let accountDict = getSaveAccount()[indexPath.row]
        
        let account = accountDict["account"] as! String
        let pwd = accountDict["pwd"] as! String
        let isLogin = accountDict["isLogin"] as! NSNumber

        if isLogin.boolValue { // 已经登录就不响应
            SwiftProgressHUD.showInfo("账号已登录", autoClear: true, autoClearTime: 2)
        }else{
            // 闭包
            if let changeAccountClosure = RGDebugInfoManager.shared.changeAccountClosure {
                
                SwiftProgressHUD.showWait()
                
                changeAccountClosure(account, pwd, NSNumber(value: indexPath.row))
            }
        }
    }

}
