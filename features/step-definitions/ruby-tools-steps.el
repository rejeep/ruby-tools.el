;; NOTE:
;;   There is a reason for adding text properties in a few steps. This
;;   is because when Emacs run in batch-mode, text properties are not
;;   set correctly. Not sure why...

(Then "^ruby-tools-mode should be active$"
      (lambda ()
        (assert ruby-tools-mode nil "Expected `ruby-tools-mode' to be started, but was not.")))

(And "^I place the cursor on the symbol \"\\(.+\\)\"$"
     (lambda (symbol)
       (goto-char (point-min))
       (let* ((max
               (search-forward (concat ":" symbol)))
              (min
               (search-backward (concat ":" symbol)))
              (middle
               (/ (+ max min) 2)))
         (add-text-properties min max '(face font-lock-constant-face))
         (goto-char middle))))

(And "^I place the cursor on \"\\(.+\\)\"$"
     (lambda (text)
       (goto-char (point-min))
       (let* ((max
               (search-forward text))
              (min
               (search-backward text))
              (middle
               (/ (+ max min) 2)))
         (goto-char middle))))

