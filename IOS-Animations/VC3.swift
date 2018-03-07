import UIKit

class VC3: UIViewController, UITabBarDelegate {
  
  let leftBarItem: UIBarButtonItem = {
    let lbi = UIBarButtonItem()
    lbi.title = "left"
    return lbi
  }()
  
  let rightBarItem: UIBarButtonItem = {
    let lbi = UIBarButtonItem()
    lbi.title = "right"
    return lbi
  }()
  
  lazy var tabBar : UITabBar = {
    let tbc = UITabBar()
    tbc.translatesAutoresizingMaskIntoConstraints = false
    tbc.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    tbc.delegate = self
    return tbc
  }()
  
  // views
  lazy var vv: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    v.tag = 10
    return v
  }()
  
  // views
  lazy var v1: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    v.tag = 11
    return v
  }()
  
  
  lazy var v2: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    v.tag = 12
    return v
  }()
  
  lazy var v3: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
    v.tag = 13
    return v
  }()
  
  lazy var v4: UIView = {
    let v = UIView()
    v.translatesAutoresizingMaskIntoConstraints = false
    v.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    v.tag = 14
    return v
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    setupNavigationController()
    
    view.addSubview(tabBar)
    setupTabBar()
    setupTabBarViews()
  }
  
}


extension VC3 {
  
  func setupNavigationController(){
    navigationItem.title = "VC3"
    navigationItem.leftBarButtonItem = leftBarItem
    navigationItem.rightBarButtonItem = rightBarItem
  }
  
  func setupTabBar(){
    tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    //    tabBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    tabBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    tabBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    
    let item1 = UITabBarItem(title: "item 1", image: #imageLiteral(resourceName: "button"), tag: 1)
    let item2 = UITabBarItem(title: "item 2", image: #imageLiteral(resourceName: "button-stop"), tag: 2)
    let item3 = UITabBarItem(title: "item 3", image: #imageLiteral(resourceName: "calculator"), tag: 3)
    let item4 = UITabBarItem(title: "item 4", image: #imageLiteral(resourceName: "calendar"), tag: 4)
    
    item1.badgeColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    item1.badgeValue = "5"
    
    
    tabBar.items = [item1, item2 , item3 , item4]
    tabBar.selectedItem = item1
  }
  
  func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    // 11, 12, 13 , 14
    if let v = vv.viewWithTag(item.tag + 10 ) {
      print(v.tag)
      vv.bringSubview(toFront: v )
    }
  }
  
  func setupTabBarViews(){
    view.addSubview(vv) // this is the parent view
    
    vv.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    vv.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
    vv.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
    vv.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 0).isActive = true
    
    let _ = [v1,v2,v3,v4].map({
      vv.addSubview($0)
      $0.topAnchor.constraint(equalTo: vv.topAnchor, constant: 0).isActive = true
      $0.leftAnchor.constraint(equalTo: vv.leftAnchor, constant: 0).isActive = true
      $0.rightAnchor.constraint(equalTo: vv.rightAnchor, constant: 0).isActive = true
      $0.bottomAnchor.constraint(equalTo: vv.bottomAnchor, constant: 0).isActive = true
    })
    
    // mark the first one as the active one
    vv.bringSubview(toFront: v1)
  }
}














