geneid <- function(){
  # This script will read all tab delimited files in a directory,
  # then pull all rows >0 for presented peptides (Number_PB) into a new temporary file. This
  # temp file will then be used to pull the gene list. Finally this gene list will
  # be written to a file.
  
  ##########################################################################################
  #################################  SCRIPT VARIABLES  #####################################
  
  file_location<- "C:/Users/H. Rodham/Desktop/MaxProj/all_w_tpm" 

  ##########################################################################################  
  ##########################################################################################
  
  # Using the command "list.file, with the pattern = .GVH.gff3", all files will be
  # listed.
  file_list <- list.files(file_location, pattern="*.GVH.gff3", full.names=TRUE)
  
  #start for loop to read in files
  for (i in seq_along(file_list)){
    # This creates data frames in global enviro
    file_name <- read.delim(file_list[i])
    
    # This creates DF of values where "Number_PB" is >0
    count <- subset(file_name, Number_PB>0)
    assign(basename(file_list[i]), count, envir = .GlobalEnv)
  }
  
  #paste0("count-",i)<-count  
  # pull the gene ids into new file
  #names(res) <- substr(filenames, #start, #stop) #this prevents filename from being too long
  #filename<-paste(filelist[i])
}

#for (i in seq_along(file_list)){
  # This creates data frames in global enviro
  #file_name<- paste0("file", i, sep="")
  #assign(file_name, read.delim(file_list[i]))
  
  # This creates DF of values where "Number_PB" is >0
  #count <- subset(file1, Number_PB>0)
  #assign(paste0("count",i), count, envir = .GlobalEnv)
#}
