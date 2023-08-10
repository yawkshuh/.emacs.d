;;; handmade-theme.el

;; Author: Riccardo Berbeglia
;; Filename: handmade-theme.el
;; Package-Requires: ((emacs "24"))

;; Dark theme inspired by Handmade Hero's livestreams.

(unless (>= emacs-major-version 24)
  (error "This theme requires Emacs 24 or later!"))

(deftheme handmade "Handmade Hero color theme")

;; The correct background color would be "#161616";
;; but when using it, Emacs displays a darker bg color
;; behind text, for no apparent reason.

;; Example of the same problem I'm facing:
;; https://stackoverflow.com/questions/51487862/emacs-showing-slightly-different-color-under-text-than-background

(let ((background "#171717") 
	  (foreground "#cdaa7d")
	  (cursor     "#40ff40")
	  (builtin    "#dab98f")
	  (comment    "#7f7f7f")
	  (constant   "#6b8e23")
	  (doc        "#7f7f7f")
	  (function   "#cdaa7d")
	  (keyword    "#cd950c")
	  (string     "#6b8e23")
	  (type       "#cdaa7d")
	  (variable   "#cdaa7d")
	  (white      "#ffffff"))

  (custom-theme-set-faces
   'handmade

   ;; Default colors
   `(default ((t (:foreground ,foreground :background ,background))))
   `(cursor  ((t (:background ,cursor))))
   `(fringe  ((t (:background ,background :foreground ,white))))

   ;; Font lock faces
   `(font-lock-builtin-face       ((t (:foreground ,builtin))))
   `(font-lock-comment-face       ((t (:foreground ,comment :background ,background))))
   `(font-lock-constant-face      ((t (:foreground ,constant))))
   `(font-lock-doc-face           ((t (:foreground ,doc))))
   `(font-lock-function-name-face ((t (:foreground ,function))))
   `(font-lock-keyword-face       ((t (:foreground ,keyword))))
   `(font-lock-string-face        ((t (:foreground ,string))))
   `(font-lock-type-face          ((t (:foreground ,type))))
   `(font-lock-variable-name-face ((t (:foreground ,variable))))
   )
  )

(provide-theme 'handmade)
(provide 'handmade-theme)
   
   
	  
