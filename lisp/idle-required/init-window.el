
;; split window with certain ratio

(defvar samson/ratio-dict
  '((1 . 1.61803398875)
    (2 . 2)
    (3 . 3)
    (4 . 4)
    (5 . 0.61803398875))
  "retio dictionary")

(defun samson/split-window-horizontally (&optional ratio)
  "Split window horizontally and resize the new window.
Always focus bigger window."
  (interactive "P")
  (let* (ratio-val)
    (cond
     (ratio
      (setq ratio-val (cdr (assoc ratio samson/ratio-dict)))
      (split-window-horizontally (floor (/ (window-body-width)
                                           (1+ ratio-val)))))
     (t
      (split-window-horizontally)))
    (set-window-buffer (next-window) (other-buffer))
    (if (or (not ratio-val)
            (>= ratio-val 1))
        (windmove-right))))

(defun samson/split-window-vertically (&optional ratio)
  "Split window vertically and resize the new window.
Always focus bigger window."
  (interactive "P")
  (let* (ratio-val)
    (cond
     (ratio
      (setq ratio-val (cdr (assoc ratio samson/ratio-dict)))
      (split-window-vertically (floor (/ (window-body-height)
                                         (1+ ratio-val)))))
     (t
      (split-window-vertically)))
    ;; open another window with other-buffer
    (set-window-buffer (next-window) (other-buffer))
    ;; move focus if new window bigger than current one
    (if (or (not ratio-val)
            (>= ratio-val 1))
        (windmove-down))))

(global-set-key (kbd "C-x 2") 'samson/split-window-vertically)
(global-set-key (kbd "C-x 3") 'samson/split-window-horizontally)

;; adjust window size
(global-set-key (kbd "C-M-<left>") #'shrink-window-horizontally)
(global-set-key (kbd "C-M-<right>") #'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<down>") #'shrink-window)
(global-set-key (kbd "C-M-<up>") #'enlarge-window)

;; enable winner-mode
(winner-mode 1)

(provide 'init-window)
;; init-window ends here
