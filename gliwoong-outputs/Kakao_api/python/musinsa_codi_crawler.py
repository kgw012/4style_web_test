# musinsa crawling

import os
import sys
import re
from bs4 import BeautifulSoup as bs
from urllib.request import (urlopen, urlretrieve)
from urllib.parse import quote_plus
from pandas import DataFrame
import re

# crawl version1. low-quality image
def load_musinsa_crawler1(crawling_num, save_path) :
    print("====================================================")
    print("무신사 '스타일링' 코디 크롤러를 시작합니다.")
    print("----------------------------------------------------")
    print("크롤링 진행중..........")

    # URL of crawling page
    url = 'https://store.musinsa.com/app/styles/lists'

    html = urlopen(url)
    soup = bs(html, "html.parser")

    # get total page num
    totalPageNum = int(soup.select_one(
        '#catelist > div.right_contents.hover_box > div > div.pagingNumber-box.box > span > span.totalPagingNum'
        ).text)

    url += '?page='

    # count crawling num
    crawling_count = 0

    # crawling
    breaker = False
    for currentPageNum in range(1, totalPageNum + 1) :
        print(str(currentPageNum) + "번째 페이지 크롤링중입니다...")

        currentUrl = url + str(currentPageNum)
        html = urlopen(currentUrl)
        soup = bs(html, "html.parser")

        # get itemBoxes
        itemBoxes = soup.select('#catelist > div.right_contents.hover_box > div > div.list-box.box.style-list-box > ul > li')

        # loop itemBoxes
        for itemBox in itemBoxes :
            # flag of crawling num
            if crawling_num <= crawling_count :
                breaker = True
                break

            # get image URL
            imageUrlTag = itemBox.select_one('div > div.list_img.opacity_img > a > img')
            
            imageUrl = "http:"
            image = imageUrlTag.get('src')
            if image != None:
                imageUrl += image
            else:
                image = imageUrlTag.get('data-original')
                if image != None:
                    imageUrl += image
                else: continue

            # download image
            urlretrieve(imageUrl, save_path + '/%05d.jpg' % crawling_count)
            
            # crawling count
            crawling_count += 1
        
        # flag of crawling num
        if breaker : break
    
    print("====================================================")
    print("무신사 이미지 크롤링을 완료하였습니다.")
    print("저장 위치 : " + save_path)
    print("----------------------------------------------------")

# crawler version2. high-quality image
def load_musinsa_crawler2(crawling_num, save_path) :
    print("====================================================")
    print("무신사 '스타일링' 코디 크롤러를 시작합니다.")
    print("----------------------------------------------------")

    # URL of crawling page
    url = 'https://store.musinsa.com/app/styles/lists'

    html = urlopen(url)
    soup = bs(html, "html.parser")

    # get total page num
    totalPageNum = int(soup.select_one(
        '#catelist > div.right_contents.hover_box > div > div.pagingNumber-box.box > span > span.totalPagingNum'
        ).text)

    url += '?page='

    # count crawling num
    crawling_count = 0

    # crawling
    breaker = False
    for currentPageNum in range(1, totalPageNum + 1) :
        print("----------------------------------------------------")
        print(str(currentPageNum) + "번째 페이지 크롤링 시작.")

        currentUrl = url + str(currentPageNum)
        html = urlopen(currentUrl)
        soup = bs(html, "html.parser")

        # get itemBoxes
        itemBoxes = soup.select('#catelist > div.right_contents.hover_box > div > div.list-box.box.style-list-box > ul > li')

        # loop itemBoxes
        for itemBox in itemBoxes :
            # flag of crawling num
            if crawling_num <= crawling_count :
                breaker = True
                break
            
            if (crawling_count + 1) % 10 == 0 :
                print("%d번째 상품 크롤링 중.." % (crawling_count + 1))

            # get product URL
            productUrlTag = itemBox.select_one('div > div.list_img.opacity_img > a')
            
            productUrl = "https://store.musinsa.com/app/styles/views/"

            product_num = re.findall(r'\d+', productUrlTag.get('onclick'))[0]
            if product_num != None:
                productUrl += product_num
                print(productUrl)
            else: continue

            product_html = urlopen(productUrl)
            product_soup = bs(product_html, "html.parser")

            imageUrlTag = product_soup.select_one('#style_info > div.detail_slider > a.ui-layer-btn > img')
            if imageUrlTag == None:
                imageUrlTag = product_soup.select_one('')
                sys.stdout = open('output.txt', 'w')
                print(product_soup)
                return

            imageUrl = imageUrlTag.get('src')
            if imageUrl == None: continue

            # download image
            urlretrieve(imageUrl, save_path + '/%05d.jpg' % crawling_count)
            
            # crawling count
            crawling_count += 1
        
        # flag of crawling num
        if breaker : break
    
    print("====================================================")
    print("무신사 이미지 크롤링을 완료하였습니다.")
    print("저장 위치 : " + save_path)
    print("----------------------------------------------------")

    
if __name__ == "__main__":

    # input crawling_num
    crawling_num = 10000

    save_path = os.path.abspath("export/crawled_data/")
    if not os.path.exists(save_path):
        os.makedirs(save_path)

    load_musinsa_crawler2(crawling_num, save_path)