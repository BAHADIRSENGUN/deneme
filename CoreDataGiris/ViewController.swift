//
//  ViewController.swift
//  CoreDataGiris
//
//  Created by Bircan Sezgin on 11.03.2023.
//

import UIKit
import CoreData

// Tum islemler Bununla yapiliyor.
let appDelegete = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
// data kisminda olusturgumuz(modelini) veri tabanini buraya yerlestiriyoruz.
//Cogunlukla -  Veri kaydetme Okumada gereklidir.
// Veri cekmede de kullanilir
    let context = appDelegete.persistentContainer.viewContext
    
    @IBOutlet weak var userNameTextField: UITextField!
    var kisilerListe = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        veriKaydi()
  
        
    }
        // Veri kaydi
    func veriKaydi(){
    // Kisiler tabosundan bir nesene olusutruyoruz!
        let kisi = Kisiler(context: context)
        kisi.kisi_ad = userNameTextField.text!
        kisi.kisi_yas = 0
    // olusturulan isim ve yas nesnelerini veri tabananina kaydetmek icin bunu kullaniyoruz.
        appDelegete.saveContext()
    }
    
    func veriOkuma(){
        
        
        do{
            kisilerListe = try context.fetch(Kisiler.fetchRequest())
        }catch{
            print("veri okurken hata olustu")
        }
        
        for k in kisilerListe{
            print("ad = \(k.kisi_ad!) yas = \(k.kisi_yas)")
        }
    }

}

