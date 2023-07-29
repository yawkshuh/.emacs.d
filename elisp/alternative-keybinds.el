(global-set-key "\ef" 'find-file)
(global-set-key "\eF" 'find-file-other-window)

(global-set-key "\eb" 'ido-switch-buffer)
(global-set-key "\eB" 'ido-switch-buffer-other-window)

(global-set-key "\es" 'save-buffer)
(global-set-key "\eR" 'revert-buffer)

(global-set-key "\ew" 'other-window)
(global-set-key "\ek" 'kill-this-buffer)

(global-set-key [C-tab] 'indent-region)
(global-set-key "\C-q" 'kill-ring-save)
(global-set-key "\C-f" 'yank)
(global-set-key "\C-w" 'kill-region)

(global-set-key "\e:" (lambda ()
						(interactive)
						(let ((current-prefix-arg '(4)))
						  (call-interactively #'set-mark-command))))

(global-set-key "\e;" 'exchange-point-and-mark)

(global-set-key "\eu" 'undo)
(global-set-key "\ej" 'imenu)

(global-set-key "\eo" 'query-replace)

(defun clueless-replace-in-region (old-word new-word)
  (interactive "sReplace: \nsReplace: %s  With: ")
  (save-excursion (save-restriction
					(narrow-to-region (mark) (point))
					(beginning-of-buffer)
					(replace-string old-word new-word)
					))
  )

(global-set-key "\el" 'clueless-replace-in-region)
(global-set-key "\e." 'fill-paragraph)

(global-set-key "\en" 'next-error)
(global-set-key "\eN" 'previous-error)
(global-set-key "\eg" 'goto-line)

(provide 'alternative-keybinds)
