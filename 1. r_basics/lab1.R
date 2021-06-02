df_student <- data.frame(
  student_id = c(1:3),
  student_name = c("sanjit","nitish","tanya"),
  attendance = c(80,85,90),
  stringsAsFactors = FALSE
)
# Note that indices start with 1 and not 0

print(df_student)
str(df_student)
print(df_student[1:2,])
#extracting specific rows against columns
print(df_student[c(1,3),c(2,3)])
print(df_student$attendance)

df_student$course <- c("BCE","BCB","BCB")
vv <- df_student
print(vv)
