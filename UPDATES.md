--------------------------------------------------------------------------------
############################ [ DokusCore Updates ] #############################
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.6.1
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
- Fixed: When a message was displayed it halted the code below the message, thus
  not recognizing that you left the zone. This would induce glitches where the
  NPC would not spawn, or menu's that do not work. The critical messages are not
  halting the code now anymore, fixing this issue.
- Fixed: When taking a horse, the mouse is disabled immediately to prevent extra
  clicks on the exit button, preventing a couple of menu bugs from happening.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.6.0
--------------------------------------------------------------------------------
- Added: Romanian language made by RABBIT in discord!
- Fixed: The horse status was not reset in the database on horse rescue, now
  this is fixed and your horse will be back at the stable. With special thanks
  to @DeadShot on Discord, for applying this fix.
- Added: Option to order your horse to stay at his position, this will prevent
  the horse walking away when hitched. This will only halt the idle walking loop!
  The horse can still be moved and is not frozen in place, once the player steps
  on his/her horse, the stay status is automatically removed.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.5.2
--------------------------------------------------------------------------------
- Fixed: Small fix was needed for an update to the SpawnNPC API function
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.5.1
--------------------------------------------------------------------------------
- Added: Horse relations between players, now you can ride the horse with one
  on the back. The horse will also not go in panic mode or become aggressive
  when a accidental friendly punch or kick is done.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.5.0
--------------------------------------------------------------------------------
- Added: When a admin spawns a horse but does not own one, a default horse will
  be spawned in. The admin will automatically jump on the horse, when the admin
  steps off the horse will automatically be deleted. When a admin does own its
  own horse, the auto mount and delete will not happen.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.4.1
--------------------------------------------------------------------------------
- Added: Database logs for when users recover their horse at the stables.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.4.0
--------------------------------------------------------------------------------
- Added: Ability for admins to spawn one of their horses directly next to them
  for quick use. If a horse was already active and on the map, this horse will
  be deleted and teleported to your location. Note that doing this action will
  trigger a text bar on your character for everyone to see that you did this
  action for a short period of time to prevent admin abuse. Also in the future
  this action will generate a Discord log message, and a log entry into the
  database.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.3.2
--------------------------------------------------------------------------------
- Fixed: Typo error making the stables crash has been fixed
- Added: Horse does not idle walk anymore when idle in follow mode.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.3.1
--------------------------------------------------------------------------------
- Fixed: When NPc is fetching the horse, he will not say goodbye when you leave
  the stables until he delivered the horse.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
# Update v1.3.0
--------------------------------------------------------------------------------
- Added JS function for rescue the lost horse.
- Added warning on taking horse if horse is already active.
- Added button to rescue your horse when lost to the UI.
- Added function to check what city you are in called Area().
- Restructured the files of the plugin for later expansion.
- Added the function to Flee the horse from and take distance from your location
- Added the function to call your horse if the horse if within the max radius.
- Added the function to let your horse follow if the horse is within the max radius.
- Restarting the stables will not despawn your horse anymore, this is now
  maintained by DataSync, and the plugin will resync after restart.

- Added Idle Horse Walking:
  When a horse is not mounted, it will start to walk every x seconds. Everytime
  the horse gets the action to move, it takes new coordinates at random from its
  current location. When a the horse is mounted or moved, the idle counter resets
  and the process starts over. NOTE: This feature is getting build upon, currently
  the horse does not detect when the horse is attacked to a stack pole.

- Changed (Fixed):
  The Stables will now take the location of the player from DataSync instead of
  the players current location via the zone plugin. This way you can still walk
  out of the stable while the NPC is fetching your horse. If you leave the stable
  when the NPC is fetching your horse, he will bring it to you outside. Then the
  NPC will walk back to its original location and despawn a few moment later.

- Changed (Fixed):
  The stable NPC new despawns when you leave the stable just like the horse decoys
  within the stable visible on entry. This makes sure that the NPC is always spawned
  in at the correct position, before teleporting could make the NPC invisible or
  floating above/below the ground. This also cleans up the game engine ( entity pool )
  so that more entities can be used without impacting the server performance.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
