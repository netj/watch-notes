# Watch-Notes

Listen to OS X Distributed Notifications from command-line.

## Usage

    watch-notes com.apple.screen{LockUIIsShown,IsUnlocked} |
    while read note args; do
        case $note in
            com.apple.screenLockUIIsShown)
                # record login attempts
                TakeOneLoginShot.sh attempt &
                ;;
            com.apple.screenIsUnlocked)
                # take a picture after screen is unlocked
                sleep 10
                TakeOneLoginShot.sh &
                ;;
            *)
                date +"# %F %T: $note"
                ;;
        esac
    done

Inspired by this [an answer at Stack Overflow](http://stackoverflow.com/a/8498796/390044).
