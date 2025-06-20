(defvar *x* nil) ; 동적 바인딩을 사용하기 위해 `*x*`를 special variable로 선언하고 nil로 초기화
;; `defvar` 키워드가 핵심!!! 변수명 양 옆에 `*`를 붙이는건 special variable임을 나타내는 관례일 뿐이다

(defun big1 ()
  (let ((*x* 1))
    (labels ((sub1 ()
               (let ((*x* 2))
                 (sub2)))
             (sub2 () ; `*x*` 변수가 동적으로 바인딩되기 때문에, 호출 순서에 따라 출력이 달라짐 (파라미터는 없다!)
               (let ((y *x*))
                 (format t "~a~%" y))))
      (sub1)
      (sub2)
      (format t "big1 end~%"))))

(defun big2 ()
  (let ((x 1))
    (labels ((sub1 ()
               (let ((x 2))
                 (sub2)))
             (sub2 ()
               (let ((y x))
                 (format t "~a~%" y))))
      (sub1)
      (sub2)
      (format t "big2 end~%"))))

(big1) ; dynamic variable binding

(big2) ; lexical variable binding (special variable을 사용하지 않을 뿐, 코드 구조는 동일)

;; 2
;; 1
;; big1 end
;; 1
;; 1
;; big2 end
