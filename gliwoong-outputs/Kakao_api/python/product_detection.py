import sys
import argparse
import requests
import os
from PIL import Image, ImageDraw, ImageFont
from io import BytesIO

API_URL = 'https://dapi.kakao.com/v2/vision/product/detect'
MYAPP_KEY = ''

def detect_product_image(filename):
    headers = {'Authorization': 'KakaoAK {}'.format(MYAPP_KEY)}

    try:
        files = { 'image' : open(filename, 'rb')}
        resp = requests.post(API_URL, headers=headers, files=files)
        resp.raise_for_status()
        return resp.json()
    except Exception as e:
        print(str(e))
        sys.exit(0)

def show_products(filename, detection_result):
    image = Image.open(filename)
    draw = ImageDraw.Draw(image)
    for obj in detection_result['result']['objects']:
        x1 = int(obj['x1']*image.width)
        y1 = int(obj['y1']*image.height)
        x2 = int(obj['x2']*image.width)
        y2 = int(obj['y2']*image.height)
        draw.rectangle([(x1,y1), (x2, y2)], fill=None, outline=(255,0,0,255))
        draw.text((x1+5,y1+5), obj['class'], (255,0,0))
    del draw

    return image

if __name__ == "__main__":
    image_folder = os.path.abspath("export/crawled_data/")
    image_list = os.listdir(image_folder)
    image_list.sort()

    cnt = 0

    sys.stdout = open('output.txt', 'w')
    for i in range(len(image_list)):
        image = image_list[i]
        print("%s 이미지 분석 중.." % image)

        image_path = "./export/crawled_data/" + image
        detection_result = detect_product_image(image_path)
        print("-----%s 분석 결과-----" % image)
        print(detection_result)
        export_image = show_products(image_path, detection_result)

        export_path = "./export/kakao_result/" + image
        export_path = export_path[:-3] + "png"
        export_image.save(export_path)