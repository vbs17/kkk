
import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import SVProgressHUD
import ReachabilitySwift


class Kind1ViewcontrollerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Kind1TableViewCellDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let mySections: NSArray = ["A", "B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let AllItems: [[String]]  = [["Aaron Neville",
                                  "ABBA",
                                  "ABC",
                                  "ACDC",
                                  "Adam Lambert",
                                  "Adele",
                                  "Aerosmith",
                                  "AFI",
                                  "A HA",
                                  "Aimee Mann",
                                  "Air Supply",
                                  "AJR",
                                  "Alanis Morissette",
                                  "Alan Walker",
                                  "Albert Hammond Jr",
                                  "Albert King",
                                  "Album Leaf",
                                  "Alec Empire",
                                  "Alice In Chains",
                                  "Alicia Keys",
                                  "Al Koope",
                                  "ALLiSTER",
                                  "Allman Brothers Band",
                                  "All Saints",
                                  "Alok",
                                  "Alt-j",
                                  "Andrew W K",
                                  "Ani Difranco",
                                  "Anne Dorte Michelsen",
                                  "Anne Murray",
                                  "Antonio Carlos Jobim",
                                  "A Perfect Circle",
                                  "Apples In Stereo",
                                  "Aqualung",
                                  "Arabesque",
                                  "Arab Strap",
                                  "Arcade Fire",
                                  "Arch Enemy",
                                  "Arctic Monkeys",
                                  "Ariana Grande",
                                  "THE ARTIST FORMARLY KNOWN AS PRINCE",
                                  "Art Of Noise",
                                  "A S A P",
                                  "Ash",
                                  "Asia",
                                  "Astor Piazzolla",
                                  "A Teens",
                                  "Atomic Kitten",
                                  "Audioslave",
                                  "Auteurs",
                                  "Avril Lavigne",
                                  "Aztec Camera"
        
        ],
                                 ["B52 s",
                                  "Babyshambles",
                                  "Badfinger",
                                  "Badly Drawn Boy",
                                  "BAD MANNERS",
                                  "Bad Religion",
                                  "Bananarama",
                                  "The Band",
                                  "Band Aid",
                                  "The Bangles",
                                  "Barry White",
                                  "Basia",
                                  "Battles",
                                  "Bay City Rollers",
                                  "B B King",
                                  "Beach Boys",
                                  "Beady Eye",
                                  "Beastie Boys",
                                  "The Beatles",
                                  "Beck",
                                  "Bee Gees",
                                  "Belinda Carlisle",
                                  "BELLE AND SEBASTIAN",
                                  "Ben E King",
                                  "Ben Folds Five",
                                  "Ben Harper",
                                  "Ben Lee",
                                  "Benny Sings",
                                  "Bent Fabric",
                                  "Ben Watt",
                                  "Ben Westbeech",
                                  "Bernard Butler",
                                  "The Beta Band",
                                  "Beth Orton",
                                  "Bette Midler",
                                  "Bibio",
                                  "Bill Evans",
                                  "Billy Idol",
                                  "Billy Joel",
                                  "Big Sean",
                                  "Bing Crosby",
                                  "BiS",
                                  "Bjork",
                                  "The Black Crowes",
                                  "The Black Eyed Peas",
                                  "The Black keys",
                                  "BLACK REBEL MOTORCYCLE CLUB",
                                  "Black Sabbath",
                                  "Blind Faith",
                                  "BLIND GUARDIAN",
                                  "Blind Melon",
                                  "Blink-182",
                                  "Bloc Party",
                                  "Blood Red Shoes",
                                  "The Blues Brothers",
                                  "The Bluetones",
                                  "Blur",
                                  "BMX Bandits",
                                  "Bobby Caldwell",
                                  "Bob Dylan",
                                  "Bob Marley",
                                  "Bob Marley & The Wailers",
                                  "Bombay Bicycle Club",
                                  "Bon Iver",
                                  "Bon Jovi",
                                  "Bonnie ”Prince” Billy",
                                  "Booker T",
                                  "The Boo Radleys",
                                  "Bootsy Collins",
                                  "Boss Hog",
                                  "Boston",
                                  "Boy George",
                                  "Boys Town Gang",
                                  "Boyz II Men",
                                  "Boz Scaggs",
                                  "Brian Eno",
                                  "Brian Harold May",
                                  "Brian Setzer",
                                  "Bright Eyes",
                                  "British Sea Power",
                                  "Britney Spears",
                                  "Broken Social Scene",
                                  "Bruce Springsteen",
                                  "Bruno Mars",
                                  "Bryan Adams",
                                  "Bryan Ferry",
                                  "Buddy Guy",
                                  "Burt Bacharach",
                                  "Bush",
                                  "Busted",
                                  "Butter 08",
                                  "Butthole Surfers",
                                  "Buzzcocks",
                                  "The Byrds"
        ],
                                 [
                                    "Caesars",
                                    "Cajun Dance Party",
                                    "CAKE",
                                    "The Calling",
                                    "Calvin Harris",
                                    "CAN",
                                    "Captain Beefheart and His Magic Band",
                                    "Carcass",
                                    "Cardigans",
                                    "Carole King",
                                    "Carole Serrat",
                                    "Carpenters",
                                    "Cars",
                                    "Carter USM",
                                    "Cat Stevens",
                                    "Cecile Corbel",
                                    "Celine Dion",
                                    "Celtic Woman",
                                    "The Chainsmokers",
                                    "The Charlatans",
                                    "Charlotte Gainsbourg",
                                    "The Chemical Brothers",
                                    "Cheap Trick",
                                    "Chet Atkins",
                                    "Chic",
                                    "Chicago",
                                    "!!!",
                                    "Chris De Burgh",
                                    "Chris Rea",
                                    "Christina Aguilera",
                                    "Christopher Cross",
                                    "Christopher Young",
                                    "Chuck Berry",
                                    "Cinderella",
                                    "CINNAMON",
                                    "Clap Your Hands Say Yeah",
                                    "The Clash",
                                    "Clementine",
                                    "Clean Bandit",
                                    "Cloudberry Jam",
                                    "CNCO",
                                    "Cocteau Twins",
                                    "Coldplay",
                                    "Collective Soul",
                                    "Commodores",
                                    "Connie Francis",
                                    "Coral",
                                    "Corinne Bailey Rae",
                                    "Cornershop",
                                    "Corrs",
                                    "Courtney Love",
                                    "Coverdale-Page",
                                    "Cowboy Junkies",
                                    "Craig David",
                                    "Cranberries",
                                    "CREAM",
                                    "Cribs",
                                    "CSN and Y",
                                    "CSS",
                                    "The Cult",
                                    "Culture Club",
                                    "Cure",
                                    "Curve",
                                    "Cyndi Lauper"],
                                 [
                                    "Daft Punk",
                                    "The Damned",
                                    "Damn Yankees",
                                    "Damon and Naomi",
                                    "Damon Albarn",
                                    "Daniel Lanois",
                                    "Daniel Powter",
                                    "Danzig",
                                    "Daryl Hall",
                                    "Daryl Hall & John Oates",
                                    "Dashboard Confessional",
                                    "David Bowie",
                                    "David Gilmour",
                                    "David Sylvian",
                                    "Dead Can Dance",
                                    "Dead Or Alive",
                                    "Death Cab For Cutie",
                                    "Death From Above 1979",
                                    "Death In Vegas",
                                    "Debbie Gibson",
                                    "Deep Purple",
                                    "Deerhoof",
                                    "Depeche Mode",
                                    "Derek and the Dominos",
                                    "Derek Trucks",
                                    "Descendents",
                                    "Des'ree",
                                    "Destiny's Child",
                                    "Devendra Banhart",
                                    "DEVO",
                                    "Diana King",
                                    "Dinosaur Jr",
                                    "Dionne Warwick",
                                    "Dixie Chicks",
                                    "Dodgy",
                                    "Donald Fagen",
                                    "Donavon Frankenreiter",
                                    "Donots",
                                    "Donovan",
                                    "The Doobie Brothers",
                                    "The Doors",
                                    "Drake",
                                    "Dr Feelgood",
                                    "Dr John",
                                    "Dropkick Murphys",
                                    "Duane Allman",
                                    "Duran Duran"
        ],
                                 ["Eagle-Eye Cherry",
                                  "Eagles",
                                  "Earth Wind And Fire",
                                  "Echo & The Bunnymen",
                                  "Echobelly",
                                  "Eddi Reader",
                                  "Edith Piaf",
                                  "Ed Sheeran",
                                  "Eels",
                                  "18 Wheeler",
                                  "Einsturzende Neubauten",
                                  "Elastica",
                                  "Electric Light Orchestra",
                                  "Electronic",
                                  "Elliott Smith",
                                  "Elliott Yamin",
                                  "El Presidente",
                                  "Elton John",
                                  "Elvis Costello",
                                  "Elvis Presley",
                                  "Emerson Lake & Palmer",
                                  "Eminem",
                                  "Emperor",
                                  "Enrique Iglesias",
                                  "Enter Shikari",
                                  "En Vogue",
                                  "Enya",
                                  "Erasure",
                                  "Eric Clapton",
                                  "Eric Martin",
                                  "Eurythmics",
                                  "Evanescence",
                                  "Everything But The Girl",
                                  "Expose"
        ],
                                 ["Faces",
                                  "Fairground Attraction",
                                  "Fairport Convention",
                                  "Fall Out Boy",
                                  "Fastball",
                                  "Faye Wong",
                                  "Feeder",
                                  "Filippa Giordano",
                                  "Fiona Apple",
                                  "The Flaming Lips",
                                  "Flamingoes",
                                  "Fleetwood Mac",
                                  "Foo Fighters",
                                  "Fools Garden",
                                  "Foreigner",
                                  "Forest for the Trees",
                                  "Foster the people",
                                  "Fountains Of Wayne",
                                  "Frankie Goes To Hollywood",
                                  "Frank Sinatra",
                                  "Frank Zappa",
                                  "Franz Ferdinand",
                                  "The Fratellis",
                                  "Free",
                                  "Friendly Fires",
                                  "Fun",
                                  "Funeral For A Friend",
                                  "Funkadelic",
                                  "Fun Lovin' Criminals",
                                  "The Futureheads"
        ],
                                 ["Galactic",
                                  "Galaxie 500",
                                  "Gal Costa",
                                  "Gang Of Four",
                                  "Garbage",
                                  "Gary Moore",
                                  "G B H",
                                  "Gold Panda",
                                  "Gene",
                                  "Generation X",
                                  "Genesis",
                                  "Gene Vincent",
                                  "George Harrison",
                                  "George Michael",
                                  "Get Up Kids",
                                  "GIGANTOR",
                                  "Gigolo Aunts",
                                  "Gilbert OSullivan",
                                  "Gino Vannelli",
                                  "Gipsy Kings",
                                  "Glenn Frey",
                                  "Gloria Estefan",
                                  "G Love",
                                  "Godspeed You Black Emperor",
                                  "Gomez",
                                  "Good Charlotte",
                                  "Goo Goo Dolls",
                                  "Gorillaz",
                                  "Graham Bonnet",
                                  "Graham Coxon",
                                  "Grateful Dead",
                                  "Green Day",
                                  "Grimes",
                                  "Grizzly Bear",
                                  "Guided By Voices",
                                  "Guitar",
                                  "Guns N Roses"
        ],
                                 ["Hadouken",
                                  "Hailee Steinfeld",
                                  "Hall and Oates",
                                  "Hanoi Rocks",
                                  "Hanson",
                                  "Happy Mondays",
                                  "HARD FI",
                                  "Hayley",
                                  "Herbie Hancock",
                                  "Heather Nova",
                                  "Heart",
                                  "Hefne",
                                  "Helloween",
                                  "Her Space Holiday",
                                  "Hilary Duff",
                                  "The Hives",
                                  "The Holloways",
                                  "Holly Cole",
                                  "Holly Valance",
                                  "Hoobastank",
                                  "The Hooters",
                                  "Hootie & the Blowfish",
                                  "Horace Andy",
                                  "The Horrors",
                                  "Hound Dog Taylor",
                                  "Howie D",
                                  "Huey Lewis and The News",
                                  "Hurricane"
        ],
                                 ["Ian Brown",
                                  "Ian McCulloch",
                                  "Iggy Pop",
                                  "Iggy Pop＆the Stooges",
                                  "Ike and Tina Turner",
                                  "IL DIVO",
                                  "Incubus",
                                  "Inspiral Carpets",
                                  "INXS",
                                  "IRON MAIDEN"
        ],
                                 ["Jack Johnson",
                                  "Jackson 5",
                                  "Jackson Browne",
                                  "Jack White",
                                  "Jake Shimabukuro",
                                  "Jaki Graham",
                                  "Jake Bugg",
                                  "The Jam",
                                  "Jamaica",
                                  "James Arthur",
                                  "James Blake",
                                  "James Brown",
                                  "James Blunt",
                                  "James Iha",
                                  "James Morrison",
                                  "James Taylor",
                                  "Jamiroquai",
                                  "Jane Child",
                                  "Jane's Addiction",
                                  "Janet Jackson",
                                  "Janis Joplin",
                                  "Japan",
                                  "Jason Donovan",
                                  "Jason Mraz",
                                  "Jay-Z",
                                  "Jeff Beck",
                                  "Jeff Buckley",
                                  "Jellyfish",
                                  "Jennifer Lopez",
                                  "The Jesus and Mary Chain",
                                  "JET",
                                  "Jethro Tull",
                                  "Jimi Hendrix",
                                  "Jimi Hendrix Experience",
                                  "Jimmy Eat World",
                                  "Jimmy Page and Robert Plant",
                                  "Jim O'Rourke",
                                  "Joao Gilberto",
                                  "Joe Cocker",
                                  "Joe Satriani",
                                  "Joe Strummer",
                                  "John Butler Trio",
                                  "John Cale",
                                  "John Frusciante",
                                  "John Lee Hooker",
                                  "John Lennon",
                                  "John Legend",
                                  "John Mayer",
                                  "Johnny Cash",
                                  "Johnny Marr",
                                  "Johnny Thunders & Heartbreakers",
                                  "Johnny Winter",
                                  "John Squire",
                                  "John Taylor",
                                  "Joni Mitchell",
                                  "Jonny Greenwood",
                                  "Jon Bellion",
                                  "Jon Secada",
                                  "Jon Spencer Blues Explosion",
                                  "Jose Gonzalez",
                                  "Josh Groban",
                                  "Journey",
                                  "Joy Division",
                                  "Juliana Hatfield",
                                  "Julian Lennon",
                                  "Julie London",
                                  "Julia Michaels",
                                  "Julio Iglesias",
                                  "Justin Bieber",
                                  "Justin Timberlake"
                                    
                                    
        ],
                                 
                                 ["Kaiser Chiefs",
                                  "Kajagoogoo",
                                  "Kamelot",
                                  "Kasabian",
                                  "Kate Bush",
                                  "Katy Perry",
                                  "Kbc",
                                  "KD Lang",
                                  "KeSha",
                                  "KEANE",
                                  "Kenny Loggins",
                                  "Keziah Jones",
                                  "The Killers",
                                  "Killing Joke",
                                  "The Kills",
                                  "King Crimson",
                                  "King Krule",
                                  "Kings Of Leon",
                                  "Kinks",
                                  "KISS",
                                  "Klaus Nomi",
                                  "Klaxons",
                                  "The Kooks",
                                  "KORN",
                                  "Kraftwerk",
                                  "KT Tunstall",
                                  "KULA SHAKER",
                                  "Kylie Minogue"
                                    
        ],
                                 ["L7",
                                  "Lady Antebellum",
                                  "Lady GaGa",
                                  "Larry Carlton",
                                  "The Las",
                                  "Last Days Of April",
                                  "Laura Fygi",
                                  "LCD Soundsystem",
                                  "LeAnn Rimes",
                                  "Led Zeppelin",
                                  "The Lemonheads",
                                  "The Lemon Twigs",
                                  "The Leningrad Cowboys",
                                  "Lenny Kravitz",
                                  "Leona Lewis",
                                  "Leonard Cohen",
                                  "Libera",
                                  "The Libertines",
                                  "The Lightning Seeds",
                                  "The Lilac Time",
                                  "Lily Allen",
                                  "Limp Bizkit",
                                  "Linda Ronstadt",
                                  "Lindsay Lohan",
                                  "Linkin Park",
                                  "Lionel Richie",
                                  "Lisa Left Eye Lopes",
                                  "Lisa Loeb",
                                  "Lisa Stansfield",
                                  "Little Feat",
                                  "Little Richard",
                                  "Little Walter",
                                  "The Living End",
                                  "Los Campesinos!",
                                  "Los Lobos",
                                  "Lostprophets",
                                  "Lou Reed",
                                  "Lou Reed and John Cale",
                                  "Louis Armstrong",
                                  "The Lovin Spoonful",
                                  "Lowell Fulson",
                                  "LUNA",
                                  "Luscious Jackson",
                                  "Luis Fonsi Daddy Yankee",
                                  "Lynyrd Skynyrd"],
                                 
                                 ["Madness",
                                  "Machine Gun Kelly",
                                  "Madonna",
                                  "Magazine",
                                  "The Magic Numbers",
                                  "Major Lazer",
                                  "The Mamas and the Papas",
                                  "Mando Diao",
                                  "Manic Street Preachers",
                                  "Mano Negra",
                                  "Mansun",
                                  "Marc Bolan",
                                  "Mariah Carey",
                                  "Marilyn Manson",
                                  "Marilyn Monroe",
                                  "Marion",
                                  "Maroon 5",
                                  "The Mars Volta",
                                  "Martin Jensen",
                                  "Martika",
                                  "Mary Hopkin",
                                  "Martin Garrix",
                                  "Marvin Gaye",
                                  "Matchbox Twenty",
                                  "Mathieu Boogaerts",
                                  "Matt Bianco",
                                  "Matthew Sweet",
                                  "Maximo Park",
                                  "MC5",
                                  "Me First and the Gimme Gimmes",
                                  "Megadeth",
                                  "Meja",
                                  "Men at Work",
                                  "Menswear",
                                  "Mercury Rev",
                                  "Metallica",
                                  "MGMT",
                                  "M I A",
                                  "Miami Sound Machine",
                                  "Mice Parade",
                                  "Michael Bolton",
                                  "Michael Franks",
                                  "Michael Jackson",
                                  "Michael Kiwanuka",
                                  "Michael McDonald",
                                  "Michael Schenker Group",
                                  "Michelle Branch",
                                  "Mick Jagger",
                                  "Mick Ronson",
                                  "Migos",
                                  "The Mighty Mighty Bosstones",
                                  "Mika",
                                  "Mike Oldfield",
                                  "Millencolin",
                                  "Milli Vanilli",
                                  "Ministry",
                                  "Minnie Riperton",
                                  "Mishka",
                                  "Modest Mouse",
                                  "Mogwai",
                                  "The Mojos",
                                  "The Monkees",
                                  "The Montrose Avenue",
                                  "The Moody Blues",
                                  "The Mopeds",
                                  "Morrissey",
                                  "Mott the Hoople",
                                  "Mover",
                                  "Mr BIG",
                                  "Muddy Waters",
                                  "Mudhoney",
                                  "Mum",
                                  "Muse",
                                  "The Music",
                                  "Mutemath",
                                  "MxPx",
                                  "My Bloody Valentine",
                                  "My Chemical Romance",
                                  "Mystery Jets"
                                    
        ],
                                 ["Nat King Cole",
                                  "Ned Doheny",
                                  "Neil Diamond",
                                  "Neil Young",
                                  "Neil Young and Crazy Horse",
                                  "Nelly Furtado",
                                  "Nelson",
                                  "New Found Glory",
                                  "New Order",
                                  "New Radicals",
                                  "New York Dolls",
                                  "Nick Carter",
                                  "Nick Cave and The Bad Seeds",
                                  "Nick Drake",
                                  "Nickelback",
                                  "Nick Heyward",
                                  "Nick Lachey",
                                  "Nick Lowe",
                                  "Nick Wood",
                                  "Nicky Jam",
                                  "Nico",
                                  "Nilon Bombers",
                                  "Nilsson",
                                  "Nine Inch Nails",
                                  "Nirvana",
                                  "Nocturnal Rites",
                                  "No Doubt",
                                  "Noel Gallaghers High Flying Birds",
                                  "NOFX",
                                  "Noise Addict",
                                  "Norah Jones",
                                  "Northern Uproar",
                                  "N Sync",
                                  "Nuno Bettencourt"
        ],
                                 ["Oasis",
                                  "Ocean Colour Scene",
                                  "Offspring",
                                  "Ok Go",
                                  "Olivia Newton John",
                                  "One Direction",
                                  "Orange Deluxe",
                                  "Ordinary Boys",
                                  "Orianthi",
                                  "Origa",
                                  "Owl City",
                                  "Ozma",
                                  "Ozomatli",
                                  "O ZON",
                                  "Ozzy Osbourne"
        ],
                                 ["P!nk",
                                  "Pale Saints",
                                  "Panic! At The Disco",
                                  "Paris Hilton",
                                  "Passion Pit",
                                  "Pastels",
                                  "Pat Benatar",
                                  "Patti Smith",
                                  "Paul Frederic Simon",
                                  "Paul McCartney",
                                  "Paul Weller",
                                  "Pavement",
                                  "Pearl Jam",
                                  "Penguin Cafe Orchestra",
                                  "Pennywise",
                                  "Pernice Brothers",
                                  "Perry Farrell",
                                  "Peter, Paul and Mary",
                                  "Peter Bjorn & John",
                                  "Peter Cetera",
                                  "Peter Gabriel",
                                  "Pet Shop Boys",
                                  "Pharrell Williams",
                                  "Phoenix",
                                  "Pig",
                                  "P I L",
                                  "Pink Floyd",
                                  "Pirates",
                                  "Pixies",
                                  "PJ Harvey",
                                  "POGO POPS",
                                  "The Pogues",
                                  "The Police",
                                  "The Polyphonic Spree",
                                  "The Pop Group",
                                  "Portishead",
                                  "The Posies",
                                  "Prefab Sprout",
                                  "The Presidents Of The United States Of America",
                                  "The Pretenders",
                                  "Primal Scream",
                                  "Primus",
                                  "Prince",
                                  "Procol Harum",
                                  "The Prodigy",
                                  "The Promise Ring",
                                  "Pulp",
                                  "The Punkles",
                                  "The Pussycat Dolls",
                                  "Pussy Galore"
        ],
                                 ["The Qemists",
                                  "Quasi",
                                  "Queen",
                                  "Queens Of The Stone Age",
                                  "Quiet Riot"
        ],
                                 ["Radiohead",
                                  "Rage Against the Machine",
                                  "Rainbow",
                                  "The Rakes",
                                  "Ramones",
                                  "RANCID",
                                  "The Rapture",
                                  "Ra Ra Riot",
                                  "The Rascals",
                                  "Ray Charles",
                                  "RAZORLIGHT",
                                  "The Real McCoy",
                                  "Redd Kross",
                                  "Red Hot Chili Peppers",
                                  "REEF",
                                  "REEL BIG FISH",
                                  "R E M",
                                  "The Rembrandts",
                                  "The Rentals",
                                  "Richard Ashcroft",
                                  "Rickie Lee Jones",
                                  "Ricky Martin",
                                  "Ride",
                                  "The Righteous Brothers",
                                  "Ringo Deathstarr",
                                  "Rivers Cuomo",
                                  "Robin Schulz",
                                  "Robbie Williams",
                                  "Robert Cray",
                                  "Robert Johnson",
                                  "Robert Plant",
                                  "Rockapella",
                                  "Rodrigo y Gabriela",
                                  "Rod Stewart",
                                  "Roger Waters",
                                  "The Rolling Stones",
                                  "Ron Sexsmith",
                                  "Ron Wood",
                                  "Rooney",
                                  "ROOSTER",
                                  "Rory Gallagher",
                                  "Roxette",
                                  "Roxy Music",
                                  "Roy Orbison",
                                  "The Runaways",
                                  "Russell Watson",
                                  "Ry Cooder",
                                  "Ry Cooder's and Cuban son musicians",
                                  "Ryan Adams"
                                    
        ],
                                 ["Santana",
                                  "Sage the Gemini",
                                  "Sarah Brightman",
                                  "Sarah McLachlan",
                                  "Savage Garden",
                                  "Scatman John",
                                  "Scritti Politti",
                                  "Scissor Sisters",
                                  "Sea And Cake",
                                  "The Seahorses",
                                  "THESE ANIMAL MEN",
                                  "Sean Lennon",
                                  "Sean Paul",
                                  "Sergio Mendes",
                                  "Sex Pistols",
                                  "Shakira",
                                  "Sham 69",
                                  "Shampoo",
                                  "Shawn Mendes",
                                  "Shed Seven",
                                  "SHERYL CROW",
                                  "The Shins",
                                  "Sid Vicious",
                                  "Sigur Ros",
                                  "SILVERCHAIR",
                                  "Silver Sun",
                                  "Simon and Garfunkel",
                                  "Simple Plan",
                                  "Simply Red",
                                  "Sinead O'Connor",
                                  "Siouxsie and The Banshees",
                                  "65daysofstatic",
                                  "Skunk Anansie",
                                  "Skye Sweetnam",
                                  "Sleeper",
                                  "Sloan",
                                  "Sly and The Family Stone",
                                  "Small Faces",
                                  "The Smashing Pumpkins",
                                  "Smash Mouth",
                                  "The Smiths",
                                  "Snakehips",
                                  "Snow Patrol",
                                  "Social Distortion",
                                  "Sonic Youth",
                                  "Soul Asylum",
                                  "Soulwax",
                                  "SPACE",
                                  "Spearmint",
                                  "The Specials",
                                  "Spice Girls",
                                  "Spin Doctors",
                                  "Spiritualized",
                                  "Spoon",
                                  "Stacie Orrico",
                                  "Starship",
                                  "Starley Ryan Riback",
                                  "Steely Dan",
                                  "Stereolab",
                                  "Stereophonics",
                                  "Steve Aoki",
                                  "Steve Lukather",
                                  "Steve Winwood",
                                  "Stevie Ray Vaughan",
                                  "Stevie Salas",
                                  "Stevie Wonder",
                                  "Sting",
                                  "The Stone Roses",
                                  "Stone Temple Pilots",
                                  "The Stranglers",
                                  "Stray Cats",
                                  "The Strokes",
                                  "The Style Council",
                                  "St Vincent",
                                  "STYX",
                                  "Sublime",
                                  "Suede",
                                  "Sufjan Stevens",
                                  "Sugarcubes",
                                  "Sugar Ray",
                                  "Sukpatch",
                                  "SUM 41",
                                  "Sundays",
                                  "Super Furry Animals",
                                  "Supergrass",
                                  "Susan Boyle",
                                  "Swan Dive",
                                  "Sweet 75",
                                  "Sweetbox",
                                  "Swing Out Sister",
                                  "Syd Barrett"
        ],
                                 ["Tahiti 80",
                                  "Take That",
                                  "Talking Heads",
                                  "Tame Impala",
                                  "Tata Young",
                                  "t A T u",
                                  "Taylor Swift",
                                  "Tears For Fears",
                                  "Ted Lennon",
                                  "Teenage Fanclub",
                                  "Television",
                                  "Temptations",
                                  "10CC",
                                  "Ten Years After",
                                  "The The",
                                  "They Might Be Giants",
                                  "Therapy?",
                                  "Thin Lizzy",
                                  "311",
                                  "30 Seconds To Mars",
                                  "Thom Yorke",
                                  "The Thrills",
                                  "Thurston Moore",
                                  "Timothy B. Schmit",
                                  "The Ting Tings",
                                  "Tin Machine",
                                  "TLC",
                                  "TNT",
                                  "Toad The Wet Sprocket",
                                  "Todd Rundgren",
                                  "Tommy Guerrero",
                                  "Tom Petty",
                                  "Tom Waits",
                                  "Tony Bennett",
                                  "Torche",
                                  "Tortoise",
                                  "TOTO",
                                  "Tracy Chapman",
                                  "Trashcan Sinatras",
                                  "Travis",
                                  "TRex",
                                  "Trine Rein",
                                  "Trisha Yearwood",
                                  "Tristan Prettyman",
                                  "The Troubadours",
                                  "twenty one pilots ",
                                  "22 20s"
                                    
        ],
                                 ["U2",
                                  "UGK",
                                  "US5",
                                  "Usher"
        ],
                                 ["Valensia",
                                  "The Vamps",
                                  "Vampire Weekend",
                                  "Vanessa Carlton",
                                  "Vanessa Williams",
                                  "Van Halen",
                                  "Van Morrison",
                                  "Velvet Crush",
                                  "Velvet Teen",
                                  "The Velvet Underground",
                                  "The Ventures",
                                  "Veruca Salt",
                                  "The Verve",
                                  "The View",
                                  "Vincent Gallo",
                                  "The Vines",
                                  "VOODOO GLOW SKULLS"],
                                 ["The Wannadies",
                                  "Weezer",
                                  "Westlife",
                                  "Wet Wet Wet",
                                  "Wham！",
                                  "The White Stripes",
                                  "Whitney Houston",
                                  "The Who",
                                  "Whico",
                                  "The Wildhearts",
                                  "Willy moon",
                                  "Wings",
                                  "The Wonder Stuff"  ],
                                 ["The XX",
                                  "XTC"
        ],
                                 ["The Yardbirds",
                                  "Yeah yeah yeahs",
                                  "Yell",
                                  "Yellowcard",
                                  "Yes",
                                  "Yoko Ono",
                                  "Yo La Tengo",
                                  "Yves Montand"],
                                 [
                                    "Zach Ashton",
                                    "Zara Larsson",
                                    "ZEBRAHEAD",
                                    "The Zombies",
                                    "Zwan",
                                    "ZZ TOP"
        ]]
    
   
    override func viewWillAppear(_ animated: Bool) {
        self.readData()
        tappedCellPos = nil
        genre = ""
        isRowSelected = false
        tableView.reloadData()
    }
    
    func saveData(){
        let ud = UserDefaults.standard
        let offset =  self.tableView.contentOffset
        let onset = NSStringFromCGPoint(offset)
        ud.set(onset, forKey: "Iti2")
        ud.synchronize()
    }
    
    func readData(){
        let ud2 = UserDefaults.standard
        let str = ud2.object(forKey: "Iti2")
        if (str == nil) {
            return
        }else{
            let point = CGPointFromString(str as! String)
            self.tableView.contentOffset = point
        }
    }

    
    
    
    @IBOutlet weak var youho: UIButton!
    
   
    @IBAction func hougo(_ sender: Any) {
        self.saveData()
        self.dismiss(animated: false, completion: nil)
        
    }
   
    var songData:URL!
    var image:UIImage!
    //var songname:UITextField!
    //var byou:UILabel!
    var songname:String!
    var byou:String!
    var genre = ""
    var tappedCellPos:IndexPath! //タップされたCellのindexPath
    var buttonOriginalColor:UIColor!//ボタンの元の色
    var isRowSelected:Bool = false//現在行が選択状態か否か
    var original:  NSString?
    var cover: NSString?
    //let cell = tableVView.dequeueReusableCell(withIdentifier: "Celll") as! ItiranTableViewCell

    
    func buttonPressed(_ tableViewCell: Kind1TableViewCell) {
        let indexPath = tableView.indexPath(for: tableViewCell)
        // 初めてのタップ
        if tappedCellPos == nil {
            // オリジナルのボタンの色を取得
            buttonOriginalColor = tableViewCell.button.backgroundColor!
            // ボタンの色を緑に。
            tableViewCell.button.backgroundColor = UIColor.green
            // ジャンルを決定
            genre = AllItems[indexPath!.section][indexPath!.row]
            // 行が選択されている
            isRowSelected = true
            // タップされたセルのindexPathを保存
            tappedCellPos = indexPath
        } else if tappedCellPos == indexPath {
            // 同じセルのn度目のタップ
            // 行が選択された状態なら、元に戻す
            if isRowSelected {
                // ボタンの色を元の色に
                tableViewCell.button.backgroundColor = buttonOriginalColor
                // ジャンルを未選択（空文字）に
                genre = ""
                // 行が非選択状態とする
                isRowSelected = false
                // タップされたセルのindexPathを保存
                tappedCellPos = indexPath
            } else {
                // 行が非選択の状態なら、選択状態にする
                // オリジナルのボタンの色を取得
                buttonOriginalColor = tableViewCell.button.backgroundColor!
                // ボタンの色を緑に。
                tableViewCell.button.backgroundColor = UIColor.green
                // ジャンルを決定
                genre = AllItems[indexPath!.section][indexPath!.row]
                //cell.label.tag = AllItems[indexPath!.row]
                // 行が選択されている
                isRowSelected = true
                // タップされたセルのindexPathを保存
                tappedCellPos = indexPath
            }
        } else {
            // 他の行がタップされた
            // 既に選択状態の行がある
            if isRowSelected {
                if ((tableView.cellForRow(at: tappedCellPos)) != nil){
                    // 既に選択状態の行の選択を解除
                    let oldCell:Kind1TableViewCell = tableView.cellForRow(at: tappedCellPos) as! Kind1TableViewCell
                    oldCell.button.backgroundColor = buttonOriginalColor;
                    
                }
            }            // 今回選択された行を選択状態とする
            // オリジナルのボタンの色を取得
            buttonOriginalColor = tableViewCell.button.backgroundColor!
            // ボタンの色を緑に。
            tableViewCell.button.backgroundColor = UIColor.green
            // ジャンルを決定
            genre = AllItems[indexPath!.section][indexPath!.row]
            // 行が選択されている
            isRowSelected = true
            // タップされたセルのindexPathを保存
            tappedCellPos = indexPath
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "Kind1TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CCell")
        tappedCellPos = nil
        youho.isEnabled = false
        
    }
    
    //値を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CCell", for: indexPath) as! Kind1TableViewCell
        cell.delegate = self
        //ここ
        cell.button.backgroundColor = UIColor.lightGray
        if (tappedCellPos != nil){
            if (tappedCellPos == indexPath){
                cell.button.backgroundColor = UIColor.green
            }
        }
        let items = AllItems[indexPath.section][indexPath.row]
        cell.label.text = items
        return cell
    }

    
    
    @IBAction func post(_ sender: Any) {
        if isRowSelected {
            let reachability = Reachability()!
            if reachability.isReachable {
                let itiranviewcontroller = self.storyboard?.instantiateViewController(withIdentifier: "Itiran11") as! Itiran11ViewController
                itiranviewcontroller.genre1 = genre
                let ongen = UUID().uuidString
                print("Post")
                saveSong(uuid: ongen)
                print("saveSong")
                SVProgressHUD.setDefaultMaskType(.clear)
                SVProgressHUD.show()
            } else {
                let alert = UIAlertController()
                let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
                let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
                alert.setValue(attributedTitle, forKey: "attributedTitle")
                let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
                let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
                alert.view.tintColor = UIColor.black
                alert.setValue(attributedMessage, forKey: "attributedMessage")
                let subview = alert.view.subviews.first! as UIView
                let alertContentView = subview.subviews.first! as UIView
                alertContentView.backgroundColor = UIColor.white
                
                let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                    (action: UIAlertAction!) -> Void in
                })
                alert.addAction(defaultAction)
                present(alert, animated: true, completion: nil)
                alert.view.tintColor = UIColor.black
                
            }
            
            // セルが選択されている時の処理を記述
            
        } else {
            // 行が選択されていない＝ジャンルが選択されていない
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string:"ジャンルを選択しよう", attributes: attributedMessageAttr)
            alert.view.tintColor = UIColor.black
            alert.setValue(attributedMessage, forKey: "attributedMessage")
            let subview = alert.view.subviews.first! as UIView
            let alertContentView = subview.subviews.first! as UIView
            alertContentView.backgroundColor = UIColor.white
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
            })
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            alert.view.tintColor = UIColor.black
        }
        
    }

        
    
    //@IBAction func hougo(_ sender: Any) {
//        self.dismiss(animated: false, completion: nil)

    //}

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  

    func saveSong(uuid: String) {
        let realSongdata = try? Data(contentsOf: URL(fileURLWithPath: songData.path))
        let realsong = realSongdata!.base64EncodedString(options: [])
        let songDataRef = FIRDatabase.database().reference().child(CommonConst.songData1).child(uuid)
        songDataRef.setValue(realsong) { (error, ref) in
            if (error == nil) {
                // 音源保存完了
                // 次に画像保存
                self.saveImage(uuid: uuid)
                print("saveImage")
            } else {
                // 保存エラー
                self.showErrorAlert()
            }
        }
    }
    
    func saveImage(uuid: String) {
        // 画像保存
        let size = CGSize(width: 1242, height: 828)
        UIGraphicsBeginImageContext(size)
        image.draw(in: CGRect(x:0.0, y:0.0, width:size.width, height:size.height))
        let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let imageData = UIImageJPEGRepresentation(resizeImage!, 0.5)
        let postData3 = ["image": imageData!.base64EncodedString(options: .lineLength64Characters)];
        let postRef3 = FIRDatabase.database().reference().child(CommonConst.image1).child(genre).child(uuid)
        postRef3.setValue(postData3) { (error, ref) in
            if (error == nil) {
                // 画像保存完了
                // 次に投稿保存
                self.savePost(uuid: uuid)
                print("savePost")
            } else {
                // 保存エラー
                self.showErrorAlert()
            }
        }
    }
    
    func savePost(uuid: String) {
        // 投稿
        let songName = songname
        let kazu = byou
        let uid:NSString = (FIRAuth.auth()?.currentUser?.uid)! as NSString
        let time = NSDate.timeIntervalSinceReferenceDate
        let original:NSString = (self.original as NSString?)!
        let cover:NSString = (self.cover as NSString?)!
        let postData = ["time":time,"byou": kazu!, "songname": songName!, "ongen": uuid,"original":original,"cover":cover, "uid":uid] as [String : Any]
        let postRef = FIRDatabase.database().reference().child(CommonConst.PostPATH1).child(genre).child(uuid)
        
        postRef.setValue(postData) { (error, ref) in
            if (error == nil) {
                // 画像保存完了
                SVProgressHUD.dismiss()
                // 先頭に戻る
                self.view.window!.rootViewController!.dismiss(animated: false, completion: nil)
            } else {
                // 保存エラー
                self.showErrorAlert()
            }
        }
    }
    
    
    func showErrorAlert() {
        SVProgressHUD.dismiss()
        let alert = UIAlertController()
        alert.title = "保存エラー"
        alert.message = "保存エラーが発生しました。ネットワークの状態を確認して再度投稿ボタンを押してください"
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
            (action: UIAlertAction!) -> Void in
        })
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    //セクションの数を返す.
    func numberOfSections(in tableView: UITableView) -> Int {
        return mySections.count
    }
    
    //セクションのタイトルを返す.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return mySections[section] as? String
    }
    
    //テーブルに表示する配列の総数を返す.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllItems[section].count
    }
    
   
    
}

