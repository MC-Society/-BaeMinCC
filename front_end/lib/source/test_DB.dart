import 'package:front_end/model/food.dart';
import 'package:front_end/model/store.dart';
import 'package:front_end/model/user.dart';

class UserList {
  static List<User> userList = [
    User.signup({'nickname': 'test1', 'id': 'qwer', 'password': '123'}),
    User.signup({'nickname': 'test2', 'id': 'qwert', 'password': '1234'}),
    User.signup({'nickname': 'test3', 'id': 'qwerty', 'password': '12345'}),
  ];
}

class UserInfo {
  static User userInfo = User.userInfo({'nickname': 'test1', 'id': 'qwer'});
}

class StoreList {
  static List<Store> storeList = [
    Store.fromList({
      "name": "한식당 행복한 집",
      "number": "010-1234-5678",
      "address": "서울특별시 강남구 1번지",
      "category": ["치킨", '초밥']
    }),
    Store.fromList({
      "name": "이탈리안 레스토랑 미소",
      "number": "010-2345-6789",
      "address": "서울특별시 강북구 2번지",
      "category": ["피자"]
    }),
    Store.fromList({
      "name": "중국집 맛있는 만두",
      "number": "010-3456-7890",
      "address": "서울특별시 송파구 3번지",
      "category": ["치킨"]
    }),
    Store.fromList({
      "name": "일식당 사계절",
      "number": "010-4567-8901",
      "address": "서울특별시 마포구 4번지",
      "category": ["피자"]
    }),
    Store.fromList({
      "name": "베이커리 빵굽는 집",
      "number": "010-5678-9012",
      "address": "서울특별시 용산구 5번지",
      "category": ["치킨"]
    }),
    Store.fromList({
      "name": "커피숍 아침의 향기",
      "number": "010-6789-0123",
      "address": "서울특별시 관악구 6번지",
      "category": ["피자"]
    }),
    Store.fromList({
      "name": "패스트푸드 햄버거 왕국",
      "number": "010-7890-1234",
      "address": "서울특별시 서초구 7번지",
      "category": ["치킨"]
    }),
    Store.fromList({
      "name": "피자 전문점 피자나라",
      "number": "010-8901-2345",
      "address": "서울특별시 동작구 8번지",
      "category": ["치킨", "피자"]
    }),
    Store.fromList({
      "name": "치킨집 바삭한 치킨",
      "number": "010-9012-3456",
      "address": "서울특별시 금천구 9번지",
      "category": ["피자"]
    }),
    Store.fromList({
      "name": "분식집 떡볶이 천국",
      "number": "010-0123-4567",
      "address": "서울특별시 성동구 10번지",
      "category": ["치킨"]
    }),
    Store.fromList({
      "name": "해산물 전문점 바다의 맛",
      "number": "010-1234-5678",
      "address": "부산광역시 해운대구 1번지",
      "category": ["치킨"]
    }),
    Store.fromList({
      "name": "양식당 스테이크 하우스",
      "number": "010-2345-6789",
      "address": "부산광역시 남구 2번지",
      "category": ["치킨", "피자"]
    }),
    Store.fromList({
      "name": "김밥전문점 김밥천국",
      "number": "010-3456-7890",
      "address": "부산광역시 북구 3번지",
      "category": ["치킨"]
    }),
    Store.fromList({
      "name": "족발집 족발이 맛있다",
      "number": "010-4567-8901",
      "address": "부산광역시 사하구 4번지",
      "category": ["피자"]
    }),
    Store.fromList({
      "name": "샌드위치 전문점 샌드위치 집",
      "number": "010-5678-9012",
      "address": "부산광역시 금정구 5번지",
      "category": ["피자"]
    }),
    Store.fromList({
      "name": "버거전문점 불고기 버거",
      "number": "010-6789-0123",
      "address": "대구광역시 중구 6번지",
      "category": ["치킨"]
    }),
    Store.fromList({
      "name": "아시아 음식점 아시아의 맛",
      "number": "010-7890-1234",
      "address": "대구광역시 동구 7번지",
      "category": ["피자"]
    }),
    Store.fromList({
      "name": "디저트 카페 달콤한 하루",
      "number": "010-8901-2345",
      "address": "대구광역시 서구 8번지",
      "category": ["치킨"]
    }),
    Store.fromList({
      "name": "스시 전문점 스시 유토피아",
      "number": "010-9012-3456",
      "address": "대구광역시 남구 9번지",
      "category": ["피자"]
    }),
    Store.fromList({
      "name": "아침식사 카페 아침의 기적",
      "number": "010-0123-4567",
      "address": "대구광역시 북구 10번지",
      "category": ["치킨"]
    })
  ];
}

class FoodList {
  static List<Food> foodList = [
    Food("햄버거", "assets/images/burger.png"),
    Food("치킨", "assets/images/chicken.png"),
    Food("핫도그", "assets/images/hotdog.png"),
    Food("와플", "assets/images/ice_sandwich.png"),
    Food("면", "assets/images/noddle.png"),
    Food("피자", "assets/images/pizza.png"),
    Food("고기", "assets/images/steak.png"),
    Food("초밥", "assets/images/sushi.png")
  ];
}

class RecommendStoreList {
  static List<Store> storeList = [
    Store.fromListWithURL({
      "name": "버거 천국",
      "number": "010-1111-2222",
      "address": "서울특별시 마포구 1번지",
      "category": ["햄버거"],
      "imageURL":
          "https://cdn.enewstoday.co.kr/news/photo/202408/2159316_964697_2857.jpg"
    }),
    Store.fromListWithURL({
      "name": "치킨 사랑",
      "number": "010-2222-3333",
      "address": "경기도 성남시 2번지",
      "category": ["치킨"],
      "imageURL":
          "https://www.bhc.co.kr/upload/bhc/menu/%ED%95%AB%ED%9B%84%EB%9D%BC%EC%9D%B4%EB%93%9C-%EC%8A%A4%ED%8B%B1_410x271.png"
    }),
    Store.fromListWithURL({
      "name": "핫도그의 매력",
      "number": "010-3333-4444",
      "address": "부산광역시 동래구 3번지",
      "category": ["핫도그"],
      "imageURL":
          "https://img.danawa.com/images/news/images/001255/20230228102105739_2QU0BP63.jpg"
    }),
    Store.fromListWithURL({
      "name": "와플의 정석",
      "number": "010-4444-5555",
      "address": "대구광역시 중구 4번지",
      "category": ["와플"],
      "imageURL": "https://www.waffleuniv.com/upload/waffle/65b8a8473d9a9.png"
    }),
    Store.fromListWithURL({
      "name": "면 요리 전문점",
      "number": "010-5555-6666",
      "address": "광주광역시 서구 5번지",
      "category": ["면"],
      "imageURL":
          "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202108/07/7048115b-6a38-4395-88b0-756e37e14c5c.jpg"
    }),
  ];
}
