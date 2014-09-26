rem this file should exist on the packages npm folder.
@IF EXIST "%~dp0\node.exe" (
  "%~dp0\node.exe"  "C:\Users\danierod\Documents\tiddlywiki\TiddlyWiki5-master.1.1\TiddlyWiki5-master\tiddlywiki.js" %*
) ELSE (
  node  "C:\Users\danierod\Documents\tiddlywiki\TiddlyWiki5-master.1.1\TiddlyWiki5-master\tiddlywiki.js" %*
)