## Greetings Traveler!

This simple 46 line script records all sales and purchases made in the auction house to a local file. Later, this file can be read and the transactions can be stored in a SQL database or any other database of your choice.

Yes, I know there are addons like TSM that store all this information and much more. However, I find them excessively complex and it was easier for me to develop this small script than to try to extract data from TSM's local database.

## Features
 * Lightweight and Simple: Only does what you need, without unnecessary complications.
 * Local Recording: Saves all transactions to a local file.
 * Easy Integration: You can read the file and transfer the data to any database you prefer.
## Install

In order to install this addon just simply create a folder called AipoxMailLedger inside of C:\Program Files (x86)\World of Warcraft\_classic_\Interface\AddOns and paste the addons files (AipoxMailLedger.lua & AipoxMailLedger.toc) inside.

## How does it work?
Every time you open your mail inbox and click on **"open all"**  it will read the auction house emails and store the data into the savedVariables files, located here:

C:\Program Files (x86)\World of Warcraft\_classic_\WTF\Account\**YOUR ACCOUNT**\SavedVariables\AipoxMailLedger.lua

It will look something like this:

~~

AipoxMailLedgerDB = {

	["Horde Auction House-Auction successful: Whiptail (10)-1"] = {
		["timestamp"] = 1718629822,
		["transaction"] = "seller",
		["item"] = "Whiptail",
		["amount"] = 422410,
	},
	["Horde Auction House-Auction won: Golden Pigment (2)-1"] = {
		["timestamp"] = 1718627965,
		["transaction"] = "buyer",
		["item"] = "Golden Pigment",
		["amount"] = 179984,
	},
}
~~

## WARNING

The addon saves data to the SavedVariables file only when you perform one of the following actions:
* use the /reload command
* log out
* exit the game.

So if you have opened an email and dont see a thing in SavedVariables\AipoxMailLedger.lua enter /reload command

## Compatability

The addon is currently build for Cataclysm classic version 40400.
If you wish to try to use this addon on a different version  open the file AipoxMailLedger.toc and modify the interface parameter.

~~
## Interface: 40400 // CHANGE THIS FOR WHATEVER VERSION 
## Title: AipoxMailLedger
## Notes: Register auctions sales & purchases and stores in json
## Author: Roteira-Gehennas
## Version: 1.0
## SavedVariables: AipoxMailLedgerDB
AipoxMailLedger.lua

~~
## Contributing
If you would like to contribute to the development of this addon:

Fork the repository.
Create a new branch (git checkout -b feature-branch).
Commit your changes (git commit -m 'Add new feature').
Push to the branch (git push origin feature-branch).
Open a Pull Request.
License
This addon is licensed under the MIT License.

Contact
For questions or support, you can reach me on discord AIPOX #8367 or [Linkedin](https://www.linkedin.com/in/albertoperezortega/)

