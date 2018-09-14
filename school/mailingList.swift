
import UIKit
import SafariServices
import MessageUI

class mailingList: UIViewController, UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate {
    
    let names: [String] = ["Adzija, Zeljka", "Amorim, N", "Attard, Tanya", "Baraam, Aus", "Baptista, Ana", "Barone, John", "Baskey, Lee Anne", "Bianco, Enrico", "Bregar, M", "Brennan, Lucy", "Byrne, Chris", "Caravaggio, Sandra", "Carboni, Josie", "Chan, Stephen", "Chui, Diana", "Clough, Jane Ann", "Conroy, Cecilia", "Contreras, Clem", "Correia, Steve", "Cuda, Michael", "Cuvalo-Pedro, Drazana", "D'amata, Maria", "Dairone-Crasto, Antonella", "Defina, Asta", "Del Duca, Gina", "Del Monte, Adrian", "De Julio, Lisa", "De Sousa, Silvia", "Di Paola, Massimo", "Difiore, Josie", "Duggan, P", "Elliot, Lenita", "Faieta, S", "Ferrari, Jennifer", "Ferro, Joe", "Franklin, S", "Franze, T", "Frlan, Nik", "Gallippi, Andria", "Garofalo, Davide", "Gaudet, Melanie", "Giangioppo, Daniela", "Grant, Jennifer", "Grant, Patrick", "Haddad, Asad", "Henderson, Kathleen", "Ho-Lau, Rita Sam Man", "Hypolite, Gemma", "Italiano, Dina", "Iannarilli, Alessio", "Joseph, Dorothy", "Kalinowski, Jan", "Kassabian, Caroline", "Kauffman, Gabrielle", "Kelly, S", "Kerkos-Desouza, Anselm", "Koenig, Ed", "Kos, Andrew", "Lains, Suzette", "Leech, Monica", "Leopold-Muresan, Mirela", "Loudon, Mark", "Mabrucco, Mario", "Macdonald, Arlene", "Malfara, Josie", "Marcolini, Liliana", "Marino, Rosamaria", "Mastrofrancesco, Dina", "Matak, Adam", "McDougall, Doug", "McGrath, Jane", "McGuckin, Paulette", "Meligrana, Stefanie", "Mera, A", "Montenegro-Ieraci, Jackeline", "Morassutti, Bernice", "Moriana, Joyce", "Perfecky, Andrey", "Pinto, Virginia", "Pilarski, Laura", "Pincente, F", "Powell, Joanna", "Rampersad, Andy", "Rebelo, Paul", "Ricard, Suzanne", "Rocca, Marino", "Rousseau, Pascale", "Royiwsky, John", "Rubino, Franca", "Salvador, Monica", "Samagalsky, Gloria", "Sator, Anne", "Savoia, Cristiana", "Schomer, Tatjana", "Schroll, Erika", "Sedej, Betty", "Silva-Gomes, Elizabeth", "Skeath-Makxam, Jessica", "smolders-Godfrey, Jennifer", "Sprem, Lidija", "Song, Junho", "Stasiv, Halyna", "Stasiw, Catherine", "Storey, Sandra", "Stroszka, D", "Tomic, Dubravka", "Trasolini, Denise", "Trentadue, Domenic", "Tuohy, Mark", "Viterbo, Iolanda", "Vitro, Julie", "vukasinovic, M", "Warren, Brad (James)", "Wilson, Luke"]

    
    let emails: [String] = ["Zeljka.Adzija@tcdsb.org", "Nayara.Amorim@tcdsb.org", "Tanya-Marie.Attard@tcdsb.org", "Aus.Baraam@tcdsb.org", "Ana.baptista@tcdsb.org", "john.barone@tcdsb.org", "leanne.baskey@tcdsb.org", "enrico.bianco@tcdsb.org", "Michael.Bregar@tcdsb.org", "lucy.brennan@tcdsb.org", "chris.byrne@tcdsb.org", "sandra.caravaggio@tcdsb.org", "Josie.Carboni@tcdsb.org", "stephen.chan@tcdsb.org", "diana.chui@tcdsb.org", "janeann.clough@tcdsb.org", "cecilia.conroy@tcdsb.org", "clemencia.contreras-sheridan@tcdsb.org", "steve.correia@tcdsb.org", "michael.cuda@tcdsb.org", "drazana.cuvalo-pedro@tcdsb.org", "maria.damata@tcdsb.org", "antonella.dairone-castro@tcdsb.org", "asta.defina@tcdsb.org", "gina.delduca@tcdsb.org", "adrian.delmonte@tcdsb.org", "lisa.dejulio@tcdsb.org", "Silvia.DeSousa@tcdsb.org", "Massimo.DiPaola@tcdsb.org", "josephine.difiore@tcdsb.org", "Patrick.Duggan@tcdsb.org", "lenita.elliot@tcdsb.org", "Salvatore.Faieta@tcdsb.org", "jennifer.ferrari@tcdsb.org","Joseph.Ferro@tcdsb.org", "Silvia.Franklin@tcdsb.org", "Tess.Franze@tcdsb.org", "nikola.frlan@tcdsb.org", "andria.gallippi@tcdsb.org", "davide.garofalo@tcdsb.org", "Melanie.Gaudet@tcdsb.org", "daniela.giangioppo@tcdsb.org", "jennifer.grant@tcdsb.org", "patrick.grant@tcdsb.org", "asad.haddad@tcdsb.org", "kathleen.henderson@tcdsb.org", "RitaSamMan.Ho-Lau@tcdsb.org", "gemma.hypolite@tcdsb.org", "Dina.Italiano@tcdsb.org", "alessio.iannarilli@tcdsb.org", "dorothy.joseph@tcdsb.org", "jan.kalinowski@tcdsb.org", "caroline.kassabian@tcdsb.org", "gabrielle.kauffman@tcdsb.org", "Samantha.Kelly@tcdsb.org", "anselm.kerkos-desouza@tcdsb.org", "ed.koenig@tcdsb.org", "andrew.kos@tcdsb.org", "suzette.lains@tcdsb.org", "Monica.Leech@tcdsb.org", "mirela.leopold-muresan@tcdsb.org", "Mark.Loudon@tcdsb.org", "Mario.Mabrucco@tcdsb.org", "arlene.macdonald@tcdsb.org", "josie.malfara@tcdsb.org", "liliana.marcolini@tcdsb.org", "rosamaria.marino@tcdsb.org", "dina.mastrofrancesco@tcdsb.org", "adam.matak@tcdsb.org", "douglas.mcdougall02@tcdsb.org", "jane.mcgrath@tcdsb.org", "paulette.mcguckin@tcdsb.org", "stefanie.meligrana@tcdsb.org", "Andrei.Mera@tcdsb.org", "jackeline.montenegro-ieraci@tcdsb.org", "bernice.morassutti@tcdsb.org", "joyce.moriana@tcdsb.org", "andrey.perfecky@tcdsb.org", "virginia.pinto@tcdsb.org", "laura.pilarski@tcdsb.org", "Frank.Pincente@tcdsb.org", "Joanna.Powell@tcdsb.org", "andy.rampersad@tcdsb.org", "paul.rebelo@tcdsb.org", "suzanne.ricard@tcdsb.org", "marino.rocca@tcdsb.org", "pascale.rousseau@tcdsb.org", "John.Royiwsky@tcdsb.org", "franca.rubino@tcdsb.org", "Monica.Salvador@tcdsb.org", "gloria.samagalsky@tcdsb.org", "anne.sator@tcdsb.org", "Cristiana.Savoia@tcdsb.org", "tatjana.schomer@tcdsb.org", "erika.schroll@tcdsb.org", "elizabeth.sedej@tcdsb.org", "elizabeth.silva-gomes@tcdsb.org", "jessica.skeath-makxam@tcdsb.org", "jennifer.smolders-godfrey@tcdsb.org", "lidija.sprem@tcdsb.org", "junho.song@tcdsb.org", "halyna.stasiv@tcdsb.org", "catherine.stasiw@tcdsb.org", "sandra.storey@tcdsb.org", "darryl.stroszka@tcdsb.org", "dubravka.tomic@tcdsb.org", "denise.trasolini@tcdsb.org", "domenico.trentadue@tcdsb.org", "mark.tuohy@tcdsb.org", "iolanda.viterbo@tcdsb.org", "julie.vitro@tcdsb.org", "michael.vukasinovic@tcdsb.org", "james.warren@tcdsb.org", "luke.wilson@tcdsb.org"]
 
   
    
    
    var emailAddress = ""
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        myCell.textLabel?.text = names[indexPath.row]
        myCell.detailTextLabel?.text = emails[indexPath.row]
        return myCell
    }
    
    func tableView(_ tableview: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let something = URL(string: "mailto:\(emails[indexPath.row])") {
            UIApplication.shared.open(something)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


