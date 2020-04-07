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
    
    var soundList = [
        SoundData(fileName: "AnalogWatchAlarm", selected: true),
        SoundData(fileName: "AnnoyingAlarmClock", selected: false),
        SoundData(fileName: "Beep", selected: false),
        SoundData(fileName: "Horn", selected: false),
        SoundData(fileName: "Metronome", selected: false),
        SoundData(fileName: "Siren", selected: false),
    ]
    
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
        
        soundList[indexPath.row].selected = !soundList[indexPath.row].selected
        
        playSound(sound: soundList[indexPath.row].fileName)
        
        selectedIndexPath = indexPath
        
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            cell.accessoryType = .none
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func playSound(sound: String) {
        let soundPath = Bundle.main.url(forResource: sound, withExtension: "mp3")
        
        print(soundPath)
        audioPlayer = try! AVAudioPlayer(contentsOf: soundPath!)
        audioPlayer?.play()
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
