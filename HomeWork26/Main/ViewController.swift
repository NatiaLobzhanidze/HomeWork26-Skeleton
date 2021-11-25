//
//  ViewController.swift
//  HomeWork26
//
//  Created by Natia's Mac on 24/11/2021.
//
import UIKit
import SkeletonView
class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    public var MovieList = [MovieModel]()
    private var apiManager = APIManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: { [self] in
            
        apiManager.getMovie {  MovieList in
            self.MovieList = MovieList
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute:{
                self.tableView.stopSkeletonAnimation()
                self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
                self.tableView.reloadData()
            })
        }
}

    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .lightGray),
                                               animation: nil, transition: .crossDissolve(0.1))
        tableView.showSkeleton(usingColor: .concrete, transition: .crossDissolve(0.25))
    }
}

extension ViewController: UITableViewDelegate{
    
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieList.count
    }
//    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
//        return "MyTableViewCell"
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell") as! MyTableViewCell
        cell.configure(with: MovieList[indexPath.row])
        return cell
    }
    
    
}
