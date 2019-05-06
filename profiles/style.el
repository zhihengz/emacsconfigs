;; common styles

(delete-selection-mode t)
;; enable visual feedback on selelction
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

(setq-default show-trailing-whitespace t)
(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))

(setq tab-width 2
      indent-tabs-mode nil)

(defalias 'yes-or-no-p 'y-or-n-p)

;; display column #
(column-number-mode t)
;; display line #
(line-number-mode t)
;; display time
(display-time-mode 1)
;; always end a file with a newline
(setq require-final-newline t)
;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)
;; matching parens
(show-paren-mode t)
(global-auto-revert-mode t)

;; uniquify
(setq uniquify-buffer-name-style 'forward)
(require 'uniquify)
