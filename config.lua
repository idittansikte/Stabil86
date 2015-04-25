-- The Forgotten Server Config

	-- Account manager
	accountManager = false
	namelockManager = true
	newPlayerChooseVoc = true
	newPlayerSpawnPosX = 159
	newPlayerSpawnPosY = 387
	newPlayerSpawnPosZ = 6
	newPlayerTownId = 2
	newPlayerLevel = 8
	newPlayerMagicLevel = 0
	generateAccountNumber = false
	generateAccountSalt = false

	-- Rook system
	useRookSystem = false
	rookTownId = 1
	rookLevelToGetRooked = 5
	rookLevelToLeaveRook = 8

	-- Unjustified kills
	-- NOTE: *Banishment and *BlackSkull variables are >summed up<
	-- (dailyFragsToRedSkull + dailyFragsToBanishment) with their
	-- *RedSkull equivalents.
	-- Auto banishing works only if useBlackSkull set to negative.
	-- advancedFragList is not advised if you use huge frags
	-- requirements.
	useFragHandler = true
	redSkullLength = 2 * 24 * 60 * 60
	blackSkullLength = 3 * 24 * 60 * 60
	fragsLimit = 24 * 60 * 60
	fragsSecondLimit = 7 * 24 * 60 * 60
	fragsThirdLimit = 30 * 24 * 60 * 60
	fragsToRedSkull = 20
	fragsSecondToRedSkull = 100
	fragsThirdToRedSkull = 300
	fragsToBlackSkull = fragsToRedSkull
	fragsSecondToBlackSkull = fragsSecondToRedSkull
	fragsThirdToBlackSkull = fragsThirdToRedSkull
	fragsToBanishment = fragsToRedSkull
	fragsSecondToBanishment = fragsSecondToRedSkull
	fragsThirdToBanishment = fragsThirdToRedSkull
	blackSkulledDeathHealth = 40
	blackSkulledDeathMana = 0
	useBlackSkull = false
	advancedFragList = false

	-- Banishments
	-- violationNameReportActionType 1 = just a report, 2 = name lock, 3 = player banishment
	-- killsBanLength works only if useBlackSkull option is disabled.
	notationsToBan = 2
	warningsToFinalBan = 3
	warningsToDeletion = 4
	banLength = 2 * 24 * 60 * 60
	killsBanLength = 1 * 24 * 60 * 60
	finalBanLength = 30 * 24 * 60 * 60
	ipBanLength = 3 * 24 * 60 * 60
	allowedMaxSizePackets = 20

	-- Battle
	-- NOTE: showHealth/ManaChangeForMonsters inherites from showHealth/ManaChange.
	-- loginProtectionPeriod is the famous Tibia anti-magebomb system.
	-- deathLostPercent set to nil enables manual mode.
	worldType = "open"
	protectionLevel = 100
	pvpTileIgnoreLevelAndVocationProtection = true
	pzLocked = 20 * 1000
	huntingDuration = 20 * 1000
	criticalHitChance = 20
	criticalHitMultiplier = 1.1
	displayCriticalHitNotify = false
	removeWeaponAmmunition = false
	removeWeaponCharges = true
	removeRuneCharges = false
	whiteSkullTime = 5 * 60 * 1000
	noDamageToSameLookfeet = false
	showHealthChange = true
	showManaChange = true
	showHealthChangeForMonsters = false
	showManaChangeForMonsters = false
	fieldOwnershipDuration = 5 * 1000
	stopAttackingAtExit = false
	loginProtectionPeriod = 1 * 1000
	deathLostPercent = 10
	stairhopDelay = 1 * 1000
	pushCreatureDelay = 2 * 1000
	deathContainerId = 1987
	gainExperienceColor = 215
	addManaSpentInPvPZone = true
	recoverManaAfterDeathInPvPZone = false
	squareColor = 0
	allowFightback = true
	fistBaseAttack = 7
	useFairfightReduction = true
	optionalWarAttackableAlly = false

	-- Connection config
	worldId = 0
	ip = "81.16.173.42"
	bindOnlyGlobalAddress = false
	loginPort = 7171
	gamePort = "7172"
	loginTries = 5
	retryTimeout = 5 * 1000
	loginTimeout = 60 * 1000
	maxPlayers = 1000
	motd = "Welcome to Blackhawk OT!"
	displayOnOrOffAtCharlist = false
	onePlayerOnlinePerAccount = false
	allowClones = 0
	serverName = "Blackhawk"
	loginMessage = "Welcome to Blackhawk OT!"
	statusTimeout = 5 * 60 * 1000
	replaceKickOnLogin = true
	forceSlowConnectionsToDisconnect = false
	loginOnlyWithLoginServer = false
	premiumPlayerSkipWaitList = false
	packetsPerSecond = 50

	-- RSA
	-- NOTE: These should not be changed unless you know what your doing!
	-- Prime1 - known as p; Prime2 - known as q; Public - known as e;
	-- Modulus - known as n; Private - known as d.
	rsaPrime1 = "14299623962416399520070177382898895550795403345466153217470516082934737582776038882967213386204600674145392845853859217990626450972452084065728686565928113"
	rsaPrime2 = "7630979195970404721891201847792002125535401292779123937207447574596692788513647179235335529307251350570728407373705564708871762033017096809910315212884101"
	rsaPublic = "65537"
	rsaModulus = "109120132967399429278860960508995541528237502902798129123468757937266291492576446330739696001110603907230888610072655818825358503429057592827629436413108566029093628212635953836686562675849720620786279431090218017681061521755056710823876476444260558147179707119674283982419152118103759076030616683978566631413"
	rsaPrivate = "46730330223584118622160180015036832148732986808519344675210555262940258739805766860224610646919605860206328024326703361630109888417839241959507572247284807035235569619173792292786907845791904955103601652822519121908367187885509270025388641700821735345222087940578381210879116823013776808975766851829020659073"

	-- Database
	-- NOTE: sqlFile is used only by sqlite database, and sqlKeepAlive by mysql database.
	-- To disable sqlKeepAlive such as mysqlReadTimeout use 0 value.
	-- encryptionType can be plain, md5, sha1, sha256, sha512.
	sqlType = "mysql"
	sqlHost = "127.0.0.1"
	sqlPort = 3306
	sqlUser = "war"
	sqlPass = "JCwttzXARYYnHsdU"
	sqlDatabase = "war"
	sqlFile = "theforgottenserver.s3db"
	sqlKeepAlive = 0
	mysqlReadTimeout = 10
	mysqlWriteTimeout = 10
	mysqlReconnectionAttempts = 3
	encryptionType = "sha1"

	-- Deathlist
	deathListEnabled = true
	deathListRequiredTime = 1 * 60 * 1000
	deathAssistCount = 19
	maxDeathRecords = 5
	multipleNames = false

	-- Guilds
	-- NOTE: externalGuildWarsManagement supports Automatic Account Creator(webpage or whatever you want)
	externalGuildWarsManagement = false
	ingameGuildManagement = false
	levelToFormGuild = 8
	premiumDaysToFormGuild = 0
	guildNameMinLength = 4
	guildNameMaxLength = 20

	-- Houses
	buyableAndSellableHouses = true
	houseNeedPremium = true
	bedsRequirePremium = true
	levelToBuyHouse = 75
	housesPerAccount = 1
	houseRentAsPrice = false
	housePriceAsRent = false
	housePriceEachSquare = 50000
	houseSkipInitialRent = true
	houseRentPeriod = "never"
	houseCleanOld = 0
	guildHalls = true
	houseProtection = true

	-- Item usage
	timeBetweenActions = 200
	timeBetweenExActions = 1000
	timeBetweenCustomActions = 500
	hotkeyAimbotEnabled = true
	tibiaClassicSlots = true
	canOnlyRopePlayers = false

	-- Map
	-- NOTE: storeTrash costs more memory, but will perform alot faster cleaning.
	mapName = "evolutions.otbm"
	mapAuthor = "Many ppl over time"
	randomizeTiles = true
	storeTrash = true
	cleanProtectedZones = true

	-- Mailbox
	mailboxDisabledTowns = ""
	mailMaxAttempts = 20
	mailBlockPeriod = 60 * 60 * 1000
	mailAttemptsFadeTime = 10 * 60 * 1000

	-- Process
	-- NOTE: daemonize works only on *nix, same as niceLevel, while
	-- defaultPriority works only on Windows.
	-- coresUsed are seperated by comma cores ids used by server process,
	-- default is -1, so it stays untouched (automaticaly assigned by OS).
	daemonize = false
	defaultPriority = "high"
	niceLevel = 5
	serviceThreads = 1
	coresUsed = "-1"

	-- Startup
	startupDatabaseOptimization = true
	updatePremiumStateAtStartup = true
	confirmOutdatedVersion = false
	skipItemsVersionCheck = false

	-- Spells
	formulaLevel = 5.0
	formulaMagic = 1.0
	bufferMutedOnSpellFailure = false
	spellNameInsteadOfWords = false
	emoteSpells = true
	unifiedSpells = true
	enableCooldowns = false

	-- Outfits
	allowChangeOutfit = true
	allowChangeColors = true
	allowChangeAddons = true
	disableOutfitsForPrivilegedPlayers = false
	addonsOnlyPremium = true

	-- Miscellaneous
	-- NOTE: promptExceptionTracerErrorBox works only with precompiled support feature,
	-- called "exception tracer" (__EXCEPTION_TRACER__ flag).
	dataDirectory = "data/"
	logsDirectory = "data/logs/"
	bankSystem = true
	promptExceptionTracerErrorBox = true
	maximumDoorLevel = 500
	maxMessageBuffer = 4
	logPlayersStatements = true
	tradeLimit = 100
	useCapacity = true
	-- set playerFollowExhaust to 1500 if someone causes lags and kicks
	-- by following unreachable creatures too often
	playerFollowExhaust = 0

	-- Depot
	defaultDepotSizePremium = 2000
	defaultDepotSize = 1000

	-- VIP list
	separateVipListPerCharacter = false
	vipListDefaultLimit = 20
	vipListDefaultPremiumLimit = 100

	-- Saving-related
	-- houseDataStorage usage may be found at README.
	houseDataStorage = "binary"
	saveGlobalStorage = true
	storePlayerDirection = false
	savePlayerData = true

	-- Loot
	-- monsterLootMessage 0 to disable, 1 - only party, 2 - only player, 3 - party or player (like Tibia's)
	checkCorpseOwner = true
	monsterLootMessage = 0
	monsterLootMessageType = 25

	-- Ghost mode
	ghostModeInvisibleEffect = true
	ghostModeSpellEffects = true

	-- Limits
	idleWarningTime = 14 * 60 * 1000
	idleKickTime = 15 * 60 * 1000
	reportsExpirationAfterReads = 1
	playerQueryDeepness = -1
	tileLimit = 0
	protectionTileLimit = 0
	houseTileLimit = 0

	-- Premium-related
	freePremium = true
	premiumForPromotion = true

	-- Blessings
	-- NOTE: blessingReduction* regards items/containers loss.
	-- eachBlessReduction is how much each bless reduces the experience/magic/skills loss.
	-- pvpBlessingThreshold is damage percent received from PvP that is required to
	-- enable pvpBlessing.
	-- fairFightTimeRange is last X seconds from which damage to player counts.
	-- Applies to pvp blessing.
	blessings = true
	blessingOnlyPremium = true
	blessingReductionBase = 30
	blessingReductionDecrement = 5
	eachBlessReduction = 8
	pvpBlessingThreshold = 40
	fairFightTimeRange = 60

	-- Rates
	-- NOTE: experienceStages configuration is located in data/XML/stages.xml.
	-- rateExperienceFromPlayers 0 to disable.
	-- For constant spawn count increment, use exact values in rateSpawn* variables.
	experienceStages = true
	rateExperience = 5.0
	rateExperienceFromPlayers = 0
	rateSkill = 20.0
	rateMagic = 15.0
	rateLoot = 5.0
	rateSpawnMin = 0.5
	rateSpawnMax = 0.5

	-- Monster rates
	rateMonsterHealth = 1.1
	rateMonsterMana = 1.0
	rateMonsterAttack = 1.2
	rateMonsterDefense = 1.1

	-- Experience from players
	-- NOTE: min~Threshold* set to 0 will disable the minimum threshold:
	-- player will gain experience from every lower leveled player.
	-- max~Threshold* set to 0 will disable the maximum threshold:
	-- player will gain experience from every higher leveled player.
	minLevelThresholdForKilledPlayer = 0.9
	maxLevelThresholdForKilledPlayer = 1.1

	-- Stamina
	-- NOTE: Stamina is stored in miliseconds, so seconds are multiplied by 1000.
	-- rateStaminaHits multiplies every hit done a creature, which are later
	-- multiplied by player attack speed.
	-- rateStaminaGain is multiplying every second of logged out time, eg:
	-- 60 * 1000 / 3 = 20 seconds, what gives 1 stamina minute for 3 being logged off.
	-- rateStaminaThresholdGain is dividing in case the normal gain (that is
	-- multiplied by rateStaminaGain, btw.) passed above threshold, eg:
	-- 60 * 1000 / 3 = 20 / 4 = 5 seconds (3 * 4 = 12 minutes for 1 stamina minute).
	-- staminaRatingLimit* is in minutes.
	rateStaminaLoss = 1
	rateStaminaGain = 3
	rateStaminaThresholdGain = 12
	staminaRatingLimitTop = 40 * 60
	staminaRatingLimitBottom = 14 * 60
	staminaLootLimit = 14 * 60
	rateStaminaAboveNormal = 1.5
	rateStaminaUnderNormal = 0.5
	staminaThresholdOnlyPremium = true

	-- Party
	-- NOTE: experienceShareLevelDifference is float number.
	-- experienceShareLevelDifference is highestLevel * value
	experienceShareRadiusX = 30
	experienceShareRadiusY = 30
	experienceShareRadiusZ = 1
	experienceShareLevelDifference = 2 / 3
	extraPartyExperienceLimit = 20
	extraPartyExperiencePercent = 50
	experienceShareActivity = 1 * 60 * 1000

	-- Global save
	-- NOTE: globalSaveHour means like 03:00, not that it will save every 3 hours,
	-- if you want such a system please check out data/globalevents/globalevents.xml.
	globalSaveEnabled = false
	globalSaveHour = 8
	globalSaveMinute = 0
	shutdownAtGlobalSave = true
	cleanMapAtGlobalSave = false
	closeInstanceOnShutdown = true

	-- Spawns
	deSpawnRange = 2
	deSpawnRadius = 50
	monsterSpawnWalkback = true
	allowBlockSpawn = true

	-- Summons
	maxPlayerSummons = 2
	teleportAllSummons = false
	teleportPlayerSummons = false

	-- Status
	statusPort = 7171
	ownerName = ""
	ownerEmail = "blackhawk.support@live.com"
	url = "blackhawk.sytes.net"
	location = "Europe"
	displayGamemastersWithOnlineCommand = false

	-- Logs
	disableLuaErrors = false
	displayPlayersLogging = false
	prefixChannelLogs = ""
	runFile = "server/out.log"
	outputLog = "server/error.log"
	truncateLogOnStartup = false

	-- Manager
	-- NOTE: managerPassword left blank disables manager.
	managerPort = 7171
	managerLogs = true
	managerPassword = ""
	managerLocalhostOnly = true
	managerConnectionsLimit = 1

	-- Admin
	-- NOTE: adminPassword left blank disables manager.
	-- Set to anything if you set adminRequireLogin to false.
	-- adminEncryption available options: rsa1024xtea;
	-- remember to set correct data!
	adminPort = 7171
	adminLogs = true
	adminPassword = ""
	adminLocalhostOnly = true
	adminConnectionsLimit = 1
	adminRequireLogin = true
	adminEncryption = ""
	adminEncryptionData = ""
