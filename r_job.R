
Sys.setenv(HADOOP_CONF_DIR="/etc/hadoop/conf")
Sys.setenv(HADOOP_USER_NAME="hdfs")
Sys.setenv(SPARK_HOME="/opt/spark/latest")
library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))
sc <- sparkR.session(master = "local[*]")

CountryDF <- sql("SELECT country,count(*) FROM parquet.`/guoda/data/idigbio-20170609T073048-1M.parquet` GROUP BY country ")

#write.df(CountryDF, "CountryDF1M.csv","csv")

head(CountryDF)


