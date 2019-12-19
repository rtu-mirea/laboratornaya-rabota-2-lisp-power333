(defconstant test (list 1 1 1 1 0 1 0 0 0 0 0 0 1 1))

;;Функция сжатия списка
(defun compress (x)
    (if (consp x)
        (compr (car x) 1 (cdr x))
        x))

;;;compr - рекурсивная функция
;;elt - последний встреченный элемент
;;lst - остаток списка, подлежащий дальнейшей компрессии
(defun compr (elt n lst)
    (if (null lst)
        (list (n-elts elt n))
        (let ((next (car lst)));;car от списка - это первый элемент в списке, (nth n list) возвращает n-нный элемент списка list.
            (if (eql next elt)
                (compr elt (+ n 1) (cdr lst));;cdr от списка - это оставшаяся часть списка
                (cons (n-elts elt n) ;;Функция (CONS O1 O2) возвращает точечную пару, у которой CAR-элемент указывает на OB1, а CDR-элемент - на OB2. 
                    (compr next 1 (cdr lst)))))))

;;;n-elts - возвращающая сжатое представление N элементов elt
(defun n-elts (elt n)
    (if (> n 1)
        (list n elt)
        elt))

;;Функция расжатия списка
(defun uncompress (lst)
    (if (null lst)
        nil
        (let ((elt (car lst))
                (rest (uncompress (cdr lst))))
            (if (consp elt)
                ;;функция (APPEND L1 L2 ... Ln) создает и возвращает список, состоящий из элементов списков, начиная со списка L1 и по список Ln. 
                (append (apply #'list-of elt)rest);;Синтаксис #'является синтаксической оберткой для FUNCTION.
                (cons elt rest)))))

;;listof - копирование атома и раскрытие списков
(defun list-of (n elt)
    (if (zerop n)
        nil
        (cons elt (list-of (- n 1) elt))))

;;Вызов функций сжатия и расжатия
(print (compress test)) 
(print (uncompress (compress test)))