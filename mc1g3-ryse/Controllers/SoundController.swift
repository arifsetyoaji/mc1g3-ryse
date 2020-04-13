//
//  SoundController.swift
//  mc1g3-ryse
//
//  Created by derry on 03/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import UIKit
import AVFoundation

class SoundController: UITableViewController {
    
    var selectedIndexPath: IndexPath? = IndexPath(row: 0, section: 0)
    
    var audioPlayer: AVAudioPlayer!
    
    var selectedSound = ""
    
    var soundList = [
        SoundData(fileName: "Analog Watch Alarm"),
        SoundData(fileName: "Annoying Alarm Clock"),
        SoundData(fileName: "Beep"),
        SoundData(fileName: "Horn"),
        SoundData(fileName: "Metronome"),
        SoundData(fileName: "Metal Metronome"),
        SoundData(fileName: "Siren"),
        SoundData(fileName: "Busy Signal"),
        SoundData(fileName: "Bleep"),
        SoundData(fileName: "Bomb Siren"),
        SoundData(fileName: "Fire Pager"),
        SoundData(fileName: "Japanese Temple Bell Small"),
        SoundData(fileName: "Loud Alarm Clock Buzzer"),
        SoundData(fileName: "Old Fashioned Old Bell"),
        SoundData(fileName: "Old Fashioned School Bell"),
        SoundData(fileName: "Rooster"),
        SoundData(fileName: "Ship Brass Bell"),
        SoundData(fileName: "Store Door"),
        SoundData(fileName: "Temple Bell Bigger"),
        SoundData(fileName: "Tornado Siren 2"),
        SoundData(fileName: "Zombie Demon Spawn"),
    ]
    
    var selectSoundName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return soundList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "soundCollection", for: indexPath)
        
        //Sorting array
        soundList = soundList.sorted(by: { $0.fileName < $1.fileName })
        
        let list = soundList[indexPath.row]
        
        cell.textLabel?.text = list.fileName
        
        if indexPath == selectedIndexPath {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let file = soundList[indexPath.row].fileName
        
        let soundName = file.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
        
        playSound(sound: soundName + ".mp3")
        
        selectedIndexPath = indexPath
        
        selectSoundName = file
        
        tableView.reloadData()
        
    }
    
    func playSound(sound: String) {
        
//       let soundPath = Bundle.main.url(forResource: sound, withExtension: "mp3")
    let soundPath = Bundle.main.path(forResource: sound, ofType:nil)!
    let url = URL(fileURLWithPath: soundPath)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error gk ada data.")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let dest = segue.destination as! AddAlarmViewController
       
       selectedSound = soundList[selectedIndexPath!.row].fileName
       dest.toneAdded = selectedSound
       
       print(selectedSound)
    }
    
    
}
