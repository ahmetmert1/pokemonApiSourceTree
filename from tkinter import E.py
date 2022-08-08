from tkinter import E
from tkinter import E
import pyautogui, time,keyboard

def pressE():   
    while(1):
        if keyboard.is_pressed('q') == 1:
            return
        # pyautogui.press("F")
        pyautogui.press("E")
        time.sleep(0.5)

time.sleep(2)
pressE()