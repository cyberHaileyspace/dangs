<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="css/yj/cm.css" />
  </head>
  <body>
    <div class="container-cm">
      <div class="menu-cm">
        <div><a href="CmMainC">전체</a></div>
        <div><a href="CmTipC">반려 꿀팁</a></div>
        <div><a href="CmProudC">우리 멍멍</a></div>
        <div><a href="CmDiaryC">집사 일기</a></div>
        <div><a href="CmQnAC">Q&A</a></div>
      </div>

      <div class="search-cm">
        <input id="search-cm-input" placeholder="찾으시는 질문이 있으신가요?" />
        <button>
          <img
            class="search-cm-btn"
            alt=""
            src="https://cdn-icons-png.flaticon.com/512/2989/2989907.png"
          />
        </button>
        <hr />
        <span id="cm-result"></span>
      </div>

      <div>
        <div class="list-cm">
          <input
            type="radio"
            name="cm-option"
            value="cm-new"
            checked="checked"
          />
          최신순
          <input type="radio" name="cm-option" value="cm-like" /> 좋아요순
          <input type="radio" name="cm-option" value="cm-view" /> 조회순
        </div>
        <div class="write-cm" onclick="location.href='cmAddC'">
          <button>
            <img
              class="write-cm-img"
              alt=""
              src="https://cdn-icons-png.flaticon.com/512/117/117476.png"
            />
            <span>작성</span>
          </button>
        </div>
      </div>

      <div class="size-cm">
        <div class="dog-size">소형견</div>
        <div class="dog-size">중형견</div>
        <div class="dog-size">대형견</div>
      </div>
      
      <div class="post-cm">
      	<div class="cm-kind">
      		<div class="cm-menu">Q&A</div>
      		<div class="cm-cate">소동물</div>
      	</div>
      <div class="cm-title"><a href="CmPostC">글 제목 ------</a></div>
      <div class="cm-text"><span>요새 저희 강아지에 관한 가장 큰 고민이 생겼습니다.
      예전엔 안그랬는데 어느 순간 부터 저희 가족이 나간 뒤에 카페트나 욕실발판,
      담요 등등 배변패드 이외에 부드러운 재질에 오줌을 쌉니다. 여러 커뮤니티를 찾아본 결과,
      부드러운 재질에 오줌을 누는것은 본능이라 하더군요. 그치만 그 본능을 이해해주는 것은
      옳지 않다 생각하여 강아지 집과 물, 밥, 배변패드를 큰 우리 안에 넣어두고 저희가 외출할 때
      만큼은 그 안에서 생활하게 했습니다. 그러나 그 우리를 탈출하는 등 잘 지켜지지 않았고 강아지의
      스트레스만 더 쌓이는 듯 했습니다. 그래서 그런지 오줌이나 똥을 싸둔 배변패드를 갈기갈기 찢고
      우리 안을 엉밍진창으로 만들어둡니다. 지금은 강아지를 자유롭게 풀어주고 배변패드를 편하게 쉬는
      방석과 멀리했고 저희 가족이 외츨할 땐 카페트 있는 곳은 못가도록 집에 방문들을 다 닫았습니다.
      거실에서는 자유롭게 돌아다닐 수 있게 말이죠. 허나 또 다른 문제는 이렇게 풀어주면 계속 저희
      가족이 사용하는 소파에 올라가려고 점프를 합니다. 그 짧은 다리로 어떻게든 올라가겠다라는
      마인드로,, 결국 성공해서 소파 위에 올라가 앉아있습니다. 근데 소파에 올라가다 뛰면 자칫
      다칠 수도 있고, 부모님이 강아지와 사람이 쓰는 공간은 분라해야 한다며 야단을 치십니다. 그래서
      소파에 올라가지 못하도록 소파 앞에 높게 망을 세워두고 외출도 하고, 잠 잘 때도 못올라가게
      막아둡니다. 근데 저희가 잠 잘 때나 외출했을 때 또 어떻게든 그 높은 망에 빈틈을 찾아서 소파에
      올라갑니다.. 미치겠어요.. 이럴 땐 강아지가 어떤 이유 때문에 그러는 걸까요?
      어떻게 훈련해야하는거죠? ㅠㅠㅠㅠ 여태 강아지 훈련법이 잘못되었을까요? 배변훈련과 소파에
      못올라가게 하려면 어떻게 해야하죠? 제가 생각했을 땐 분리불안이 심해보여요.. 근데 부모님이
      강아지가 막 오줌 싸두고 소파에 올라가 있으면 싫어하시니까.. 그 모습도 불편해요 ㅠㅠ</span></div>
      
      <div class="cm-info">
      	<div class="info-name">닉네임</div>
      	<div class="info-date">01-15</div>
      	<div class="info-view">조회수</div>
      	<div class="info-like">좋아요</div>
      </div>
      
      </div>
      
      
      
      
    </div>
  </body>
</html>
