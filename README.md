---
title: dotfiles
---

## PowerShell
- 创建配置文件
```powershell
New-Item –Path $Profile –Type File –Force
```
- 复制内容`WindowsPowerShell/Microsoft.PowerShell_profile.ps1`到`$profile`

## NeoVim
- 建立硬链接
```cmd
mklink /J C:\Users\xkyii\AppData\Local\nvim .\nvim
```
