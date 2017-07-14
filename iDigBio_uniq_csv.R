Sys.setenv(HADOOP_CONF_DIR="/etc/hadoop/conf")
Sys.setenv(HADOOP_USER_NAME="hdfs")
Sys.setenv(SPARK_HOME="/opt/spark/latest")
library(SparkR, lib.loc = c(file.path(Sys.getenv("SPARK_HOME"), "R", "lib")))
sc <- sparkR.session(master = "local[*]")

entiredata <- read.df("/guoda/data/idigbio-20170609T073048-1M.parquet")

ColumnName<- colnames(entiredata)
NewColumnNames<-ColumnName[15:76]

for(i in NewColumnNames){
    if("geopoint" %in% i){
        next
    }
    print(i)
    query<-paste0("SELECT ",i,",count(*) FROM parquet.`/guoda/data/idigbio-20170609T073048-1M.parquet`GROUP BY ", i)
    DF<-sql(query)
    command<-paste0("iDigBio_20170609T073048_uniq_",i,".csv")
    write.df(DF,command,"csv")
}
