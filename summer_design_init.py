import pytesseract
from pytesseract import Output
import cv2

cap=cv2.VideoCapture(0)
while(True):
    rec,frame=cap.read()
    d= pytesseract.image_to_data(frame,output_type=Output.DICT)
    n_boxes=len(d["level"])
    for i in range(n_boxes):
        (x, y, w, h) = (d['left'][i], d['top'][i], d['width'][i], d['height'][i])
        cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)
    cv2.imshow('data',frame)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
cap.release()
cv2.destroyAllWindows()