const_value set 2
	const MRPSYCHICSHOUSE_FISHING_GURU

MrPsychicsHouse_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

MrPsychic:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM29_PSYCHIC
	iftrue .AlreadyGotItem
	writetext MrPsychicText1
	buttonsound
	verbosegiveitem TM_PSYCHIC_M
	iffalse .Done
	setevent EVENT_GOT_TM29_PSYCHIC
.AlreadyGotItem:
	writetext MrPsychicText2
	waitbutton
.Done:
	closetext
	end

MrPsychicsHouseBookshelf:
	jumpstd difficultbookshelf

MrPsychicText1:
	text "…"

	para "…"

	para "…"

	para "…I got it!"

	para "You wanted this!"
	done

MrPsychicText2:
	text "TM29 is PSYCHIC."

	para "It may lower the"
	line "target's SPCL.DEF."
	done

MrPsychicsHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 5, SAFFRON_CITY
	warp_def $7, $3, 5, SAFFRON_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 1, 0, BGEVENT_READ, MrPsychicsHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, MrPsychicsHouseBookshelf

.ObjectEvents:
	db 1
	object_event SPRITE_FISHING_GURU, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrPsychic, -1
