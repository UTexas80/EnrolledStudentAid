# ------------------------------------------------------------------------------
# 01. Student Financial Aid Summary ---
# ------------------------------------------------------------------------------
# Step 01.01 clean the tables ###
x01 <- grep("^X20", ls(), value = TRUE)
# ------------------------------------------------------------------------------
# add the file name as a column in a dataframe              https://is.gd/IgsqcA
#                                                           https://is.gd/VYPiJY
# ------------------------------------------------------------------------------
sapply(x01, function(x) {
  dt <- get(x)
  dt[, `:=`(id, substr(x, 2, 7))]
  head(dt, -3)                                     # https://is.gd/MxHrh2
# dt <- dt[1:(nrow(dt)-5),]
# ------------------------------------------------------------------------------
  setDT(dt)
  setkey(dt, "id")
  setorder(dt, id)
})
# ------------------------------------------------------------------------------
l = list(X201502EnrolledStudentAidFile, X201505EnrolledStudentAidFile, X201508EnrolledStudentAidFile,
         X201602EnrolledStudentAidFile, X201605EnrolledStudentAidFile, X201608EnrolledStudentAidFile,
         X201702EnrolledStudentAidFile, X201705EnrolledStudentAidFile, X201708EnrolledStudentAidFile,
         X201802EnrolledStudentAidFile, X201805EnrolledStudentAidFile, X201808EnrolledStudentAidFile,
         X201902EnrolledStudentAidFile, X201905EnrolledStudentAidFile, X201908EnrolledStudentAidFile,
         X202002EnrolledStudentAidFile, X202005EnrolledStudentAidFile, X202008EnrolledStudentAidFile)
# ------------------------------------------------------------------------------
dt_enl_std_aid <- rbindlist(l, use.names = TRUE)
# ------------------------------------------------------------------------------
dt_enl_std_aid <- dt_enl_std_aid[DEGREE_LEVEL == ""]
dt_enl_std_aid[,pell_pct:=PELL_COUNT/ENROLLED_STUDENTS]
dt_enl_std_aid[,hope_zell_pct:=HOPE_ZELL_COUNT/ENROLLED_STUDENTS]
# ------------------------------------------------------------------------------
dt_enl_std_aid <- dt_enl_std_aid[, c(37,6:7,38,9,39)]
############################################################################### Step 01.99: VERSION HISTORY ###
a01.version = "1.0.0"
a01.ModDate = as.Date("2020-07-10")
# ------------------------------------------------------------------------------
# 2020.07.10 - v.1.0.0 1st release
# ------------------------------------------------------------------------------
