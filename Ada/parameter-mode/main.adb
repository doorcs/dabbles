with Ada.Text_IO; use Ada.Text_IO;
-- `with`, `use`를 여러 개 사용할 경우, 공백을 적절히 추가해서 `use`가 세로로 정렬되도록 한다

procedure Main is
   X    : Integer := 3; -- Colons must be surrounded by spaces. Colons should be aligned.
   Y    : Integer := 7; -- Indentation is 3 characters per level. (GNAT Styleguide)
   Q, R : Integer;

   function Str(I : Integer) return String renames Integer'Image; -- 문자열 변환 함수에 대한 별칭

   procedure Swap (A : in out Integer; -- 파라미터 모드 기본값은 `in`이며, `out` 모드와 `in out` 모드도 사용 가능
                   B : in out Integer)
   is
      Temp : constant Integer := A; -- 부프로그램의 지역변수
   begin
      A := B;
      B := Temp;
   end Swap; -- `Call by Value-Result` 방식으로 동작한다! (copy in, copy out)

   procedure Divide (Dividend  : in  Integer;
                     Divisor   : in  Integer;
                     Quotient  : out Integer;
                     Remainder : out Integer) -- `out` 모드 파라미터의 쓸모? 두 개 이상의 반환값이 필요할 때!
   is
   begin
     Quotient  := Dividend / Divisor;
     Remainder := Dividend rem Divisor;
   end Divide; -- 함수는 여러 값을 반환할 수 없기 때문에, 동일한 기능을 함수로 구현하려면 별도의 Record 정의가 필요함

begin -- 메인 프로시저의 선언부(Declarative Part)가 끝나고, 실행부(Executable Part) 시작
   Put_Line ("X =" & Str(X) & ", Y =" & Str(Y));
   Swap (X, Y);
   Put_Line ("X =" & Str(X) & ", Y =" & Str(Y)); -- &를 통해 문자열끼리 연결 가능
   Divide (Quotient  => Q,
           Remainder => R, -- Named Parameter로 파라미터 순서 변경 가능
           Dividend  => X,
           Divisor   => Y);
   Put_Line ("Q =" & Integer'Image(Q) & ", R =" & Integer'Image(R)); -- 별칭 대신 원래 이름도 사용 가능
end Main;

-- X = 3, Y = 7
-- X = 7, Y = 3
-- Q = 2, R = 1
