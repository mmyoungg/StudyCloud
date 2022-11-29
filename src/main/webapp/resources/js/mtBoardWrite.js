 
 // 직무 셀렉트박스
 function selectChange(e) {
  var jobduty_1 = ["백엔드/서버개발자", "프론트엔드/웹퍼블리셔", 
  					"SW엔지니어", "안드로이드 개발자", "ISO개발자"];
  var jobduty_2 = ["프로덕트 디자이너", "웹/앱 디자이너", "그래픽 디자이너"
  					,"광고 디자이너", "영상 디자이너"];
  var jobduty_3 = ["퍼포먼스 마케터", "콘텐츠 마케터", "디지털 마케터",
  					"마케팅 기획자", "브랜드 마케터", "광고 기획자"];
  var jobduty_4 = ["경영지원", "회계/경리", "조직관리", "인사/평가"
  					, "채용담당자", "CS매니저"];
  var target = document.getElementById("jobduty");
 
  if(e.value == "1") var d = jobduty_1;
  else if(e.value == "2") var d = jobduty_2;
  else if(e.value == "3") var d = jobduty_3;
  else if(e.value == "4") var d = jobduty_4;
 
  target.options.length = 0;
 
  for (x in d) {
    var opt = document.createElement("option");
    opt.value = d[x];
    opt.innerHTML = d[x];
    target.appendChild(opt);
  } 
}

