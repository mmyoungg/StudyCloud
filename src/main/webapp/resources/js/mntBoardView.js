



// 공유 - 링크복사
//현재 url 변수로 가져오기
let nowUrl = window.location.href;

function copyUrl(){ 
  //nowUrl 변수에 담긴 주소를
  	navigator.clipboard.writeText(nowUrl).then(res=>{
	  alert("주소가 복사되었습니다");
	})
}


// 카카오톡 공유
     function sendLinkCustom() {
        Kakao.init("1572aaf08eece01d4938d2aa1cc1b93a");
        Kakao.Link.sendCustom({
            templateId: 86414
        });
    }



try {
  function sendLinkDefault() {
    Kakao.init('1572aaf08eece01d4938d2aa1cc1b93a')
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: '딸기 치즈 케익',
        description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
        imageUrl:
          'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845,
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com',
          },
        },
      ],
    })
  }
; window.kakaoDemoCallback && window.kakaoDemoCallback() }
catch(e) { window.kakaoDemoException && window.kakaoDemoException(e) }


