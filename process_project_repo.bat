@echo off
rem --------------
rem --- config ---
rem --------------

set home_drive=J:\
set home_directory=%home_drive%\Projects\Terraform_Projects\Admiral_Infra

set working_drive=J:\
set working_directory=%home_drive%\Projects\Terraform_Projects\Admiral_Infra

set archive_drive=J:\
set archive_directory=%archive_drive%\Projects\Terraform_Projects\Archive

cd %home_directory%

rem ---------------
rem --- startup ---
rem ---------------

cd %working_directory%
cd .terraform\providers\registry.terraform.io\hashicorp\aws\5.91.0\windows_amd64

rem ---------------------------
rem --- move terraform file ---
rem ---------------------------
dir *.exe > nul 2> nul

if %errorlevel% == 0 (
move terraform-provider-aws_v5.91.0_x5.exe %archive_directory%  >nul 2>nul
)
rem --------------------------------------
rem --- go back to working directory   ---
rem --------------------------------------

cd %working_directory%

rem ---------------------------
rem --- remote reports      ---
rem ---------------------------
git remote -v
git branch -r -v
git remote show origin

git ls-remote 
git ls-remote origin

rem ---------------------------
rem --- git tasks      ---
rem ---------------------------
echo ---------------------------------------------------
echo Perform a Git Commit..
echo ---------------------------------------------------

git commit

echo ---------------------------------------------------
echo Perform a Git Push..
echo ---------------------------------------------------

git push

echo ---------------------------------------------------
echo End Git Tasks
echo ---------------------------------------------------

rem --------------------------------------
rem --- go back to home directory      ---
rem --------------------------------------

cd %home_directory%

echo ----------------------------------------
echo --- Now restore the terraform exe ------
echo ----------------------------------------

cd %working_directory%
cd .terraform\providers\registry.terraform.io\hashicorp\aws\5.91.0\windows_amd64

copy %archive_directory%\terraform-provider-aws_v5.91.0_x5.exe *.* /Y  >nul 2>nul

rem --------------------------------------
rem --- go back to home directory      ---
rem --------------------------------------

cd %home_directory%

rem --------------------------------------
rem --- Perform a Terraform Validate   ---
rem --------------------------------------
echo Performing a Terraform Validate..
terraform validate