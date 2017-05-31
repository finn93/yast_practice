;练习1

;用递归编写下面的函数。
;用于统计表中元素个数的my-length函数。（length是一个预定义函数）。
(define (my-length list)
  	(if (null? list)
  	    0
  	    (+ 1 (my-length (cdr list)))))

;一个求和表中元素的函数。
(define (my-sum ls)
	(if (null? ls)
	    0
	    (if (not (number? (car ls)))
	        'error
	        (+ (car ls) (my-sum (cdr ls))))))

;一个分别接受一个表ls和一个对象x的函数，该函数返回从ls中删除x后得到的表。
(define (my-del ls x)
  	(if (null? ls)
  	    '()
  	    (if (eqv? (car ls) x)
  	        (my-del (cdr ls) x)
  	        (cons (car ls) (my-del (cdr ls) x)))))

;一个分别接受一个表ls和一个对象x的函数，该函数返回x在ls中首次出现的位置。
;索引从0开始。如果x不在ls中，函数返回#f。
(define (my-ser ls x)
    (let ((num 0))
      (if (null? ls)
          #f
          (if (eqv? (car ls) x)
              (+ 1 num)
              (my-ser (cdr ls) x)))))


;练习2

;用尾递归编写下面的函数

;1. 用于翻转表元素顺序的my-reverse函数。（reverse函数是预定义函数）
(define (my-reverse ls)
    (my-reverse-rec ls '()))

(define (my-reverse-rec ls0 ls1)
    (if (null? ls0)
        ls1
        (my-reverse-rec (cdr ls0) (cons (car ls0) ls1))))
    

;2. 求和由数构成的表。
(define (my-sum-tail ls)
    (my-sum-tail-rec ls 0))

(define (my-sum-tail-rec ls sum)
    (if (null? ls)
        sum
        (if (not (number? (car ls)))
            'error
            (my-sum-tail-rec (cdr ls) (+ sum (car ls))))))

;3. 将一个代表正整数的字符串转化为对应整数。
;   例如，"1232"会被转化为1232。不需要检查不合法的输入。
;   提示，字符到整数的转化是通过将字符#\0……#\9的ASCII减去48，
;        可以使用函数char->integer来获得字符的ASCII码。
;        函数string->list可以将字符串转化为由字符构成的表。
(define (my-asc2num str)
    (my-asc2num-rec (string->list str) (length (string->list str)) 0))

(define (my-asc2num-rec ls lg sum)
    (if (= lg 0)
        sum
        (my-asc2num-rec (cdr ls) (length (cdr ls)) (+ sum (* (- (char->integer (car ls)) 48) (expt 10 (- lg 1)))))))

;练习3

;用命名let编写下面的函数。

;练习1的问题3和问题4；
;一个分别接受一个表ls和一个对象x的函数，该函数返回从ls中删除x后得到的表。
(define (my-del-let ls x)
    (let loop((n1 (length ls)))
      (if (= n1 0)
          '()
          (let ((m (- n1 1)))
            (loop m (car))))))


;一个分别接受一个表ls和一个对象x的函数，该函数返回x在ls中首次出现的位置。
;索引从0开始。如果x不在ls中，函数返回#f。

;练习2中的函数；
;求和由数构成的表。

;range函数：返回一个从0到n的表（但不包含n）。




















