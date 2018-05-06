//Title: Powerful Action Locks
//Credit to: Jtgibson
//Contributed by: Jtgibson


/*
ActionLock proc (atom)

Format:
    src.ActionLock(action="", duration=0)
    src.ActionLock(list("action1","action2","action3"), duration=0)

Args:
    action: A text string for the name of the lock to establish, or a list
      containing text strings for locks to enable simultaneously.
    duration: How long the lock should last (in ticks).

Returns:
    1 if there is a lock in place when the proc is called; 0 if there is
    no lock in place and a new lock has been established.

Default action:
    Reduce all existing locks based on the amount of time passed since the
    last action was performed.  Check the provided lock and return 1 if
    the lock is still in place.  Otherwise, make a new lock of the given
    name lasting for 'duration' ticks.  If 'duration' is zero (or the
    argument is omitted), return whether the lock is in use or not without
    creating a new lock.


This is a surprisingly powerful locking feature which is quite simple
behind the scenes.  It is only one proc!

In any proc where you want to "lock" an action, meaning that you want to
prevent the user from doing the same action (or a similar action) twice
before a certain time has passed, simply call the following:

    if(src.ActionLock("myaction",50)) return //lock for 5 seconds

In this case, the proc will place a lock onto "myaction" for five seconds.
Since we are assuming there is no existing lock on "myaction", the
ActionLock proc will return 0, meaning you can continue with the rest of
your command knowing full well that the system is working exactly like it
should.

If another call to ActionLock("myaction") is made within five seconds,
it will return *1*, signifying that there is a lock in place.  If you are
using the standard use above, this prevents the code from going further
because it triggers the "return" statement.  Each call of ActionLock()
will update how much time is remaining in the lock, however, so when you
call ActionLock() after five seconds, you'll find that the lock is gone
and your code will execute, with a fresh lock being put in place again.

If you want to check and set multiple locks simultaneously, just pass in
a list of lock names as the 'action' argument -- if all of the locks are
open, all locks will be set simultaneously and the proc will return 0,
meaning that the code can continue.  If any one of the locks are
unavailable, no locks will be set and the proc will return 1, meaning
that your code should halt because at least one of the attempted locks
is still locked.


This locking mechanism has multiple advantages:

 * If a player "slams" his internet connection -- logs out suddenly --
   and your game treats quitting the game as a save action, then all
   existing locks are saved along with the character (assuming you are
   using a default save routine) and the player will still have to wait
   for his locks to
    upon logging in.  It punishes anyone who
   attempts to cancel a long lock by logging out!

 * The lock happily accepts floating point as well as integer lock
   durations.  Decimals are remembered, so a lock duration of 2.5
   ticks would allow the action on a pattern of ticks equal to
     3, 2, 3, 2, 3, 2...

 * The lock does not run any procedures or loops in the background.  It
   only updates itself whenever you check the status of a lock.  This
   means it is very efficient!

 * The locks work for all atoms, not just mobs.  The locks only
   initialise themselves if they're needed.  If you don't want to use
   locks for anything except mobs, it'll work just fine and won't
   waste memory on other objects!

 * To check if a lock is set without setting the lock if it isn't,
   use ActionLock("mylock") without providing a duration.  To check
   the time remaining in a lock, call ActionLock("mylock") immediately
   before using the direct access method actionlock["mylock"], in
   order to ensure the lock is up-to-date with the current tick.

 * If you want to instantly clear a lock, just use the code
     src.actionlock -= "mylock"
   to remove it from the lock list.  No need for a special procedure
   call!

 * To clear multiple locks, you can use the same technique with a list:
     src.actionlock -= list("lock1", "lock2", "lock3")

 * If you want to adjust the duration remaining in a lock, use
     src.actionlock["mylock"] -= ##
   or
     src.actionlock["mylock"] += ##
   where ## is the number of ticks to remove or add from/to the lock
   duration.  The next time a lock is used or checked, the lock will
   remember the alteration you made when it is updated.

 * More advanced programmers may want to clear locks based on how long
   the player has been logged out; for instance, someone who has been
   logged out for several hours should no longer have any locks when
   logging back in, typically.  You may also consider using the line
     src.actiontime = world.time
   in your players' Login() procedure, to allow time to accrue from
   login instead of from the first time an action is attempted.
*/



/*atom
    var/list/actionlock
    var/tmp/actiontime = 0

    proc/ActionLock(action="", duration=0)
        if(!action) return

        if(!src.actiontime) src.actiontime = world.timeofday
        if(!src.actionlock) src.actionlock = list()
        else
        //Every time the proc is called, we run through the existing locks
        // to see if they've expired.  If any lock is precisely equal to
        // zero, we simply remove it entirely.
            var/time_since_last_action = (world.timeofday-src.actiontime)
            if(time_since_last_action > 0)
                for(var/lock in src.actionlock)
                    var/lock_duration = src.actionlock[lock]
                    if(lock_duration > 0)
                        lock_duration -= time_since_last_action

                        //Prevent high negative numbers of action locks, but preserve
                        // negative floating point decimals between -1 and 0 so they
                        // will accrue against further actions.
                        if(lock_duration < 0)
                            lock_duration += round(abs(lock_duration))

                        //Remove locks from memory if they are now blank, but preserve
                        // all other locks (including decimals).
                        if(!lock_duration)
                            src.actionlock -= lock
                        else src.actionlock[lock] = lock_duration

        //Now that we've successfully run through all of the existing locks,
        // we can safely update the current action time.
        src.actiontime = world.timeofday

        //If provided a list of locks instead of just a single lock
        if(istype(action,/list))
            //Confirm all locks are not set
            for(var/X in action) if(src.actionlock[X] > 0) return 1
            //If this point is reached, no locks are set; set all locks
            // to the duration (if the duration exists)
            if(duration) for(var/X in action) src.actionlock[X] += duration
        else //provided just one lock
            //Confirm the lock is not set
            if(src.actionlock[action] > 0) return 1

            //If the lock is not set, set it to the duration (if given a
            // duration)
            if(duration) src.actionlock[action] += duration
        return 0
*/

atom/var/actionlock = 0
atom/var/timestarted
atom/var/timestarted2
atom/var/objexpiretext = 0
atom/var/objexpires = 0


atom/
	proc
		checkcdexp()
			if(sorttext(time2text(world.realtime,"YYYYMMDDhhmm"),src.objexpires)==-1)
				src.actionlock=0
				src.timestarted=0


