### 브랜치와 이슈 다루는 법을 정리하였습니다.  

🙋‍♀️ 수정사항이 있다면 말씀해주세요 🙋‍♀️   
🙋‍♀️ `git pull` 과 `git push`는 종종 해주세요 🙋‍♀️


[브랜치 관련 페이지](https://backlog.com/git-tutorial/kr/stepup/stepup2_8.html)  
[브랜치와 이슈 연동하기](https://codesyun.tistory.com/322)

  

## 이슈 만들기
*깃허브 UI 기준으로 작성하였습니다.*

1. 깃허브 Issues 탭으로 간다.
2. `New issue` 눌러서 이슈를 만드는 페이지로 진입한다.
3. 이슈 제목과 내용을 작성한다.
4. Assignees 에 이슈 처리할 사람을 지정하고 필요시 Labels 를 단다. Projects 에 레포지토리를 연결하면, 칸반보드로 볼 수 있다.  
    +) 이슈 페이지에서 바로 브랜치를 만들 수 있지만, 이름이 깔끔하지 않으니 지양하시길...  
5. 이슈를 발행하고 이슈 번호를 확인한다.  
    e.g. `#8`


<br>

## 브랜치 만들고 이슈와 연동하기
*VS Code 에서 진행해주세요.*

1. VS Code로 레포지토리를 열고, `git pull` 을 진행한다.  
2. `git branch {이슈번호}-{이슈에대한설명}` 을 사용하여 브랜치를 만든다.
3. `git checkout {브랜치이름}` 으로 해당 브랜치로 이동한다.
4. 브랜치에서 작업 진행 후 commit 한다.
5. 커밋 메시지는 [작성규칙](https://github.com/damdam6/RE-Habbit-ShinhanH#readme) 을 기반으로 작성한다.
    +) footer 부분에 Resolve: {#이슈번호} 를 적으면, 이슈가 자동으로 닫힌다.

<br>

## 브랜치 병합하기
1. `git checkout main` 으로 메인 브랜치로 이동한다.
2. `git merge {브랜치이름}` 으로 작업 브랜치를 메인 브랜치에 반영한다.
