//
//  SigninController.swift
//  MVVM
//
//  Created by Thế Châu on 8/29/18.
//  Copyright © 2018 Thế Châu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SigninController: UIViewController {
    @IBOutlet weak var lbTotalUser: UILabel!
    @IBOutlet weak var tbvUser: UITableView!
    var index = 0
    let disposeBag = DisposeBag()
    var model = userModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        model.user.asObservable()
            .subscribe(onNext: { //2
                user in
                self.tbvUser.reloadData()
            })
            .disposed(by: disposeBag) //3
        
        tbvUser.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tbvUser.dataSource = self
    }
    
    @IBAction func onActionBtnAddUser(_ sender: Any) {
        model.appendData(index: index)
        index += 1
    }
    
}

extension SigninController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
        let infor = model.getData(index: indexPath.row)
        cell.user = infor
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getTotal()
    }
    
    
}
