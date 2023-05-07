<!-- badges: start -->
[![R-CMD-check](https://github.com/aminadibi/epicIR/workflows/R-CMD-check/badge.svg)](https://github.com/aminadibi/epicIR/actions)
<!-- badges: end -->
[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

# epicIR مدل جامع بررسی بیماری مزمن انسدادی ریه - بومی‌شده برای ایران
 برای اطلاعات بیش‌تر به مقالات منتشر شده مراجعه کنید:

Sadatsafavi, M., Ghanbarian, S., Adibi, A., Johnson, K., Mark FitzGerald, J., Flanagan, W., … Sin, D. (2019). Development and Validation of the Evaluation Platform in COPD (EPIC): A Population-Based Outcomes Model of COPD for Canada. Medical Decision Making. [https://doi.org/10.1177/0272989X18824098](https://doi.org/10.1177/0272989X18824098)

Johnson KM, Sadatsafavi M, Adibi A, Lynd L, Harrison M, Tavakoli H, Sin DD, Bryan S. Cost effectiveness of case detection strategies for the early detection of COPD. Applied Health Economics and Health Policy. 2021 Mar;19(2):203-15. [https://doi.org/10.1007/s40258-020-00616-2](https://doi.org/10.1007/s40258-020-00616-2)

## بررسی اجمالی
epicIR یک رابط کاربری را برای برقراری ارتباط با ارزیابی پلتفرم COPD (EPIC) ارائه می‌دهد، یک مدل شبیه‌سازی رویداد گسسته (DES) کل بیماری برای بیماری مزمن انسدادی ریوی.

## نصب
### ویندوز 
1. آخرین نسخه‌ی R را از [https://cran.r-project.org/bin/windows/base/](https://cran.r-project.org/bin/windows/base/) دانلود و نصب کنید
2. R Studio را از [https://www.rstudio.com/products/rstudio/download/](https://www.rstudio.com/products/rstudio/download/) دانلود و نصب کنید
3. آخرین نسخه‌ی Rtools را از [https://cran.r-project.org/bin/windows/Rtools/](https://cran.r-project.org/bin/windows/Rtools/) دانلود و نصب کنید
4. با استفاده از یک جلسه‌ی R در ترمینال یا در R Studio، بسته‌ی `devtools` را نصب کنید:

```r
  install.packages('remotes')
```

5. مدل را از گیت‌هاب نصب کنید

```r
remotes::install_github('aminadibi/epicIR')
```

### مک او اس
1. آخرین نسخه‌ی R را از [https://cran.r-project.org/bin/macosx/](https://cran.r-project.org/bin/macosx/) دانلود و نصب کنید
2. R Studio را از [https://www.rstudio.com/products/rstudio/download/](https://www.rstudio.com/products/rstudio/download/) دانلود و نصب کنید

3. آخرین نسخه‌ی `clang` را با نصب ابزارهای دستوری Xcode نصب کنید:
`xcode-select --install`

4. نسخه‌ی مناسب `gfortran` را بر اساس نسخه‌ی Mac OS خود با استفاده از فایل dmg در [https://mac.r-project.org/tools/) نصب کنید

5. با استفاده از یک جلسه‌ی R در ترمینال یا در R Studio، بسته‌های `remotes` و `usethis` را نصب کنید:

```r
install.packages (c('remotes', 'usethis'))
```

6. حالا باید بتوانید epicIR را از GitHub نصب کنید:
```r
remotes::install_github('aminadibi/epicIR')
```

### اوبونتو 
۱. آخرین نسخه‌ی R را از [https://cran.r-project.org/bin/linux/ubuntu/fullREADME.html](1. آخرین نسخه‌ی R را از [https://cran.r-project.org/bin/linux/ubuntu/fullREADME.html](https://cran.r-project.org/bin/windows/base/) دانلود و نصب کنید
) دانلود و نصب کنید

۲. بسته‌های زیر را از ترمینال نصب کنید 

```bash
  sudo apt-get install libcurl4-openssl-dev libssl-dev
```

۳. با استفاده از یک جلسه‌ی R در ترمینال یا در R Studio، بسته‌ی `devtools` را نصب کنید:

```r
install.packages ('remotes')
```

۴. epicIR را از GitHub نصب کنید:

```r
remotes::install_github('aminadibi/epicIR')
```

# راهنمای سریع

برای اجرای EPIC-IR با ورودی ها و تنظیمات پیش فرض، از کد زیر استفاده کنید.

```
library(epicIR)
init_session()
run()
Cget_output()
terminate_session()
```

ورودی های پیش فرض می توانند با استفاده از `get_input()` بازیابی شوند، به دلخواه تغییر داده شوند و به عنوان پارامتر برای تابع run مجدداً ارسال شوند:

```
init_session()
input <- get_input()
input$values$global_parameters$time_horizon <- 5
run(input=input$values)
results <- Cget_output()
resultsExra <- Cget_output_ex()
terminate_session()

```

برای برخی مطالعات، دسترسی به تمام تاریخچه رویدادهای جمعیت شبیه ممکن است مفید باشد. ثبت تاریخچه رویداد با تنظیم `record_mode` به عنوان یک `setting` امکان پذیر است.

```
settings <- get_default_settings()
settings$record_mode <- 2
settings$n_base_agents <- 1e4
init_session(settings = settings)
run()
results <- Cget_output()
events <- as.data.frame(Cget_all_events_matrix())
head(events)
terminate_session()

```

توجه داشته باشید که در صورت تمایل به جمع آوری تاریخچه رویداد برای تعداد بیماران بسیار زیاد، شما باید مقدار حافظه بسیار بالایی در دسترس داشته باشید.

در دیتافریم رویدادها، هر نوع رویداد یک کد مربوط به جدول زیر دارد:

|رویداد|شماره|
|-----|---|
|شروع |0 |
|سالیانه|1 |
|تولد| 2 |
|تغییر در سابقه سیگاری | 3|
|مبتلا به COPD | 4|
|تشدید | 5 |
|پایان تشدید| 6|
|مرگ در اثر تشدید | 7|
|بازدید دکتر | 8|
|تغییر در دارو | 9|
|مرگ پس زمینه | 13|
|پایان | 14|

## تحلیل گروه بسته

تحلیل گروه بسته می توان با تغییر پارامترهای ورودی مناسب مشخص شود.

```
library(epicIR)
input <- get_input(closed_cohort = 1)$values
init_session()
run(input=input)
Cget_output()
terminate_session()
```

# Peer Models Network: EPIC on the Cloud

The [Peer Models Network](https://www.peermodelsnetwork.com/) provides educational material abour the model. It also allows users to access EPIC through the cloud. A MACRO-enabled Excel-file can be used to interact with the model and see the results. To download the PRISM Excel template file for EPIC, or to access EPIC using APIs please refer to the [PMN model repository](https://models.peermodelsnetwork.com/#/)

## Citation

Please cite:

```Sadatsafavi, M., Ghanbarian, S., Adibi, A., Johnson, K., Mark FitzGerald, J., Flanagan, W., … Sin, D. (2019). Development and Validation of the Evaluation Platform in COPD (EPIC): A Population-Based Outcomes Model of COPD for Canada. Medical Decision Making. https://doi.org/10.1177/0272989X18824098```
