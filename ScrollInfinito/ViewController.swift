import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tablita: UITableView!
    @IBOutlet weak var vistaOculta: UIView!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    var arrDataBD: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablita.dataSource = self
        tablita.delegate = self
        tablita.register(UITableViewCell.self, forCellReuseIdentifier: "micelda")
        loadader(start: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SimulaAccesoBD.paginar { [weak self] arrBd in
            guard let self = self else { return }
            self.arrDataBD = arrBd
            self.tablita.reloadData()
            self.loadader(start: false)
        }
    }
    
    private func loadader(start: Bool) {
        self.vistaOculta.isHidden = !start
        if start {
            self.spiner.startAnimating()
        } else {
            self.spiner.stopAnimating()
        }
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrDataBD.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "micelda", for: indexPath)
        cell.textLabel?.text = "Nombre \(indexPath.row + 1): \(self.arrDataBD[indexPath.row])"
        return cell
    }
    
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let posicion = scrollView.contentOffset.y
        if posicion > tablita.contentSize.height - scrollView.frame.height {
            guard !SimulaAccesoBD.bCargando else { return }
            self.loadader(start: true)
            SimulaAccesoBD.paginar { [weak self] arrBd in
                guard let self = self else { return }
                self.arrDataBD += arrBd
                self.tablita.reloadData()
                self.loadader(start: false)
            }
            
        }
    }
    
}
