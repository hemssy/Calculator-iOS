# CalculatorApp
## Swift로 계산기 앱 만들기

## 프로젝트 소개

정수형 계산이 가능한 계산기 iOS App으로, 플레이그라운드에서 로직만 구현했던 **[CalculatorMini](https://github.com/hemssy/CalculatorMini)** 에 UI를 더해서 앱으로 만들었습니다.

Lv1부터 Lv8까지 총 여덟단계에 걸쳐서 발전시킨 과제입니다.

> **누르면 해당 레벨의 브랜치 리드미로 이동합니다. 각 레벨의 요구사항과 해결과정, 트러블 슈팅 등을 확인할 수 있습니다!**

<br>

<p align="center">
  <a href="https://github.com/hemssy/CalculatorApp/tree/Lv1"><img src="https://img.shields.io/badge/Lv1-000000?style=for-the-badge&labelColor=f5f5f5&color=f5f5f5"/></a>
  <a href="https://github.com/hemssy/CalculatorApp/tree/Lv2"><img src="https://img.shields.io/badge/Lv2-000000?style=for-the-badge&labelColor=f5f5f5&color=f5f5f5"/></a>
  <a href="https://github.com/hemssy/CalculatorApp/tree/Lv3"><img src="https://img.shields.io/badge/Lv3-000000?style=for-the-badge&labelColor=f5f5f5&color=f5f5f5"/></a>
  <a href="https://github.com/hemssy/CalculatorApp/tree/Lv4"><img src="https://img.shields.io/badge/Lv4-000000?style=for-the-badge&labelColor=f5f5f5&color=f5f5f5"/></a>
  <a href="https://github.com/hemssy/CalculatorApp/tree/Lv5"><img src="https://img.shields.io/badge/Lv5-000000?style=for-the-badge&labelColor=f5f5f5&color=f5f5f5"/></a>
  <a href="https://github.com/hemssy/CalculatorApp/tree/Lv6"><img src="https://img.shields.io/badge/Lv6-000000?style=for-the-badge&labelColor=f5f5f5&color=f5f5f5"/></a>
  <a href="https://github.com/hemssy/CalculatorApp/tree/Lv7"><img src="https://img.shields.io/badge/Lv7-000000?style=for-the-badge&labelColor=f5f5f5&color=f5f5f5"/></a>
  <a href="https://github.com/hemssy/CalculatorApp/tree/Lv8"><img src="https://img.shields.io/badge/Lv8-000000?style=for-the-badge&labelColor=f5f5f5&color=f5f5f5"/></a>
</p>


---
## Stacks 🐈
### Environment
<img src="https://img.shields.io/badge/Xcode-1575F9.svg?style=for-the-badge&logo=Xcode&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">

### Development
<img src="https://img.shields.io/badge/Swift-F05138.svg?style=for-the-badge&logo=swift&logoColor=white">   

### OS
<img src="https://img.shields.io/badge/iOS-000000.svg?style=for-the-badge&logo=apple&logoColor=white">

---
## 실행 화면

<img src="https://github.com/user-attachments/assets/4268e3a3-64fd-4a85-8563-72fee2ab8fe9" width="300" height="600" />

---
## 구현 포인트

### SnapKit 활용해서 UI 구성

계산기 화면을 코드베이스로 만들고, SnapKit으로 제약 설정해서 버튼 디자인 구현함

### NSExpression 활용해서 계산 및 입력 제어 로직 구현

문자열 수식을 NSExpression으로 계산하고, 계산기의 `AC`, `=`, `연산자 중복 방지`, `맨 앞자리 0 제거` 와 같은 입력 제어 로직을 추가함



























