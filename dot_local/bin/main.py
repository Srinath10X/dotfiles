import keyboard
import time

input_active = False
key_event_equal = 'equal'
key_event_w = 'w'

while True:
    if keyboard.is_pressed('shift'):
        if not input_active:
            input_active = True
            keyboard.press(key_event_equal)
            keyboard.press(key_event_w)

        else:
            input_active = False
            keyboard.release(key_event_equal)
            keyboard.release(key_event_w)
        
        while keyboard.is_pressed('shift'):
            time.sleep(0.1)

    if not input_active:
        time.sleep(0.1)
