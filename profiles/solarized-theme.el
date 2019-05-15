(use-package solarized-theme
  :if (not window-system)
  :config
  (load-theme 'wombat t)
  :if window-system
  :config
  (load-theme 'solarized-light t))
