
;;; compiler-theme.el

;; Author: Riccardo Berbeglia
;; Filename: compiler-theme.el
;; Package-Requires: ((emacs "24"))

;; Theme inspired by older Jonathan Blow compiler livestreams. (Up until ~2017)

(unless (>= emacs-major-version 24)
  (error "compiler-theme requires Emacs 24 or later."))

(deftheme compiler "Compiler Theme")

(let ((background "#292929")
	  (foreground "#d5b489")
	  (cursor     "#88df8e")
	  (selection  "#f7879a") ;; Mark selection
	  (variables  "#f5f5f5") ;; Shared across variables, functions and keywords.
	  (comments   "#f1e960")
	  (type       "#92d59f") ;; Shared across types and preprocessor directives (font-lock-builtin-face).
	  (constant   "#77c1b8")
	  (strings    "#b2b3b7")
	  )

  (custom-theme-set-faces
   'compiler

   ;; Defaults
   `(default ((t (:background ,background :foreground ,foreground :weight normal :family "Consolas"))))
   `(cursor  ((t (:background ,cursor))))
   `(region  ((t (:background ,selection :foreground nil))))
   `(fringe  ((t (:background ,background :foreground "white"))))

   ;; Font lock faces
   `(font-lock-variable-name-face ((t (:foreground ,variables))))
   `(font-lock-comment-face       ((t (:foreground ,comments))))
   `(font-lock-type-face          ((t (:foreground ,type))))
   `(font-lock-constant-face      ((t (:foreground ,constant))))
   `(font-lock-builtin-face       ((t (:foreground ,type))))
   `(font-lock-keyword-face       ((t (:foreground ,variables))))
   `(font-lock-function-name-face ((t (:foreground ,variables))))
   `(font-lock-string-face        ((t (:foreground ,strings))))

   ;; Mode Line
   `(mode-line           ((t (:inverse-video unspecified :underline unspecified :foreground ,background :background ,foreground :box nil))))
   `(mode-line-inactive  ((t (:inverse-video unspecified :underline unspecified :foreground ,foreground :background ,background :box nil))))
   `(mode-line-buffer-id ((t (:foreground ,background :distant-foreground ,foreground :text ,foreground :weight bold))))
   )
  )

(provide-theme 'compiler)
(provide 'compiler-theme)
