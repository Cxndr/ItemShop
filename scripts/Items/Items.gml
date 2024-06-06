// Enums
enum ITEM_CATEGORY
{
	SWORDS,
	DAGGERS,
	STAVES,
	BOWS,
	SPEARS,
	CLOTHES,
	ROBES,
	BREASTPLATES,
	ARMOR,
	BRACELETS,
	SHIELDS,
	HATS,
	HELMS,
	CHARMS,
	NECKLACES,
	CAPES,
	SCARVES,
	SHOES,
	RINGS,
	TREASURES,
	INGREDIENTS,
	BOOKS,
	FOOD,
	POTIONS,
	_LENGTH
}
global.item_category = 
[
	"SWORDS",
	"DAGGERS",
	"STAVES",
	"BOWS",
	"SPEARS",
	"CLOTHES",
	"ROBES",
	"BREASTPLATES",
	"ARMOR",
	"BRACELETS",
	"SHIELDS",
	"HATS",
	"HELMS",
	"CHARMS",
	"NECKLACES",
	"CAPES",
	"SCARVES",
	"SHOES",
	"RINGS",
	"TREASURES",
	"INGREDIENTS",
	"BOOKS",
	"FOOD",
	"POTIONS",
];
for (var _i=0; _i < array_length(global.item_category); _i++) global.item_category[_i] = string_proper(global.item_category[_i]);

// classes
function Item () constructor 
{
	name = "";
	base_price = 0;
	price = base_price; // multiply by market increase/decrease based on category
	description = "";
	icon = 0;
	quantity = 1;
	sold_price = 0; // for now used just for global.sold_items to keep track of price sold at.
	
}

function ManaRestore () : Item () constructor
{
	mana_add = 100;
}



// HEALTH RESTORE
function HealthRestore () : Item () constructor
{
	hp_add = 100;
}
function Food () : HealthRestore () constructor
{
	category = ITEM_CATEGORY.FOOD;	
}
function Potion () : HealthRestore () constructor
{
	category = ITEM_CATEGORY.POTIONS;	
}

function Banana () : Food () constructor
{
	name = "Banana";
	base_price = 50;
	price = base_price;
	description = "for de monkeh. Restores 50hp.";
	icon = 326;
	hp_add = 50;
}
function Burg () : Food () constructor
{
	name = "Burg";
	base_price = 500;
	price = base_price;
	description = "Tasty burg. Restores 500hp.";
	icon = 328;
	hp_add = 500;
}
function Strawb () : Food () constructor
{
	name = "Strawberry";
	base_price = 100;
	price = base_price;
	description = "Sweet and juicy summer fruit. Restores 100hp.";
	icon = 308;
	hp_add = 100;
}
function Cookie () : Food () constructor
{
	name = "Cookie";
	base_price = 200;
	price = base_price;
	description = "Chocolate chip. Mmm. Restores 200hp.";
	icon = 330;
	hp_add = 200;
}


function HealthPotion () : Potion () constructor
{
	name = "Health Potion";
	base_price = 200;
	price = base_price;
	description = "A common healing potion. Restores 200hp.";
	icon = 273;
	hp_add = 200;
	category = ITEM_CATEGORY.POTIONS;
}


// WEAPONS

function Weapon () : Item () constructor
{
	atk_dmg = 1;
	spd = 1;
}

	// Swords
function Sword() : Weapon () constructor
{
	category = ITEM_CATEGORY.SWORDS;
	spd = 4;
	price_mult = 1;
}
function WoodenShortsword () : Sword () constructor
{
	name = "Wooden Shortsword";
	base_price = 120;
	price = base_price*price_mult;
	description = "A short training blade. More suited to playfights than real combat."
	icon = 480;
	atk_dmg = 5;
	spd = 5;
}
function WoodenLongsword () : Sword () constructor
{
	name = "Wooden Longsword";
	base_price = 150;
	price = base_price;
	description = "A full sized training blade. More suited to playfights than real combat."
	icon = 481;
	atk_dmg = 6;
}
function Shortsword () : Sword () constructor
{
	name = "Shortsword";
	base_price = 300;
	price = base_price;
	description = "A simple short blade suited for agile combat."
	icon = 433;
	atk_dmg = 10;
	spd = 5;
}
function Longsword () : Sword () constructor
{
	name = "Longsword";
	base_price = 400;
	price = base_price;
	description = "A simple well rounded long blade."
	icon = 435;
	atk_dmg = 12;
}

	// Bows
function Bow() : Weapon () constructor
{
	category = ITEM_CATEGORY.BOWS;
	spd = 4;
	price_mult = 1;
}
function Shortbow () : Bow () constructor
{
	name = "Shortbow";
	base_price = 300;
	price = base_price;
	description = "A simple short wooden bow suited for agile combat."
	icon = 528;
	atk_dmg = 14;
	spd = 5;
}
function Longbow () : Bow () constructor
{
	name = "Longbow";
	base_price = 500;
	price = base_price;
	description = "A simple long wooden bow. The tall design allows projectiles to hit harder."
	icon = 531;
	atk_dmg = 18;
}

	// Staves
function Staff () : Weapon () constructor
{
	category = ITEM_CATEGORY.STAVES;
	spd = 3;
	mgc_dmg = 1;
	price_mult = 1;
}
function WoodenStaff () : Staff () constructor
{
	name = "Wooden Staff";
	base_price = 350;
	price = base_price;
	description = "A simple walking stick with a weak magical energy."
	icon = 483;
	atk_dmg = 4;
	mgc_dmg = 10;
}
function DragonStaff () : Staff () constructor
{
	name = "Dragon Staff";
	base_price = 600;
	price = base_price;
	description = "A common carved magical staff designed to enhance casting.";
	icon = 484;
	atk_dmg = 4;
	mgc_dmg = 16;
}