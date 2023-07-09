;;; clueless-theme.el

;; Author: Riccardo Berbeglia
;; Filename: clueless-theme.el
;; Package-Requires: ((emacs "24"))

;; Dark green blue color scheme with tan colors. Inspired by Jonathan Blow's compiler livestreams.

(unless (>= emacs-major-version 24)
  (error "This theme requires Emacs 24 or later!"))

(deftheme clueless "Clueless color theme")

(let ((background "#062626")
      (gutters    "#062329")
      (gutter-fg  "#062329")
      (gutters-active "#062329")
      (builtin      "#ffffff")
      (selection  "#0000ff")
      (text       "#d1b897")
      (comments   "#6cc16c")
      (punctuation "#8cde94")
      (keywords "#ffffff")
      (variables "#c1d1e3")
      (functions "#ffffff")
      (methods    "#c1d1e3")
      (strings    "#2ec09c")
      (constants "#7ad0c6")
      (macros "#8cde94")
      (numbers "#7ad0c6")
      (white     "#ffffff")
      (error "#ff0000")
      (warning "#ffaa00")
      (highlight-line "#0b3335")
      (line-fg "#126367"))

  (custom-theme-set-faces
   'clueless

   ;; Default colors
   ;; *****************************************************************************

   `(default                          ((t (:foreground ,text :background ,background, :weight normal))))
   `(region                           ((t (:foreground nil :background ,selection))))
   `(cursor                           ((t (:background ,"#89df82"))))
   `(fringe                           ((t (:background ,background   :foreground ,white))))
   `(linum                            ((t (:background ,background :foreground ,gutter-fg))))
   `(highlight ((t (:foreground nil :background ,selection))))

   ;; Font lock faces
   ;; *****************************************************************************

   `(font-lock-keyword-face           ((t (:foreground ,keywords))))
   `(font-lock-type-face              ((t (:foreground ,punctuation))))
   `(font-lock-constant-face          ((t (:foreground ,constants))))
   `(font-lock-variable-name-face     ((t (:foreground ,variables))))
   `(font-lock-builtin-face           ((t (:foreground ,builtin))))
   `(font-lock-string-face            ((t (:foreground ,strings))))
   `(font-lock-comment-face           ((t (:foreground ,comments))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,comments))))
   `(font-lock-doc-face               ((t (:foreground ,comments))))
   `(font-lock-function-name-face     ((t (:foreground ,functions))))
   `(font-lock-doc-string-face        ((t (:foreground ,strings))))
   `(font-lock-preprocessor-face      ((t (:foreground ,macros))))
   `(font-lock-warning-face           ((t (:foreground ,warning))))

   ;; Plugins
   ;; *****************************************************************************
   `(trailing-whitespace ((t (:foreground nil :background ,warning))))
   `(whitespace-trailing ((t (:background nil :foreground ,warning :inverse-video t))))

   `(linum ((t (:foreground ,line-fg :background ,background))))
   `(linum-relative-current-face ((t (:foreground ,white :background ,background))))
   `(line-number ((t (:foreground ,line-fg :background ,background))))
   `(line-number-current-line ((t (:foreground ,white :background ,background))))

   ;; hl-line-mode
   `(hl-line ((t (:background ,highlight-line))))
   `(hl-line-face ((t (:background ,highlight-line))))

   ;; mode-line and powerline
   `(mode-line-buffer-id ((t (:foreground ,background :distant-foreground ,text :text ,text :weight bold))))
   `(mode-line ((t (:inverse-video unspecified
                                   :underline unspecified
                                   :foreground ,background
                                   :background ,text
                                   :box nil))))
   `(powerline-active1 ((t (:background ,text :foreground ,background))))
   `(powerline-active2 ((t (:background ,text :foreground ,background))))

   `(mode-line-inactive ((t (:inverse-video unspecified
                                            :underline unspecified
                                            :foreground ,text
                                            :background ,background
                                            :box nil))))
   `(powerline-inactive1 ((t (:background ,background :foreground ,text))))
   `(powerline-inactive2 ((t (:background ,background :foreground ,text))))

   ;; highlight numbers
   `(highlight-numbers-number ((t (:foreground ,numbers))))
  )
)

(provide-theme 'clueless)
(provide 'clueless-theme)
