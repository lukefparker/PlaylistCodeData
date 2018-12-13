//
//  SongsTableViewController.swift
//  PlaylistCoreData
//
//  Created by Karl Pfister on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController {
    
    //MARK: Outlets
    var playlistLandingPad: Playlist? //Source of truth
    //MARK: Lifecycle
    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var songNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func plusButtonTapped(_ sender: Any) {
        guard let songName = songNameTextField.text, let artistName = artistNameTextField.text, let playlist = playlistLandingPad else { return }
        
        SongController.sharedInstance.createSong(songWithTitle: songName, artist: artistName, playList: playlist)
        //Unwrap the text from the songNameTF
        //Unwrap the text from the artistNameTF
        //Unwrap my playlist
        
        //create song
        songNameTextField.text = ""
        artistNameTextField.text = ""
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlistLandingPad?.songs?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        guard let unwrappedPlaylist = playlistLandingPad else { return UITableViewCell()}
        if let song = unwrappedPlaylist.songs?[indexPath.row] as? Song {
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlistLandingPad else { return }
            guard let song = playlist.songs?[indexPath.row] as? Song else { return }
           SongController.sharedInstance.deleteSong(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
    

}
