// navigation to this in code later.
import UIKit

class VC2: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
  
  var numbers =  [Int]()
  
  lazy var headerView: UIView = {
    let h = UIView()
    h.translatesAutoresizingMaskIntoConstraints = false
    h.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
    return h
  }()
  
  
  lazy var headerLabel: UILabel = {
    let l = UILabel()
    l.translatesAutoresizingMaskIntoConstraints = false
    l.text = "NUMBERS"
    l.textAlignment = .center
    l.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    l.font = UIFont(name: l.font.fontName , size: 20)
    return l
  }()
  
  // cell constants
  let defaultCell = "FALLBACK_CELL"
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.translatesAutoresizingMaskIntoConstraints = false
    cv.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
    return cv
    
  }()
  

  override func viewDidLoad() {
    view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    super.viewDidLoad()

    numbers = makeList(n: 100)
    
    // collection view
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UICollectionViewCell.self , forCellWithReuseIdentifier: defaultCell)
    collectionView.register(NumberCell.self , forCellWithReuseIdentifier: numberCell)
    
    setupViews()
  }
  
  func setupViews() {
    view.addSubview(headerView)
    addHeaderConstraints()
    
    headerView.addSubview(headerLabel)
    addLConstraints()
    
    view.addSubview(collectionView)
    addCollectionViewConstraints()
  }
  
  func addLConstraints(){
    headerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0).isActive = true
    headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0).isActive = true
    headerLabel.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: 1).isActive = true
    headerLabel.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 1).isActive = true
  }
  
  func addHeaderConstraints(){
    // headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: UIApplication.shared.statusBarFrame.height).isActive = true
    headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0 ).isActive = true
    headerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    headerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    headerView.heightAnchor.constraint(equalToConstant: 70).isActive = true
  }
  
  func addCollectionViewConstraints(){
    collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
    collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
  }
  
}


extension VC2 {
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: numberCell, for: indexPath) as? NumberCell {
      cell.updateViews(n: numbers[indexPath.row])
      return cell
    }
    return collectionView.dequeueReusableCell(withReuseIdentifier: defaultCell, for: indexPath)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return numbers.count
  }

  
  
  func makeList( n:Int ) -> [Int] {
    var result:[Int] = []
    for _ in 0..<n {
      result.append(Int(arc4random_uniform(99) + 1))
    }
    return result
  }
  
  
}

