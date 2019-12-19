(defconstant B (list 8 7 6 5 4 3 2 1))


;функция вставки
(defun insert (A N LST)
   (cond ((NULL LST) (cons A LST))
      ((eq N 1) (cons A LST))
      (T (cons (car LST)
            (insert A (- N 1)
               (CDR LST)
            )
         )
      )
   )
)
;функция удаления
(defun DEL (N LST)
   (COND ((EQ N 1) (CDR LST))
      (T (CONS (CAR LST)
            (DEL (- N 1) (CDR LST))
         )
      )
   )
)
;функция поиска
(defun SCH (N list)
                   (cond((eq list nil) "НЕ НАЙДЕН!")
                        ((eq (car list) N) "НАЙДЕН!")
                        (t (SCH N (cdr list)))
   )
)
(print "Список:")(print B)

(print "task 1: вставка в список по номеру (вставка числа 10 на 3-е место)")
(set 'spis (insert 10 3 B))
(print spis)

(print "task 2: удаление из списка по позиции (удалить 3-е число)")
(set 'spis(DEL 4 B ))
(print spis)

(print "task 3: поиск элемента по значению")
(print "Значение 8")
(print (SCH 8 B))
(print "Значение 10")
(print (SCH 10 B))


