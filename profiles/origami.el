(use-package origami
  :ensure t
  :config
  (global-origami-mode t)
  (add-to-list 'origami-parser-alist
	       '(scala-mode . origami-java-parser)))
