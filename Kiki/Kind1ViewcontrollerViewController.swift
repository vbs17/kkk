
import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import SVProgressHUD
import ReachabilitySwift


class Kind1ViewcontrollerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Kind1TableViewCellDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var you: UIButton!
    
    fileprivate let mySections: NSArray = ["A", "B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    let AllItems: [[String]]  = [[ "ABBA",
                                   "Aaron Neville",
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
                                   "Alanis Morissette",
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
                                  "B.B. King",
                                  "Beach Boys",
                                  "Beady Eye",
                                  "Beastie Boys",
                                  "The Beatles",
                                  "Beck",
                                  "Bee Gees",
                                  "Belinda Carlisle",
                                  "BELLE AND SEBASTIAN",
                                  "Ben E.King",
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
                                  "Billy Idol",
                                  "Billy Joel",
                                  "Bing Crosby",
                                  "BiS",
                                  "Bjork",
                                  "The Black Crowes",
                                  "The Black Eyed Peas",
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
                                    "The Charlatans",
                                    "Charlotte Gainsbourg",
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
                                    "Cloudberry Jam",
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
                                 ["The Damned",
                                  "Damn Yankees",
                                  "Damon and Naomi",
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
                                  "Dr. Feelgood",
                                  "Dr. John",
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
                                  "Emerson, Lake & Palmer",
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
                                  "Fountains Of Wayne",
                                  "Frankie Goes To Hollywood",
                                  "Frank Sinatra",
                                  "Frank Zappa",
                                  "Franz Ferdinand",
                                  "The Fratellis",
                                  "Free",
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
                                  "Guided By Voices",
                                  "Guitar",
                                  "Guns N Roses"
        ],
                                 ["Hadouken",
                                  "Hanoi Rocks",
                                  "Hanson",
                                  "Happy Mondays",
                                  "HARD FI",
                                  "Hayley",
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
                                  "The Jam",
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
                                  "John Mayer",
                                  "Johnny Cash",
                                  "Johnny Marr",
                                  "Johnny Thunders & Heartbreakers",
                                  "Johnny Winter",
                                  "John Squire",
                                  "John Taylor",
                                  "Joni Mitchell",
                                  "Jonny Greenwood",
                                  "Jon Secada",
                                  "Jon Spencer Blues Explosion",
                                  "Jose Gonzalez",
                                  "Josh Groban",
                                  "Journey",
                                  "Joy Division",
                                  "Juliana Hatfield",
                                  "Julian Lennon",
                                  "Julie London",
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
                                  "Killers",
                                  "Killing Joke",
                                  "The Kills",
                                  "King Crimson",
                                  "Kings Of Leon",
                                  "Kinks",
                                  "KISS",
                                  "Klaus Nomi",
                                  "Klaxons",
                                  "Kooks",
                                  "KOЯN",
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
                                  "Los Lobos",
                                  "Lostprophets",
                                  "Lou Reed",
                                  "Lou Reed and John Cale",
                                  "Lowell Fulson",
                                  "LUNA",
                                  "Luscious Jackson",
                                  "Lynyrd Skynyrd"],
                                 
                                 ["Madness",
                                  "Madonna",
                                  "Magazine",
                                  "The Magic Numbers",
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
                                  "Martika",
                                  "Mary Hopkin",
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
                                  "Michael McDonald",
                                  "Michael Schenker Group",
                                  "Michelle Branch",
                                  "Mick Jagger",
                                  "Mick Ronson",
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
                                  "The Monkees",
                                  "The Montrose Avenue",
                                  "The Moody Blues",
                                  "The Mopeds",
                                  "Morrissey",
                                  "Mott the Hoople",
                                  "Mover",
                                  "Mr.BIG",
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
                                  "Robbie Williams",
                                  "Robert Cray",
                                  "Robert Johnson",
                                  "Robert Plant",
                                  "Rockapella",
                                  "Rodrigo y Gabriela",
                                  "Rod Stewart",
                                  "Roger Waters",
                                  "The Rolling Stones",
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
                                  "Ry Cooder's and Cuban son musicians"
                                    
        ],
                                 ["Santana",
                                  "Sarah Brightman",
                                  "Sarah McLachlan",
                                  "Savage Garden",
                                  "Scatman John",
                                  "Scritti Politti",
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
                                  "Stacie Orrico",
                                  "Starship",
                                  "Steely Dan",
                                  "Stereolab",
                                  "Stereophonics",
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
                                  "STYX",
                                  "Sublime",
                                  "Suede",
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
                                  "Tata Young",
                                  "t A T u",
                                  "Taylor Swift",
                                  "Tears For Fears",
                                  "Ted Lennon",
                                  "Teenage Fanclub",
                                  "Televisio",
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
                                  "22 20s"
                                    
        ],
                                 ["U2",
                                  "US5",
                                  "Usher"
        ],
                                 ["Valensia",
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
                                  "The Wildhearts",
                                  "Wings",
                                  "The Wonder Stuff"  ],
                                 ["The XX",
                                  "XTC"
        ],
                                 ["The Yardbirds",
                                  "Yell",
                                  "Yellowcard",
                                  "Yes",
                                  "Yoko Ono",
                                  "Yo La Tengo",
                                  "Yves Montand"],
                                 [
                                    "Zach Ashton",
                                    "ZEBRAHEAD",
                                    "The Zombies",
                                    "Zwan",
                                    "ZZ TOP"
        ]]
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
    
    override func viewWillAppear(_ animated: Bool) {
        tappedCellPos = nil
        genre = ""
        isRowSelected = false
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "Kind1TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CCell")
        tappedCellPos = nil
        
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

    
    
    
    
    @IBAction func post(_ sender: Any) {
        if isRowSelected {
            let reachability = Reachability()!
            if reachability.isReachable {
                let ongen = UUID().uuidString
                print("Post")
                saveSong(uuid: ongen)
                print("saveSong")
                SVProgressHUD.setDefaultMaskType(.clear)
                SVProgressHUD.show()
            } else {
                let alert = UIAlertController()
                let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
                let attributedTitle = NSAttributedString(string: "😬", attributes: attributedTitleAttr)
                alert.setValue(attributedTitle, forKey: "attributedTitle")
                let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
                let attributedMessage = NSAttributedString(string: "接続状態が不安定です", attributes: attributedMessageAttr)
                alert.view.tintColor = UIColor.black
                alert.setValue(attributedMessage, forKey: "attributedMessage")
                let subview = alert.view.subviews.first! as UIView
                let alertContentView = subview.subviews.first! as UIView
                alertContentView.backgroundColor = UIColor.gray
                
                let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                    (action: UIAlertAction!) -> Void in
                })
                alert.addAction(defaultAction)
                present(alert, animated: true, completion: nil)
                alert.view.tintColor = UIColor.white
                
            }
            
            // セルが選択されている時の処理を記述
            
        } else {
            // 行が選択されていない＝ジャンルが選択されていない
            let alert = UIAlertController()
            let attributedTitleAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedTitle = NSAttributedString(string: "MUST", attributes: attributedTitleAttr)
            alert.setValue(attributedTitle, forKey: "attributedTitle")
            let attributedMessageAttr = [NSForegroundColorAttributeName: UIColor.black]
            let attributedMessage = NSAttributedString(string: "ジャンルを選択しよう", attributes: attributedMessageAttr)
            alert.view.tintColor = UIColor.black
            alert.setValue(attributedMessage, forKey: "attributedMessage")
            let subview = alert.view.subviews.first! as UIView
            let alertContentView = subview.subviews.first! as UIView
            alertContentView.backgroundColor = UIColor.gray
            
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{
                (action: UIAlertAction!) -> Void in
            })
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            alert.view.tintColor = UIColor.white
        }
    }
    

        
    
    @IBAction func hougo(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)

    }

    

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
        let postData = ["time":time,"byou": kazu, "songname": songName, "ongen": uuid,"original":original,"cover":cover, "uid":uid] as [String : Any]
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

