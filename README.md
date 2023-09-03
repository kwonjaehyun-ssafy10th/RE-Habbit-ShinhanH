
# RE-Habbit-ShinhanH
---

# 커밋 작성 규칙
### git commit 하는 법


```bash
# {$어떤내용} = $이후의 내용을 {$어떤내용} 대신 작성해주면 됩니다. 

git status
 //현재 상태 확인 - git서버랑 비교해서 다른 점/commit상태 등

git add {$올리고 싶은 파일 경로}
// add를 통해 파일 추가

git commit -m "{$타입태그 :[#이슈넘버]제목} 
# 이슈넘버가 없을 경우 임시로 '-'를 사용해주세요.
# 따옴표를 닫지 않은  채로 엔터치면 줄바꿈이 됩니다.
# 한 줄 공백으로 남겨둔 뒤 다음 줄에 body작성

{$구체적인 commit 내용}
# 한 줄 공백으로 남겨둔 뒤 다음 줄에 footer작성

{$footer유형 #이슈넘버}"
# footer 위치에서 이슈 close가 가능합니다.
# footer유형을 Resolve로 설정할 경우 git 상의 issue가 자동 종료됩니다. 이용해주세요.
```

++디스코드 서버 내의 commit 메시지 가이드 링크를 참고해주세요. \
++모르겠으면 질문해주세요. 아무렇게나 commit 금지

커밋 예시
```bash
git commit -m "docs: [#-]readme.md업데이트

readme 내 commit 안내 추가

Ref: #1"
```
