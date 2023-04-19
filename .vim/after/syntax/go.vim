syn match goImportString /^\(\s\+\|import \)\(\h\w* \)\?\zs"[^"]\+"/ contained containedin=goImport
