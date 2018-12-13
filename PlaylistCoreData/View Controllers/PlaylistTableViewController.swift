//
//  PlaylistTableViewController.swift
//  PlaylistCoreData
//
//  Created by Karl Pfister on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    
    // MARK: Outlets
    @IBOutlet weak var playlistNameLabel: UITextField!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//MARK-Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let playListName = playlistNameLabel.text,
            !playListName.isEmpty else { return }
        
        PlaylistController.sharedInstance.createPlaylist(playlistWithName: playListName)
        //Clean up dust
        playlistNameLabel.text = ""
        tableView.reloadData()
    }
    
    
    
    // MARK: - Table view data source
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.sharedInstance.playlists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        let songCount = playlist.songs?.count ?? 0
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = String(songCount)
        

        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
            PlaylistController.sharedInstance.deletePlaylist(playlistToDelete: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                
            }
            

        
        
        
}
    


