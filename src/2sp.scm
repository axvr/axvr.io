#!/usr/local/bin/csi -script

;;; -*- scheme -*-
;;; vim: set ft=scheme :

;;;; Improve readability of HTML documents by making white space at the end of
;;;; sentences slightly wider.  (Uses double-space to detect end of sentences.)
;;;;
;;;; No rights reserved.  Public domain.

;;; TODO: simplify and combine both regular expressions?

(import (chicken io)
        (chicken irregex))

(define thin-space " ")  ; &thinsp;

(define (repair)
  (define 2-space
    '(: (=> punct
            (or #\. #\! #\?)
            (* (or #\) #\] #\" #\')))
        (= 2 " ")
        (=> first
            (* (or #\( #\[ #\" #\'))
            (or upper-case numeric))))

  (define end-of-line
    '(: (=> punct
            (or #\. #\! #\?)
            (* (or #\) #\] #\" #\')))
        eol))

  (define (process-line line)
    (when (not (eof-object? line))
      (display
        (irregex-replace/all 2-space
                             (irregex-replace end-of-line
                                              line
                                              (lambda (match)
                                                (string-append (irregex-match-substring match 'punct)
                                                               thin-space)))
                             (lambda (match)
                               (string-append (irregex-match-substring match 'punct)
                                              thin-space
                                              " "
                                              (irregex-match-substring match 'first)))))
      (newline)
      (process-line (read-line))))
    (process-line (read-line)))

(repair)
