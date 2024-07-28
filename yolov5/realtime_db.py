# import detect
# import threading
# import time

# def infiniteloop1():
#     detect.run()

# def infiniteloop2():
#     while True:
#         print('Loop 2')
#         time.sleep(1)

# thread1 = threading.Thread(target=infiniteloop1)
# thread1.start()

# thread2 = threading.Thread(target=infiniteloop2)
# thread2.start()


#Firebase Libraries
import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from playsound import playsound

#Firebase intialization
cred = credentials.Certificate('sih-project-2022-firebase-adminsdk-djsbj-f7c2050ab5.json')
firebase_admin.initialize_app(cred, {
    'databaseURL':"https://sih-project-2022-default-rtdb.firebaseio.com",

})
ref = db.reference('/CCTV_0/')

area_file = open("area_file.txt",'r')
current_data = []
while True:
    area_file.seek(0)
    new_data_file = area_file.readlines()
    if(current_data != new_data_file):
        # playsound('beep.mp3',block=False)
        time,area = new_data_file[-1].split("_")
        current_data = new_data_file
        print(time,area)
        ref.update({
            "time": time,
            "area" : area
        })
