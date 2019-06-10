import os
import cv2

def main():
    img = cv2.imread(os.path.join("split","m001.JPG"))

    b, g, r = img[:,:,0], img[:,:,1], img[:,:,2]
    print(b, g, r)

if __name__ == '__main__':
    main()
