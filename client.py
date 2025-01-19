import requests

stores_data = [
    {"name": "한식당 행복한 집", "number": "010-1234-5678", "address": "서울특별시 강남구 1번지"},
    {"name": "이탈리안 레스토랑 미소", "number": "010-2345-6789", "address": "서울특별시 강북구 2번지"},
    {"name": "중국집 맛있는 만두", "number": "010-3456-7890", "address": "서울특별시 송파구 3번지"},
    {"name": "일식당 사계절", "number": "010-4567-8901", "address": "서울특별시 마포구 4번지"},
    {"name": "베이커리 빵굽는 집", "number": "010-5678-9012", "address": "서울특별시 용산구 5번지"},
    {"name": "커피숍 아침의 향기", "number": "010-6789-0123", "address": "서울특별시 관악구 6번지"},
    {"name": "패스트푸드 햄버거 왕국", "number": "010-7890-1234", "address": "서울특별시 서초구 7번지"},
    {"name": "피자 전문점 피자나라", "number": "010-8901-2345", "address": "서울특별시 동작구 8번지"},
    {"name": "치킨집 바삭한 치킨", "number": "010-9012-3456", "address": "서울특별시 금천구 9번지"},
    {"name": "분식집 떡볶이 천국", "number": "010-0123-4567", "address": "서울특별시 성동구 10번지"},
    {"name": "해산물 전문점 바다의 맛", "number": "010-1234-5678", "address": "부산광역시 해운대구 1번지"},
    {"name": "양식당 스테이크 하우스", "number": "010-2345-6789", "address": "부산광역시 남구 2번지"},
    {"name": "김밥전문점 김밥천국", "number": "010-3456-7890", "address": "부산광역시 북구 3번지"},
    {"name": "족발집 족발이 맛있다", "number": "010-4567-8901", "address": "부산광역시 사하구 4번지"},
    {"name": "샌드위치 전문점 샌드위치 집", "number": "010-5678-9012", "address": "부산광역시 금정구 5번지"},
    {"name": "버거전문점 불고기 버거", "number": "010-6789-0123", "address": "대구광역시 중구 6번지"},
    {"name": "아시아 음식점 아시아의 맛", "number": "010-7890-1234", "address": "대구광역시 동구 7번지"},
    {"name": "디저트 카페 달콤한 하루", "number": "010-8901-2345", "address": "대구광역시 서구 8번지"},
    {"name": "스시 전문점 스시 유토피아", "number": "010-9012-3456", "address": "대구광역시 남구 9번지"},
    {"name": "아침식사 카페 아침의 기적", "number": "010-0123-4567", "address": "대구광역시 북구 10번지"}
]



BASE_URL = 'http://127.0.0.1:8000/api/stores/'

# 데이터 받아오기
def get_stores():
    response = requests.get(BASE_URL)
    return response.json()

# 데이터1개 받아오기
def get_store(store_id):
    response = requests.get(f'{BASE_URL}{store_id}/')
    return response.json()

# 데이터 추가
def create_store(name, number, address):
    new_store = {
        "name": name,
        "number": number,
        "address": address
    }
    response = requests.post(BASE_URL, json=new_store)
    return response.json()

# 데이터 업데이트
def update_store(store_id, name, number, address):
    updated_store = {
        "name": name,
        "number": number,
        "address": address
    }
    response = requests.put(f'{BASE_URL}{store_id}/', json=updated_store)
    return response.json()

# 데이터 삭제
def delete_store(store_id):
    response = requests.delete(f'{BASE_URL}{store_id}/')
    return response.status_code  # 204가 반환되면 성공적으로 삭제됨

# 예시 사용
if __name__ == "__main__":
    # 새로운 스토어 생성
     print("새로운 스토어 생성:")
     for store in stores_data:
         create_store(store["name"], store["number"], store["address"])

    # 모든 스토어 가져오기
    # print("모든 스토어:")
    # [print(store) for store in get_stores()]

    # 특정 스토어 가져오기
    #print(get_store(1))

    # # 스토어 업데이트
    # print("스토어 업데이트:")
    # store_id = 1  # 수정할 스토어의 ID
    # print(update_store(store_id, "Updated Store", "987654321", "456 Another Street"))

    # # 스토어 삭제
    # print(delete_store(store_id))
    # [delete_store(store["id"]) for store in get_stores()] # 다지우기
