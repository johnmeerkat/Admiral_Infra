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

move terraform-provider-aws_v5.91.0_x5.exe %archive_directory% 

git commit
git push
