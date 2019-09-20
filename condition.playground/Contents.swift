let dust=15

if dust <= 30 {
    print("아 공기 상쾌하다")
}
else if dust>30 && dust<=50 {
    print("뭐 이 정도면 나쁘지 않군")
}
else if dust>50 && dust<=100 {
    print("아 안 좋아~~")
}
else {
    print("헉 최악이다!ㅜ")
}

let weather="비"
switch weather {
case "맑음":
    print("맑음")
case "흐림":
    print("흐림")
case "비":
    print("비")
case "눈":
    print("눈")
default:
    print("구름조금")
}



