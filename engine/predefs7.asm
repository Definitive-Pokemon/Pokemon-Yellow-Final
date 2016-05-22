DisplayElevatorFloorMenu: ; 1c264 (7:4264)
	ld hl, wd730
	ld a, [hl]
	push af
	set 6, [hl]
	ld hl, WhichFloorText
	call PrintText
	pop af
	ld [wd730], a
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	ld a, [wListScrollOffset]
	push af
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	ld [wPrintItemPrices], a
	ld a, SPECIALLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	pop bc
	ld a, b
	ld [wListScrollOffset], a
	ret c
	ld hl, wd126
	set 7, [hl]
	ld hl, wElevatorWarpMaps
	ld a, [wWhichPokemon]
	add a
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	ld hl, wWarpEntries
	call .UpdateWarp

.UpdateWarp
	inc hl
	inc hl
	ld a, b
	ld [hli], a ; destination warp ID
	ld a, c
	ld [hli], a ; destination map ID
	ret

WhichFloorText: ; 1c2bd (7:42bd)
	TX_FAR _WhichFloorText
	db "@"
