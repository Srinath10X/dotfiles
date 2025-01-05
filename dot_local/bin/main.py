import keyboard
import time

input_active = False
key_shift_pressed = False

key_event_equal = 'equal'
key_event_w = 'w'

stop_keys = ['a', 's', 'd', 'c', 'z']

while True:
    if keyboard.is_pressed('shift'):
        key_shift_pressed = True
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

    elif keyboard.is_pressed('space'):
        if input_active:
            keyboard.release(key_event_equal)
            keyboard.release(key_event_w)

            time.sleep(0.625)

            keyboard.press(key_event_equal)
            keyboard.press(key_event_w)

    if input_active:
        for key in stop_keys:
            if keyboard.is_pressed(key):
                input_active = False
                keyboard.release(key_event_equal)
                keyboard.release(key_event_w)
