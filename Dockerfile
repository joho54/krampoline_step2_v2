# Build stage: 
# node 16 이미지를 기반으로 함
FROM krmp-d2hub-idock.9rum.cc/goorm/node:16

# 작업 디렉토리 설정 
WORKDIR /usr/src/app

# 필요한 리액트 앱 소스를 이미지에 복사
COPY krampoline/ ./

# 필요한 npm 패키지 설치
RUN npm ci
RUN npm install -g serve

# 프로젝트 npm build
RUN npm run build

# 서버 실행시 사용하는 포트 지정
EXPOSE 3000

# 컨테이너를 사용할 때 빌드된 리액트 앱을 서빙.
CMD ["serve", "build"]
