COMMAND_BUYITEM = '#storebuy'
COMMAND_TRANSFER = '#transferpoints'
WEBSITE_GETCOINS = 'https://linktr.ee/pokefanslinks'
COINS_OPCODE = 54

storeIndex = {
    [1] = {
		id = '1',
		name = 'Premium Time',
		description = 'Buy low-priced Premium Time to add it to your own account.',
		image = "/images/shop/premium_time",
		imageList = '/images/shop/premium_time_small'
	},
	[2] = {
		id = '2',
		name = 'General',
		description = 'Buy genearal products to enhance your gameplay.',
		image = "/images/shop/extra_services",
		imageList = '/images/shop/extra_services_small'
	},
	[3] = {
		id = '3',
		name = 'Outfits',
		description = 'Buy your character one or more of the classy Outfits offered here.',
		image = '/images/shop/outfits',
		imageList = '/images/shop/outfits_small' 
	},
	[4] = {
		id = '4',
		name = 'Addons',
		description = 'Buy your pokemon one or more of the fabulous Addons offered here.',
		image = '/images/shop/addons',
		imageList = '/images/shop/addons_small'
	},
	[5] = {
		id = '5',
		name = 'Bundles',
		description = 'Compre pacotes com varios itens por precos menores.',
		image = '/images/shop/bundles',
		imageList = '/images/shop/bundles_small'
	},
	[6] = {
		id = '6',
		name = 'Pokemon Egg',
		description = 'Buy your pokemon eggs offered here.',
		image = '/images/shop/eggs',
		imageList = '/images/shop/eggs_small'
	},
}

storeProducts = {
    {
		name = "30 days",
		category_id = "1",
		description = 'Do you really want to buy "30 days" of premium time?\n\nNote: Once you have purchased Premium Time, your account\ninstantly receives premium status - no relog necessary!',
        tooltip = "",
		price = 10,
		image = "/images/shop/offer/30days"
    },
    {
		name = "90 days",
		category_id = "1",
		description = 'Do you really want to buy "90 days" of premium time?\n\nNote: Once you have purchased Premium Time, your account\ninstantly receives premium status - no relog necessary!',
        tooltip = "",
		price = 29,
		image = "/images/shop/offer/90days"
    },
    {
		name = "180 days",
		category_id = "1",
		description = 'Do you really want to buy "180 days" of premium time?\n\nNote: Once you have purchased Premium Time, your account\ninstantly receives premium status - no relog necessary!',
        tooltip = "",
		price = 56,
		image = "/images/shop/offer/180days"
    },
    {
		name = "360 days",
		category_id = "1",
		description = 'Do you really want to buy "360 days" of premium time?\n\nNote: Once you have purchased Premium Time, your account\ninstantly receives premium status - no relog necessary!',
        tooltip = "",
		price = 110,
		image = "/images/shop/offer/360days"
    },
	
	----- General Shop -----
	
	{
		name = "Bless",
		category_id = "2",
		description = 'Do you really want to buy "Bless"?',
        tooltip = "Previne a perda de experiencia ao morrer.",
		price = 10,
		image = "/images/shop/offer/bless"
    },
	{
		name = "1x Rare Candy",
		category_id = "2",
		description = 'Do you really want to buy "1x Rare Candy"?',
        tooltip = "Aumenta o level de um pokemon em 1.",
		price = 5,
		image = "/images/shop/offer/rarecandy"
    },
	{
		name = "5x Rare Candy",
		category_id = "2",
		description = 'Do you really want to buy "5x Rare Candy"?',
        tooltip = "Aumenta o level de um pokemon em 1.",
		price = 25,
		image = "/images/shop/offer/rarecandy"
    },
	{
		name = "25x Rare Candy",
		category_id = "2",
		description = 'Do you really want to buy "25x Rare Candy"?',
        tooltip = "Aumenta o level de um pokemon em 1.",
		price = 120,
		image = "/images/shop/offer/rarecandy"
    },
	{
		name = "50x Rare Candy",
		category_id = "2",
		description = 'Do you really want to buy "50x Rare Candy"?',
        tooltip = "Aumenta o level de um pokemon em 1.",
		price = 235,
		image = "/images/shop/offer/rarecandy"
    },
	{
		name = "75x Rare Candy",
		category_id = "2",
		description = 'Do you really want to buy "75x Rare Candy"?',
        tooltip = "Aumenta o level de um pokemon em 1.",
		price = 350,
		image = "/images/shop/offer/rarecandy"
    },
	{
		name = "100x Rare Candy",
		category_id = "2",
		description = 'Do you really want to buy "100x Rare Candy"?',
        tooltip = "Aumenta o level de um pokemon em 1.",
		price = 450,
		image = "/images/shop/offer/rarecandy"
    },
	{
		name = "Tera Crystal",
		category_id = "2",
		description = 'Do you really want to buy "Tera Crystal"?',
        tooltip = "Tera Crystal\nMuda o Tera Type do seu pokemon.\nO pokemon precisa ter um Tera Type para utilizar.",
		price = 10,
		image = "/images/shop/offer/teracrystal"
    },
	{
		name = "10x Tera Crystal",
		category_id = "2",
		description = 'Do you really want to buy "10x Tera Crystal"?',
        tooltip = "Tera Crystal\nMuda o Tera Type do seu pokemon.\nO pokemon precisa ter um Tera Type para utilizar.",
		price = 90,
		image = "/images/shop/offer/teracrystal"
    },
	{
		name = "25x Tera Crystal",
		category_id = "2",
		description = 'Do you really want to buy "25x Tera Crystal"?',
        tooltip = "Tera Crystal\nMuda o Tera Type do seu pokemon.\nO pokemon precisa ter um Tera Type para utilizar.",
		price = 200,
		image = "/images/shop/offer/teracrystal"
    },
	{
		name = "Nature Reset",
		category_id = "2",
		description = 'Do you really want to buy "Nature Reset"?',
        tooltip = "Nature Reset\nMuda a nature do pokemon caso ele tenha uma.\nUtilize na pokebola.",
		price = 15,
		image = "/images/shop/offer/nature reset"
    },
	{
		name = "10x Nature Reset",
		category_id = "2",
		description = 'Do you really want to buy "10x Nature Reset"?',
        tooltip = "Nature Reset\nMuda a nature do pokemon caso ele tenha uma.\nUtilize na pokebola.",
		price = 135,
		image = "/images/shop/offer/nature reset"
    },
	{
		name = "25x Nature Reset",
		category_id = "2",
		description = 'Do you really want to buy "25x Nature Reset"?',
        tooltip = "Nature Reset\nMuda a nature do pokemon caso ele tenha uma.\nUtilize na pokebola.",
		price = 250,
		image = "/images/shop/offer/nature reset"
    },
	{
		name = "EV Reset",
		category_id = "2",
		description = 'Do you really want to buy "EV Reset"?',
        tooltip = "EV Reset\nReseta os EVs do pokemon.\nUtilize na pokebola.",
		price = 10,
		image = "/images/shop/offer/evreset"
    },
	{
		name = "Smeargle Reset",
		category_id = "2",
		description = 'Do you really want to buy "Smeargle Reset"?',
        tooltip = "Smeargle Reset\nReseta os moves aprendidos pelo Smeargle.\nUtilize na pokebola.",
		price = 5,
		image = "/images/shop/offer/smeargle reset"
    },
	{
		name = "Rarity Charm",
		category_id = "2",
		description = 'Do you really want to buy "Rarity Charm"?',
        tooltip = "Rarity Charm\nAumenta suas chances de encontrar pokemons raros.\nDura 7 dias.\nPode ser ativado e desativado a vontade para preservar duracao.",
		price = 70,
		image = "/images/shop/offer/megacharm"
    },
	{
		name = "Exp Charm",
		category_id = "2",
		description = 'Do you really want to buy "Exp Charm"?',
        tooltip = "Exp Charm\nAumenta a experiencia recebida em 100%.\nDura 1 hora.\nNao pode ser desativado.",
		price = 10,
		image = "/images/shop/offer/exp charm"
    },
	{
		name = "Checkpoint Console",
		category_id = "2",
		description = 'Do you really want to buy "Checkpoint Console"?',
        tooltip = "Checkpoint Console\nPermite se teleportar para as posicoes salvas.\nAs posicoes podem ser resetadas quando necessario.",
		price = 25,
		image = "/images/shop/offer/checkpoint_console"
    },
	{
		name = "1x Checkpoint Register",
		category_id = "2",
		description = 'Do you really want to buy "1x PokePARK Ticket"?',
        tooltip = "Checkpoint Register\nPermite salvar 1 (uma) posicao no Checkpoint Console.",
		price = 10,
		image = "/images/shop/offer/checkpoint_register"
    },
	{
		name = "5x Checkpoint Register",
		category_id = "2",
		description = 'Do you really want to buy "5x Checkpoint Register"?',
        tooltip = "Checkpoint Register\nPermite salvar 5 (cinco) posicao no Checkpoint Console.",
		price = 40,
		image = "/images/shop/offer/checkpoint_register_bundle"
    },
	{
		name = "10x Checkpoint Register",
		category_id = "2",
		description = 'Do you really want to buy "10x Checkpoint Register"?',
        tooltip = "Checkpoint Register\nPermite salvar 10 (dez) posicao no Checkpoint Console.",
		price = 75,
		image = "/images/shop/offer/checkpoint_register_bundle"
    },
	{
		name = "Mario Kart",
		category_id = "2",
		description = 'Do you really want to buy "Mario Kart"?',
        tooltip = "Mario Kart",
		price = 25,
		image = "/images/shop/offer/mariokart"
    },
	{
		name = "Speed Boots",
		category_id = "2",
		description = 'Do you really want to buy "Speed Boots"?',
        tooltip = "Speed Boots - Solta efeitos ao andar e permite utilizar a outfit desejada.",
		price = 25,
		image = "/images/shop/offer/speedboots"
    },
	{
		name = "Black Bike",
		category_id = "2",
		description = 'Do you really want to buy "Black Bike"?',
        tooltip = "Black Bike",
		price = 10,
		image = "/images/shop/offer/blackbike"
    },
	{
		name = "Pink Bike",
		category_id = "2",
		description = 'Do you really want to buy "Pink Bike"?',
        tooltip = "Pink Bike",
		price = 10,
		image = "/images/shop/offer/pinkbike"
    },
	{
		name = "Yellow Bike",
		category_id = "2",
		description = 'Do you really want to buy "Yellow Bike"?',
        tooltip = "Yellow Bike",
		price = 10,
		image = "/images/shop/offer/yellowbike"
    },
	{
		name = "Red Bike",
		category_id = "2",
		description = 'Do you really want to buy "Red Bike"?',
        tooltip = "Red Bike",
		price = 10,
		image = "/images/shop/offer/redbike"
    },
	{
		name = "Blue Bike",
		category_id = "2",
		description = 'Do you really want to buy "Blue Bike"?',
        tooltip = "Blue Bike",
		price = 10,
		image = "/images/shop/offer/bluebike"
    },
	{
		name = "Green Bike",
		category_id = "2",
		description = 'Do you really want to buy "Green Bike"?',
        tooltip = "Green Bike",
		price = 10,
		image = "/images/shop/offer/greenbike"
    },
	{
		name = "Copper Whistle",
		category_id = "2",
		description = 'Do you really want to buy "Copper Whistle"?',
        tooltip = "Copper Whistle\nVende seus itens no Mark a distancia\nLoot de pokemon.",
		price = 15,
		image = "/images/shop/offer/copperwhistle"
    },
	{
		name = "Silver Whistle",
		category_id = "2",
		description = 'Do you really want to buy "Silver Whistle"?',
        tooltip = "Silver Whistle\nVende seus itens no Henry a distancia\nStones.",
		price = 20,
		image = "/images/shop/offer/silverwhistle"
    },
	{
		name = "Gold Whistle",
		category_id = "2",
		description = 'Do you really want to buy "Gold Whistle"?',
        tooltip = "Gold Whistle\nVende seus itens no Mark e no Henry a distancia\nLoot de pokemon e Stones.",
		price = 30,
		image = "/images/shop/offer/goldwhistle"
    },
	{
		name = "1x PokePARK Ticket",
		category_id = "2",
		description = 'Do you really want to buy "1x PokePARK Ticket"?',
        tooltip = "1x PokePARK Ticket",
		price = 1,
		image = "/images/shop/offer/pokepark"
    },
	{
		name = "5x PokePARK Ticket",
		category_id = "2",
		description = 'Do you really want to buy "5x PokePARK Ticket"?',
        tooltip = "5x PokePARK Ticket",
		price = 4,
		image = "/images/shop/offer/pokepark2"
    },
	{
		name = "10x PokePARK Ticket",
		category_id = "2",
		description = 'Do you really want to buy "10x PokePARK Ticket"?',
        tooltip = "10x PokePARK Ticket",
		price = 8,
		image = "/images/shop/offer/pokepark3"
    },
	{
		name = "15x PokePARK Ticket",
		category_id = "2",
		description = 'Do you really want to buy "15x PokePARK Ticket"?',
        tooltip = "15x PokePARK Ticket",
		price = 10,
		image = "/images/shop/offer/pokepark3"
    },
	{
		name = "10x Clean Disk",
		category_id = "2",
		description = 'Do you really want to buy "10x Clean Disk"?',
        tooltip = "10x Clean Disk",
		price = 2,
		image = "/images/shop/offer/clean disk"
    },
	{
		name = "25x Clean Disk",
		category_id = "2",
		description = 'Do you really want to buy "25x Clean Disk"?',
        tooltip = "25x Clean Disk",
		price = 5,
		image = "/images/shop/offer/clean disk"
    },
	{
		name = "50x Clean Disk",
		category_id = "2",
		description = 'Do you really want to buy "50x Clean Disk"?',
        tooltip = "50x Clean Disk",
		price = 10,
		image = "/images/shop/offer/clean disk"
    },
	{
		name = "100x Clean Disk",
		category_id = "2",
		description = 'Do you really want to buy "100x Clean Disk"?',
        tooltip = "100x Clean Disk",
		price = 20,
		image = "/images/shop/offer/clean disk"
    },
	
	----- Bundles -----
	
	{
		name = "Eevolution Outfit Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Eevolution Outfit Bundle"?',
        tooltip = "Eevolution Outfit Bundle",
		price = 100,
		image = "/images/shop/offer/eeveebundle"
    },
	{
		name = "Fire Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Fire Type Bundle"?\n\nContem: 1 Fire Type Backpack\n1 Fire Type Rolled Carpet.',
        tooltip = "Fire Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle1"
    },
	{
		name = "Dark Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Dark Type Bundle"?\n\nContem: 1 Dark Type Backpack\n1 Dark Type Rolled Carpet.',
        tooltip = "Dark Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle2"
    },
	{
		name = "Electric Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Electric Type Bundle"?\n\nContem: 1 Electric Type Backpack\n1 Electric Type Rolled Carpet.',
        tooltip = "Electric Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle3"
    },
	{
		name = "Fairy Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Fairy Type Bundle"?\n\nContem: 1 Fairy Type Backpack\n1 Fairy Type Rolled Carpet.',
        tooltip = "Fairy Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle4"
    },
	{
		name = "Ghost Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Ghost Type Bundle"?\n\nContem: 1 Ghost Type Backpack\n1 Ghost Type Rolled Carpet.',
        tooltip = "Ghost Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle5"
    },
	{
		name = "Ground Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Ground Type Bundle"?\n\nContem: 1 Ground Type Backpack\n1 Ground Type Rolled Carpet.',
        tooltip = "Ground Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle6"
    },
	{
		name = "Normal Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Normal Type Bundle"?\n\nContem: 1 Normal Type Backpack\n1 Normal Type Rolled Carpet.',
        tooltip = "Normal Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle7"
    },
	{
		name = "Psychic Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Psychic Type Bundle"?\n\nContem: 1 Psychic Type Backpack\n1 Psychic Type Rolled Carpet.',
        tooltip = "Psychic Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle8"
    },
	{
		name = "Steel Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Steel Type Bundle"?\n\nContem: 1 Steel Type Backpack\n1 Steel Type Rolled Carpet.',
        tooltip = "Steel Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle9"
    },
	{
		name = "Bug Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Bug Type Bundle"?\n\nContem: 1 Bug Type Backpack\n1 Bug Type Rolled Carpet.',
        tooltip = "Bug Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle10"
    },
	{
		name = "Dragon Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Dragon Type Bundle"?\n\nContem: 1 Dragon Type Backpack\n1 Dragon Type Rolled Carpet.',
        tooltip = "Dragon Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle11"
    },
	{
		name = "Fighting Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Fighting Type Bundle"?\n\nContem: 1 Fighting Type Backpack\n1 Fighting Type Rolled Carpet.',
        tooltip = "Fighting Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle12"
    },
	{
		name = "Flying Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Flying Type Bundle"?\n\nContem: 1 Flying Type Backpack\n1 Flying Type Rolled Carpet.',
        tooltip = "Flying Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle13"
    },
	{
		name = "Grass Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Grass Type Bundle"?\n\nContem: 1 Grass Type Backpack\n1 Grass Type Rolled Carpet.',
        tooltip = "Grass Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle14"
    },
	{
		name = "Ice Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Ice Type Bundle"?\n\nContem: 1 Ice Type Backpack\n1 Ice Type Rolled Carpet.',
        tooltip = "Ice Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle15"
    },
	{
		name = "Poison Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Poison Type Bundle"?\n\nContem: 1 Poison Type Backpack\n1 Poison Type Rolled Carpet.',
        tooltip = "Poison Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle16"
    },
	{
		name = "Rock Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Rock Type Bundle"?\n\nContem: 1 Rock Type Backpack\n1 Rock Type Rolled Carpet.',
        tooltip = "Rock Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle17"
    },
	{
		name = "Water Type Bundle",
		category_id = "5",
		description = 'Do you really want to buy "Water Type Bundle"?\n\nContem: 1 Water Type Backpack\n1 Water Type Rolled Carpet.',
        tooltip = "Water Type Bundle",
		price = 10,
		image = "/images/shop/offer/bundle18"
    },
	
	----- Outfit -----
	{
		name = "Steve",
		category_id = "3",
		description = 'Do you really want to buy "Steve"? Unisex.',
        tooltip = "Steve",
		price = 10,
		image = "/images/shop/offer/steve"
    },
	{
		name = "Red & Green",
		category_id = "3",
		description = 'Do you really want to buy "Red & Green"? Red for male, Green for female.',
        tooltip = "Red & Green",
		price = 15,
		image = "/images/shop/offer/red_green"
    },
	{
		name = "Aqua & Kazuma",
		category_id = "3",
		description = 'Do you really want to buy "Aqua & Kazuma"? Kazuma for male, Aqua for female.',
        tooltip = "Aqua & Kazuma",
		price = 25,
		image = "/images/shop/offer/kazuma_aqua"
    },
	{
		name = "Asuna & Kirito",
		category_id = "3",
		description = 'Do you really want to buy "Asuna & Kirito"? Kirito for male, Asuna for female.',
        tooltip = "Asuna & Kirito",
		price = 25,
		image = "/images/shop/offer/kirito_asuna"
    },
	{
		name = "Emilia & Subaru",
		category_id = "3",
		description = 'Do you really want to buy "Emilia & Subaru"? Subaru for male, Emilia for female.',
        tooltip = "Emilia & Subaru",
		price = 25,
		image = "/images/shop/offer/emilia_subaru"
    },
	{
		name = "Nezuko & Tanjiro",
		category_id = "3",
		description = 'Do you really want to buy "Nezuko & Tanjiro"? Tanjiro for male, Nezuko for female.',
        tooltip = "Nezuko & Tanjiro",
		price = 25,
		image = "/images/shop/offer/nezuko_tanjiro"
    },
	{
		name = "Lugia Fellowship",
		category_id = "3",
		description = 'Do you really want to buy "Lugia Fellowship"?',
        tooltip = "Lugia Fellowship",
		price = 25,
		image = "/images/shop/offer/lugia_fellowship"
    },
	{
		name = "Let's Go",
		category_id = "3",
		description = "Do you really want to buy 'Let's Go'? Pikachu for male, Eevee for female.",
        tooltip = "Let's Go",
		price = 25,
		image = "/images/shop/offer/lets_go"
    },
	{
		name = "Goku",
		category_id = "3",
		description = 'Do you really want to buy "Goku"?',
        tooltip = "Goku: Use !animation para ativar a animacao secundaria da outfit.",
		price = 50,
		image = "/images/shop/offer/goku"
    },
	{
		name = "Majin Boo",
		category_id = "3",
		description = 'Do you really want to buy "Majin Boo"?',
        tooltip = "Majin Boo: Use !animation para ativar a animacao secundaria da outfit.",
		price = 50,
		image = "/images/shop/offer/majinboo"
    },
	{
		name = "League of Legends",
		category_id = "3",
		description = 'Do you really want to buy "League of Legends"? Yasuo for male, Miss Fortune for female.',
        tooltip = "League of Legends",
		price = 25,
		image = "/images/shop/offer/lol1"
    },
	{
		name = "Pool Party",
		category_id = "3",
		description = 'Do you really want to buy "Pool Party"? Graves for male, Fiora for female.',
        tooltip = "Pool Party",
		price = 25,
		image = "/images/shop/offer/lol2"
    },
	{
		name = "Psychic Trainer",
		category_id = "3",
		description = 'Do you really want to buy "Psychic Trainer"?',
        tooltip = "Psychic Trainer: Use !animation para ativar a animacao secundaria da outfit.",
		price = 50,
		image = "/images/shop/offer/psychictrainer"
    },
	{
		name = "Gardellade Outfit",
		category_id = "3",
		description = 'Do you really want to buy "Gardellade Outfit"? Gallade for male, Gardevoir for female.',
        tooltip = "Gardellade Outfit",
		price = 25,
		image = "/images/shop/offer/gardellade"
    },
	{
		name = "Bunny Outfit",
		category_id = "3",
		description = 'Do you really want to buy "Bunny Outfit"?',
        tooltip = "Bunny Outfit",
		price = 25,
		image = "/images/shop/offer/bunny"
    },
	{
		name = "Starmie Outfit",
		category_id = "3",
		description = 'Do you really want to buy "Starmie Outfit"? Unisex.',
        tooltip = "Starmie Outfit",
		price = 25,
		image = "/images/shop/offer/starmieoutfit"
    },
	
	----- Addons -----
	
	{
		name = "Cosplaying Espeon",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Espeon"?',
        tooltip = "Cosplaying Espeon",
		price = 10,
		image = "/images/shop/offer/cosplaying_espeon"
    },
	{
		name = "Cosplaying Umbreon",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Umbreon"?',
        tooltip = "Cosplaying Umbreon",
		price = 10,
		image = "/images/shop/offer/cosplaying_umbreon"
    },
	{
		name = "Cosplaying Drapion",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Drapion"?',
        tooltip = "Cosplaying Drapion",
		price = 10,
		image = "/images/shop/offer/cosplaying_drapion"
    },
	{
		name = "Cosplaying Mega Abomasnow",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Mega Abomasnow"?',
        tooltip = "Cosplaying Mega Abomasnow",
		price = 15,
		image = "/images/shop/offer/cosplaying_abomasnow"
    },
	{
		name = "Cosplaying Gallade",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Gallade"?',
        tooltip = "Cosplaying Gallade",
		price = 20,
		image = "/images/shop/offer/cosplaying_gallade"
    },
	{
		name = "Cosplaying Tangrowth",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Tangrowth"?',
        tooltip = "Cosplaying Tangrowth",
		price = 10,
		image = "/images/shop/offer/cosplaying_tangrowth"
    },
	{
		name = "Cosplaying Spiritomb",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Spiritomb"?',
        tooltip = "Cosplaying Spiritomb",
		price = 15,
		image = "/images/shop/offer/cosplaying_spiritomb"
    },
	{
		name = "Cosplaying Milotic",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Milotic"?',
        tooltip = "Cosplaying Milotic",
		price = 15,
		image = "/images/shop/offer/cosplaying_milotic"
    },
	{
		name = "Cosplaying Hisuian Arcanine",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Hisuian Arcanine"?',
        tooltip = "Cosplaying Hisuian Arcanine",
		price = 15,
		image = "/images/shop/offer/cosplaying_arcanine"
    },
	{
		name = "Cosplaying Machamp",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Machamp"?',
        tooltip = "Cosplaying Machamp",
		price = 10,
		image = "/images/shop/offer/cosplaying_machamp"
    },
	{
		name = "Witch Hunter Camerupt",
		category_id = "4",
		description = 'Do you really want to buy "Witch Hunter Camerupt"?',
        tooltip = "Witch Hunter Camerupt",
		price = 20,
		image = "/images/shop/offer/witch_hunter_camerupt"
    },
	{
		name = "Dark Pidgeot",
		category_id = "4",
		description = 'Do you really want to buy "Dark Pidgeot"?',
        tooltip = "Dark Pidgeot",
		price = 15,
		image = "/images/shop/offer/dark_pidgeot"
    },
	{
		name = "Dressed Mismagius",
		category_id = "4",
		description = 'Do you really want to buy "Dressed Mismagius"?',
        tooltip = "Dressed Mismagius",
		price = 15,
		image = "/images/shop/offer/dressed_mismagius"
    },
	{
		name = "Dressed Delcatty",
		category_id = "4",
		description = 'Do you really want to buy "Dressed Delcatty"?',
        tooltip = "Dressed Delcatty",
		price = 10,
		image = "/images/shop/offer/dressed_delcatty"
    },
	{
		name = "Cosplaying Electivire",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Electivire"?',
        tooltip = "Cosplaying Electivire",
		price = 10,
		image = "/images/shop/offer/cosplaying_electivire"
    },
	{
		name = "Cosplaying Magmortar",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Magmortar"?',
        tooltip = "Cosplaying Magmortar",
		price = 10,
		image = "/images/shop/offer/cosplaying_magmortar"
    },
	{
		name = "Cosplaying Cradily",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Cradily"?',
        tooltip = "Cosplaying Cradily",
		price = 10,
		image = "/images/shop/offer/cosplaying_cradily"
    },
	{
		name = "Armored Magnezone",
		category_id = "4",
		description = 'Do you really want to buy "Armored Magnezone"?',
        tooltip = "Armored Magnezone",
		price = 15,
		image = "/images/shop/offer/armored_magnezone"
    },
	{
		name = "Cyborg Lapras",
		category_id = "4",
		description = 'Do you really want to buy "Cyborg Lapras"?',
        tooltip = "Cyborg Lapras",
		price = 15,
		image = "/images/shop/offer/cyborg_lapras"
    },
	{
		name = "Cyborg Flareon",
		category_id = "4",
		description = 'Do you really want to buy "Cyborg Flareon"?',
        tooltip = "Cyborg Flareon",
		price = 10,
		image = "/images/shop/offer/cyborg_flareon"
    },
	{
		name = "Cyborg Jolteon",
		category_id = "4",
		description = 'Do you really want to buy "Cyborg Jolteon"?',
        tooltip = "Cyborg Jolteon",
		price = 10,
		image = "/images/shop/offer/cyborg_jolteon"
    },
	{
		name = "Cyborg Vaporeon",
		category_id = "4",
		description = 'Do you really want to buy "Cyborg Vaporeon"?',
        tooltip = "Cyborg Vaporeon",
		price = 15,
		image = "/images/shop/offer/cyborg_vaporeon"
    },
	{
		name = "Cyborg Umbreon",
		category_id = "4",
		description = 'Do you really want to buy "Cyborg Umbreon"?',
        tooltip = "Cyborg Umbreon",
		price = 10,
		image = "/images/shop/offer/cyborg_umbreon"
    },
	{
		name = "Cyborg Espeon",
		category_id = "4",
		description = 'Do you really want to buy "Cyborg Espeon"?',
        tooltip = "Cyborg Espeon",
		price = 10,
		image = "/images/shop/offer/cyborg_espeon"
    },
	{
		name = "Cyborg Leafeon",
		category_id = "4",
		description = 'Do you really want to buy "Cyborg Leafeon"?',
        tooltip = "Cyborg Leafeon",
		price = 10,
		image = "/images/shop/offer/cyborg_leafeon"
    },
	{
		name = "Cyborg Glaceon",
		category_id = "4",
		description = 'Do you really want to buy "Cyborg Glaceon"?',
        tooltip = "Cyborg Glaceon",
		price = 10,
		image = "/images/shop/offer/cyborg_glaceon"
    },
	{
		name = "Cyborg Sylveon",
		category_id = "4",
		description = 'Do you really want to buy "Cyborg Sylveon"?',
        tooltip = "Cyborg Sylveon",
		price = 10,
		image = "/images/shop/offer/cyborg_sylveon"
    },
	{
		name = "Ancient Mesprit",
		category_id = "4",
		description = 'Do you really want to buy "Ancient Mesprit"?',
        tooltip = "Ancient Mesprit",
		price = 20,
		image = "/images/shop/offer/ancient_mesprit"
    },
	{
		name = "Ancient Uxie",
		category_id = "4",
		description = 'Do you really want to buy "Ancient Uxie"?',
        tooltip = "Ancient Uxie",
		price = 20,
		image = "/images/shop/offer/ancient_uxie"
    },
	{
		name = "Ancient Azelf",
		category_id = "4",
		description = 'Do you really want to buy "Ancient Azelf"?',
        tooltip = "Ancient Azelf",
		price = 20,
		image = "/images/shop/offer/ancient_azelf"
    },
	{
		name = "Cosplaying Manaphy",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Manaphy"?',
        tooltip = "Cosplaying Manaphy",
		price = 20,
		image = "/images/shop/offer/cosplaying_manaphy"
    },	
	{
		name = "Cosplaying Greninja",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Greninja"?',
        tooltip = "Cosplaying Greninja",
		price = 10,
		image = "/images/shop/offer/cosplaying_greninja"
    },	
	{
		name = "Masked Gengar",
		category_id = "4",
		description = 'Do you really want to buy "Masked Gengar"?',
        tooltip = "Masked Gengar",
		price = 25,
		image = "/images/shop/offer/masked_gengar"
    },	
	{
		name = "Cosplaying Alakazam",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Alakazam"?',
        tooltip = "Cosplaying Alakazam",
		price = 15,
		image = "/images/shop/offer/cosplaying_alakazam"
    },	
	{
		name = "Cosplaying Banette",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Banette"?',
        tooltip = "Cosplaying Banette",
		price = 15,
		image = "/images/shop/offer/cosplaying_bannete"
    },		
	{
		name = "Cosplaying Beedrill",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Beedrill"?',
        tooltip = "Cosplaying Beedrill",
		price = 15,
		image = "/images/shop/offer/cosplaying_beedrill"
    },
	{
		name = "Noir Blastoise",
		category_id = "4",
		description = 'Do you really want to buy "Noir Blastoise"?',
        tooltip = "Noir Blastoise",
		price = 15,
		image = "/images/shop/offer/noir_blastoise"
    },
	{
		name = "Cosplaying Blaziken",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Blaziken"?',
        tooltip = "Cosplaying Blaziken",
		price = 10,
		image = "/images/shop/offer/cosplaying_blaziken"
    },
	{
		name = "Cosplaying Heracross",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Heracross"?',
        tooltip = "Cosplaying Heracross",
		price = 10,
		image = "/images/shop/offer/cosplaying_heracross"
    },
	{
		name = "Cyborg Mega Charizard X",
		category_id = "4",
		description = 'Do you really want to buy "Cyborg Mega Charizard X"?',
        tooltip = "Cyborg Mega Charizard X",
		price = 15,
		image = "/images/shop/offer/cyborg_x"
    },
	{
		name = "Cyborg Mega Charizard Y",
		category_id = "4",
		description = 'Do you really want to buy "Cyborg Mega Charizard Y"?',
        tooltip = "Cyborg Mega Charizard Y",
		price = 15,
		image = "/images/shop/offer/cyborg_y"
    },
	{
		name = "Cosplaying Ampharos",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Ampharos"?',
        tooltip = "Cosplaying Ampharos",
		price = 10,
		image = "/images/shop/offer/cosplaying_ampharos"
    },
	{
		name = "Dressed Mawile",
		category_id = "4",
		description = 'Do you really want to buy "Dressed Mawile"?',
        tooltip = "Dressed Mawile",
		price = 10,
		image = "/images/shop/offer/dressed_mawile"
    },
	{
		name = "Cosplaying Medicham",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Medicham"?',
        tooltip = "Cosplaying Medicham",
		price = 10,
		image = "/images/shop/offer/cosplaying_medicham"
    },
	{
		name = "Masked Pinsir",
		category_id = "4",
		description = 'Do you really want to buy "Masked Pinsir"?',
        tooltip = "Masked Pinsir",
		price = 15,
		image = "/images/shop/offer/masked_pinsir"
    },
	{
		name = "Armored Sceptile",
		category_id = "4",
		description = 'Do you really want to buy "Armored Sceptile"?',
        tooltip = "Armored Sceptile",
		price = 10,
		image = "/images/shop/offer/armored_sceptile"
    },
	{
		name = "Cosplaying Scizor",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Scizor"?',
        tooltip = "Cosplaying Scizor",
		price = 15,
		image = "/images/shop/offer/cosplaying_scizor"
    },
	{
		name = "Donut Slowbro",
		category_id = "4",
		description = 'Do you really want to buy "Donut Slowbro"?',
        tooltip = "Donut Slowbro",
		price = 10,
		image = "/images/shop/offer/donut_slowbro"
    },
	{
		name = "Metallic Steelix",
		category_id = "4",
		description = 'Do you really want to buy "Metallic Steelix"?',
        tooltip = "Metallic Steelix",
		price = 15,
		image = "/images/shop/offer/metallic_steelix"
    },
	{
		name = "Cyborg Swampert",
		category_id = "4",
		description = 'Do you really want to buy "Cyborg Swampert"?',
        tooltip = "Cyborg Swampert",
		price = 15,
		image = "/images/shop/offer/cyborg_swampert"
    },
	{
		name = "Armored Tyranitar",
		category_id = "4",
		description = 'Do you really want to buy "Armored Tyranitar"?',
        tooltip = "Armored Tyranitar",
		price = 10,
		image = "/images/shop/offer/armored_tyranitar"
    },
	{
		name = "Trainer Venusaur",
		category_id = "4",
		description = 'Do you really want to buy "Trainer Venusaur"?',
        tooltip = "Trainer Venusaur",
		price = 15,
		image = "/images/shop/offer/trainer_venusaur"
    },
	{
		name = "Dressed Loppuny",
		category_id = "4",
		description = 'Do you really want to buy "Dressed Loppuny"?',
        tooltip = "Dressed Loppuny",
		price = 10,
		image = "/images/shop/offer/dressed_loppuny"
    },
	{
		name = "Cosplaying Shuckle",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Shuckle"?',
        tooltip = "Cosplaying Shuckle",
		price = 10,
		image = "/images/shop/offer/cosplaying_shuckle"
    },
	{
		name = "Cosplaying Blissey",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Blissey"?',
        tooltip = "Cosplaying Blissey",
		price = 10,
		image = "/images/shop/offer/cosplaying_blissey"
    },
	{
		name = "Cosplaying Wobbuffet",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Wobbuffet"?',
        tooltip = "Cosplaying Wobbuffet",
		price = 10,
		image = "/images/shop/offer/cosplaying_wobbuffet"
    },
	{
		name = "Cosplaying Gardevoir",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Gardevoir"?',
        tooltip = "Cosplaying Gardevoir",
		price = 10,
		image = "/images/shop/offer/cosplaying_gardevoir"
    },
	{
		name = "Cosplaying Vileplume",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Vileplume"?',
        tooltip = "Cosplaying Vileplume",
		price = 10,
		image = "/images/shop/offer/cosplaying_vileplume"
    },
	{
		name = "Cosplaying Sylveon",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Sylveon"?',
        tooltip = "Cosplaying Sylveon",
		price = 10,
		image = "/images/shop/offer/cosplaying_sylveon"
    },
	{
		name = "Cosplaying Rampardos",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Rampardos"?',
        tooltip = "Cosplaying Rampardos",
		price = 10,
		image = "/images/shop/offer/cosplaying_rampardos"
    },
	{
		name = "Cosplaying Audino",
		category_id = "4",
		description = 'Do you really want to buy "Cosplaying Audino"?',
        tooltip = "Cosplaying Audino",
		price = 10,
		image = "/images/shop/offer/cosplaying_audino"
    },
	{
		name = "Ancient Metagross",
		category_id = "4",
		description = 'Do you really want to buy "Ancient Metagross"?',
        tooltip = "Ancient Metagross",
		price = 25,
		image = "/images/shop/offer/ancient_metagross"
    },
	{
		name = "Armored Dragonite Green",
		category_id = "4",
		description = 'Do you really want to buy "Armored Dragonite Green"?',
        tooltip = "Armored Dragonite Green",
		price = 15,
		image = "/images/shop/offer/armored_dragonite1"
    },
	{
		name = "Armored Dragonite Purple",
		category_id = "4",
		description = 'Do you really want to buy "Armored Dragonite Purple"?',
        tooltip = "Armored Dragonite Purple",
		price = 15,
		image = "/images/shop/offer/armored_dragonite2"
    },
	{
		name = "Armored Gardevoir",
		category_id = "4",
		description = 'Do you really want to buy "Armored Gardevoir"?',
        tooltip = "Armored Gardevoir",
		price = 15,
		image = "/images/shop/offer/armored_gardevoir"
    },
	{
		name = "Armored Rhyperior",
		category_id = "4",
		description = 'Do you really want to buy "Armored Rhyperior"?',
        tooltip = "Armored Rhyperior",
		price = 10,
		image = "/images/shop/offer/armored_rhyperior"
    },
	{
		name = "Armored Tropius Red",
		category_id = "4",
		description = 'Do you really want to buy "Armored Tropius Red"?',
        tooltip = "Armored Tropius Red",
		price = 15,
		image = "/images/shop/offer/armored_tropius2"
    },
	{
		name = "Athena Jynx",
		category_id = "4",
		description = 'Do you really want to buy "Athena Jynx"?',
        tooltip = "Athena Jynx",
		price = 10,
		image = "/images/shop/offer/athena_jynx"
    },
	{
		name = "White Suit Machamp",
		category_id = "4",
		description = 'Do you really want to buy "White Suit Machamp"?',
        tooltip = "White Suit Machamp",
		price = 10,
		image = "/images/shop/offer/white_suit_machamp"
    },
	{
		name = "Black Suit Machamp",
		category_id = "4",
		description = 'Do you really want to buy "Black Suit Machamp"?',
        tooltip = "Black Suit Machamp",
		price = 10,
		image = "/images/shop/offer/black_suit_machamp"
    },
	{
		name = "Black Suit Slaking",
		category_id = "4",
		description = 'Do you really want to buy "Black Suit Slaking"?',
        tooltip = "Black Suit Slaking",
		price = 10,
		image = "/images/shop/offer/black_suit_slaking"
    },
	{
		name = "Carrier Mamoswine Red",
		category_id = "4",
		description = 'Do you really want to buy "Carrier Mamoswine Red"?',
        tooltip = "Carrier Mamoswine Red",
		price = 15,
		image = "/images/shop/offer/carrier_mamoswine"
    },
	{
		name = "Carrier Mamoswine Blue",
		category_id = "4",
		description = 'Do you really want to buy "Carrier Mamoswine Blue"?',
        tooltip = "Carrier Mamoswine Blue",
		price = 15,
		image = "/images/shop/offer/carrier_mamoswine2"
    },
	{
		name = "Cavalier Dusknoir",
		category_id = "4",
		description = 'Do you really want to buy "Cavalier Dusknoir"?',
        tooltip = "Cavalier Dusknoir",
		price = 10,
		image = "/images/shop/offer/cavalier_dusknoir"
    },
	{
		name = "Cheerleader Sudowoodo",
		category_id = "4",
		description = 'Do you really want to buy "Cheerleader Sudowoodo"?',
        tooltip = "Cheerleader Sudowoodo",
		price = 10,
		image = "/images/shop/offer/cheerleader_sudowoodo"
    },
	{
		name = "Cloaked Jirachi",
		category_id = "4",
		description = 'Do you really want to buy "Cloaked Jirachi"?',
        tooltip = "Cloaked Jirachi",
		price = 20,
		image = "/images/shop/offer/cloaked_jirachi"
    },
	{
		name = "Constructor Rhyperior",
		category_id = "4",
		description = 'Do you really want to buy "Constructor Rhyperior"?',
        tooltip = "Constructor Rhyperior",
		price = 10,
		image = "/images/shop/offer/constructor_rhyperior"
    },
	{
		name = "Cook Crawdaunt",
		category_id = "4",
		description = 'Do you really want to buy "Cook Crawdaunt"?',
        tooltip = "Cook Crawdaunt",
		price = 10,
		image = "/images/shop/offer/cook_crawdaunt"
    },
	{
		name = "Cook Snorlax",
		category_id = "4",
		description = 'Do you really want to buy "Cook Snorlax"?',
        tooltip = "Cook Snorlax",
		price = 15,
		image = "/images/shop/offer/cook_snorlax"
    },
	{
		name = "Cyborg Salamence",
		category_id = "4",
		description = 'Do you really want to buy "Cyborg Salamence"?',
        tooltip = "Cyborg Salamence",
		price = 25,
		image = "/images/shop/offer/cyborg_salamence"
    },
	{
		name = "Djinn Machamp",
		category_id = "4",
		description = 'Do you really want to buy "Djinn Machamp"?',
        tooltip = "Djinn Machamp",
		price = 10,
		image = "/images/shop/offer/djinn_machamp"
    },
	{
		name = "Dressed Gardevoir",
		category_id = "4",
		description = 'Do you really want to buy "Dressed Gardevoir"?',
        tooltip = "Dressed Gardevoir",
		price = 10,
		image = "/images/shop/offer/dressed_gardevoir"
    },
	{
		name = "Empress Gardevoir Purple",
		category_id = "4",
		description = 'Do you really want to buy "Empress Gardevoir Purple"?',
        tooltip = "Empress Gardevoir Purple",
		price = 10,
		image = "/images/shop/offer/empress_gardevoir1"
    },
	{
		name = "Empress Gardevoir Red",
		category_id = "4",
		description = 'Do you really want to buy "Empress Gardevoir Red"?',
        tooltip = "Empress Gardevoir Red",
		price = 10,
		image = "/images/shop/offer/empress_gardevoir2"
    },
	{
		name = "Fossil Aerodactyl",
		category_id = "4",
		description = 'Do you really want to buy "Fossil Aerodactyl"?',
        tooltip = "Fossil Aerodactyl",
		price = 25,
		image = "/images/shop/offer/fossil_aerodactyl"
    },
	{
		name = "Gyaryudos",
		category_id = "4",
		description = 'Do you really want to buy "Gyaryudos"?',
        tooltip = "Gyaryudos",
		price = 20,
		image = "/images/shop/offer/gyaryudos"
    },
	{
		name = "Hashirama Zoroark",
		category_id = "4",
		description = 'Do you really want to buy "Hashirama Zoroark"?',
        tooltip = "Hashirama Zoroark",
		price = 10,
		image = "/images/shop/offer/hashirama_zoroark"
    },
	{
		name = "Iceage Mamoswine",
		category_id = "4",
		description = 'Do you really want to buy "Iceage Mamoswine"?',
        tooltip = "Iceage Mamoswine",
		price = 15,
		image = "/images/shop/offer/iceage_mamoswine"
    },
	{
		name = "Jimbei Feraligatr",
		category_id = "4",
		description = 'Do you really want to buy "Jimbei Feraligatr"?',
        tooltip = "Jimbei Feraligatr",
		price = 15,
		image = "/images/shop/offer/jimbei_feraligatr"
    },
	{
		name = "Lance Dragonite",
		category_id = "4",
		description = 'Do you really want to buy "Lance Dragonite"?',
        tooltip = "Lance Dragonite",
		price = 15,
		image = "/images/shop/offer/lance_dragonite"
    },
	{
		name = "Maid Gardevoir",
		category_id = "4",
		description = 'Do you really want to buy "Maid Gardevoir"?',
        tooltip = "Maid Gardevoir",
		price = 10,
		image = "/images/shop/offer/maid_gardevoir"
    },
	{
		name = "Majinblissey",
		category_id = "4",
		description = 'Do you really want to buy "Majinblissey"?',
        tooltip = "Majinblissey",
		price = 10,
		image = "/images/shop/offer/majinblissey"
    },
	{
		name = "Masked Crobat",
		category_id = "4",
		description = 'Do you really want to buy "Masked Crobat"?',
        tooltip = "Masked Crobat",
		price = 15,
		image = "/images/shop/offer/masked_crobat"
    },
	{
		name = "Masked Ninetales",
		category_id = "4",
		description = 'Do you really want to buy "Masked Ninetales"?',
        tooltip = "Masked Ninetales",
		price = 15,
		image = "/images/shop/offer/masked_ninetales"
    },
	{
		name = "Masquerade",
		category_id = "4",
		description = 'Do you really want to buy "Masquerade"?',
        tooltip = "Masquerade",
		price = 10,
		image = "/images/shop/offer/masquerade"
    },
	{
		name = "Mermaid Milotic",
		category_id = "4",
		description = 'Do you really want to buy "Mermaid Milotic"?',
        tooltip = "Mermaid Milotic",
		price = 15,
		image = "/images/shop/offer/mermaid_milotic"
    },
	{
		name = "Milktank",
		category_id = "4",
		description = 'Do you really want to buy "Milktank"?',
        tooltip = "Milktank",
		price = 10,
		image = "/images/shop/offer/milktank"
    },
	{
		name = "Nurse Blissey",
		category_id = "4",
		description = 'Do you really want to buy "Nurse Blissey"?',
        tooltip = "Nurse Blissey",
		price = 10,
		image = "/images/shop/offer/nurse_blissey"
    },
	{
		name = "Nurse Gengar",
		category_id = "4",
		description = 'Do you really want to buy "Nurse Gengar"?',
        tooltip = "Nurse Gengar",
		price = 15,
		image = "/images/shop/offer/nurse_gengar"
    },
	{
		name = "Nurse Wigglytuff",
		category_id = "4",
		description = 'Do you really want to buy "Nurse Wigglytuff"?',
        tooltip = "Nurse Wigglytuff",
		price = 10,
		image = "/images/shop/offer/nurse_wigglytuff"
    },
	{
		name = "Pool Party Flareon",
		category_id = "4",
		description = 'Do you really want to buy "Pool Party Flareon"?',
        tooltip = "Pool Party Flareon",
		price = 10,
		image = "/images/shop/offer/poolparty_flareon"
    },
	{
		name = "Pool Party Jolteon",
		category_id = "4",
		description = 'Do you really want to buy "Pool Party Jolteon"?',
        tooltip = "Pool Party Jolteon",
		price = 10,
		image = "/images/shop/offer/poolparty_jolteon"
    },
	{
		name = "Pool Party Vaporeon",
		category_id = "4",
		description = 'Do you really want to buy "Pool Party Vaporeon"?',
        tooltip = "Pool Party Vaporeon",
		price = 15,
		image = "/images/shop/offer/poolparty_vaporeon"
    },
	{
		name = "Pool Party Golem",
		category_id = "4",
		description = 'Do you really want to buy "Pool Party Golem"?',
        tooltip = "Pool Party Golem",
		price = 10,
		image = "/images/shop/offer/poolparty_golem"
    },
	{
		name = "Saiyajin Dugtrio",
		category_id = "4",
		description = 'Do you really want to buy "Saiyajin Dugtrio"?',
        tooltip = "Saiyajin Dugtrio",
		price = 10,
		image = "/images/shop/offer/saiyajin_dugtrio"
    },
	{
		name = "Saiyawoodo",
		category_id = "4",
		description = 'Do you really want to buy "Saiyawoodo"?',
        tooltip = "Saiyawoodo",
		price = 10,
		image = "/images/shop/offer/saiyawoodo"
    },
	{
		name = "Saw Mr. Mime",
		category_id = "4",
		description = 'Do you really want to buy "Saw Mr. Mime"?',
        tooltip = "Saw Mr. Mime",
		price = 10,
		image = "/images/shop/offer/saw_mr. mime"
    },
	{
		name = "Seifuku Clefable",
		category_id = "4",
		description = 'Do you really want to buy "Seifuku Clefable"?',
        tooltip = "Seifuku Clefable",
		price = 10,
		image = "/images/shop/offer/seifuku_clefable"
    },
	{
		name = "Seifuku Meganium",
		category_id = "4",
		description = 'Do you really want to buy "Seifuku Meganium"?',
        tooltip = "Seifuku Meganium",
		price = 15,
		image = "/images/shop/offer/seifuku_meganium"
    },
	{
		name = "Stitch Sableye",
		category_id = "4",
		description = 'Do you really want to buy "Stitch Sableye"?',
        tooltip = "Stitch Sableye",
		price = 15,
		image = "/images/shop/offer/stitch_sableye"
    },
	{
		name = "Trainer Sudowoodo",
		category_id = "4",
		description = 'Do you really want to buy "Trainer Sudowoodo"?',
        tooltip = "Trainer Sudowoodo",
		price = 10,
		image = "/images/shop/offer/trainer_sudowoodo"
    },
	{
		name = "Trainer Typhlosion",
		category_id = "4",
		description = 'Do you really want to buy "Trainer Typhlosion"?',
        tooltip = "Trainer Typhlosion",
		price = 10,
		image = "/images/shop/offer/trainer_typhlosion"
    },
	{
		name = "Tribal Alakazam",
		category_id = "4",
		description = 'Do you really want to buy "Tribal Alakazam"?',
        tooltip = "Tribal Alakazam",
		price = 10,
		image = "/images/shop/offer/tribal_alakazam"
    },
	{
		name = "Witch Hunter Gardevoir",
		category_id = "4",
		description = 'Do you really want to buy "Witch Hunter Gardevoir"?',
        tooltip = "Witch Hunter Gardevoir",
		price = 10,
		image = "/images/shop/offer/witch_hunter_gardevoir"
    },
	{
		name = "Witch Hunter Honchkrow",
		category_id = "4",
		description = 'Do you really want to buy "Witch Hunter Honchkrow"?',
        tooltip = "Witch Hunter Honchkrow",
		price = 15,
		image = "/images/shop/offer/witch_hunter_honchkrow"
    },
	{
		name = "Kanto Egg",
		category_id = "6",
		description = 'Do you really want to buy "Kanto Egg"?',
        tooltip = "Contem um ovo de pokemon de kanto, deve ser chocado.",
		price = 5,
		image = "/images/shop/offer/kantoegg"
    },
	{
		name = "Johto Egg",
		category_id = "6",
		description = 'Do you really want to buy "Johto Egg"?',
        tooltip = "Contem um ovo de pokemon de johto, deve ser chocado.",
		price = 10,
		image = "/images/shop/offer/johtoegg"
    },
	{
		name = "Hoenn Egg",
		category_id = "6",
		description = 'Do you really want to buy "Hoenn Egg"?',
        tooltip = "Contem um ovo de pokemon de hoenn, deve ser chocado.",
		price = 15,
		image = "/images/shop/offer/hoennegg"
    },
	{
		name = "Sinnoh Egg",
		category_id = "6",
		description = 'Do you really want to buy "Sinnoh Egg"?',
        tooltip = "Contem um ovo de pokemon de sinnoh, deve ser chocado.",
		price = 15,
		image = "/images/shop/offer/sinnohegg"
    },
	{
		name = "Unova Egg",
		category_id = "6",
		description = 'Do you really want to buy "Unova Egg"?',
        tooltip = "Contem um ovo de pokemon de unova, deve ser chocado.",
		price = 25,
		image = "/images/shop/offer/unovaegg"
    },
	{
		name = "Kalos Egg",
		category_id = "6",
		description = 'Do you really want to buy "Kalos Egg"?',
        tooltip = "Contem um ovo de pokemon de kalos, deve ser chocado.",
		price = 25,
		image = "/images/shop/offer/kalosegg"
    },
	{
		name = "Alola Egg",
		category_id = "6",
		description = 'Do you really want to buy "Alola Egg"?',
        tooltip = "Contem um ovo de pokemon de alola, deve ser chocado.",
		price = 25,
		image = "/images/shop/offer/alolaegg"
    },
	{
		name = "Galar Egg",
		category_id = "6",
		description = 'Do you really want to buy "Galar Egg"?',
        tooltip = "Contem um ovo de pokemon de galar, deve ser chocado.",
		price = 25,
		image = "/images/shop/offer/galaregg"
    },
	{
		name = "Hisuian Egg",
		category_id = "6",
		description = 'Do you really want to buy "Hisuian Egg"?',
        tooltip = "Contem um ovo de pokemon hisuian, deve ser chocado.",
		price = 25,
		image = "/images/shop/offer/hisuianegg"
    },

	
}