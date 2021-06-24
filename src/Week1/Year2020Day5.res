let input = Node.Fs.readFileAsUtf8Sync("input/Week1/Year2020Day5.txt")

//Part-1 : Boarding pass 중 가장 큰 SeatID 를 찾기
/**
*
* row 
   - first 7 letters(0-127)
   - F = lower half, B = upper half
* column
    - last 3 letters (0-7)
    - L = lower half, R = upper half

* SeatID
    row * 8 + column 
*/

//logic
/**
    First-trial
    1. pass 에서 SeatID 계산
        1-1. 처음 7자리 추출하여 0-127 사이 최종 값 X 계산
        1-2. 마지막 3자리 추출하여 0-7 사이 최종 값 Y 계산
        1-3. X * 8 + Y 계산.
    2. max 

    Second-trial
    1. binary 에서 F,L 을 1 , B,R 을 0 으로 생각
    2. boarding pass 의 char 를 하나씩 순회하면서 *2(shift)함
    3. max
*/

// 2 binary bit 연산으로 접근해보기

let bPass = input->Js.String2.split("\n")->Belt.Array.keep(b => b != "")

let seatIds = bPass->Belt.Array.map(p => {
  p
  ->Js.String2.split("")
  ->Belt.Array.reduce(0, (acc, c) => {
    c == "B" || c == "R" ? acc * 2 + 1 : acc * 2
  })
})

seatIds->Belt.Array.reduce(0, (acc, id) => acc > id ? acc : id)->Js.log

//Part-2 : 내 자리 찾기!
/**
    input list 중에 없는 자리를 찾아라 = 내 자리.

    단, 비행기의 처음과 끝 좌석은 아니다. [0,0], [127,7]
    list에서 나의 좌석에서 -1, +1 좌석이 반드시 존재한다.
*/

//logic
/**
    1. 
*/
