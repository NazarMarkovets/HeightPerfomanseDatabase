using System;
using System.Collections.Generic;
using System.IO;

namespace DataLib.Modules
{
    public class DataWriter
    {
        public string database,oneline, path;
        public int counter,insertedRowsCounter;
                
        public string Path
        {
            get { return path; }
            set { path = directoryManager.ReturnPathToFile(); }
        }
        
        private DirectoryManager directoryManager = new DirectoryManager();
        
        public DataWriter()
        {

        }
        public DataWriter(string dbname, int counter)
        {
            this.database = dbname;
            this.counter = counter;
        }

        public void WriteIntoFile(string lines, string fileName)
        {
            directoryManager.CreateFileTxt(fileName);
            using (StreamWriter w = new StreamWriter(Path,true))
            {
                try
                {
                    insertedRowsCounter++;
                    var insertLine = $"INSERT INTO {database} VALUES ({insertedRowsCounter},\"{lines}\")";
                    w.WriteLine(insertLine);
                    w.Close();
                }
                catch
                {
                    throw new ApplicationException();
                }
            }
        }

        public void WriteIntoFile(string fileName, List<string> preparedData)
        {
            directoryManager.CreateFileTxt(fileName);
            using (StreamWriter w = new StreamWriter(Path,true))
            {
                try
                {
                    insertedRowsCounter++;
                    var insertLine = PrepareInserts(preparedData);
                    w.Write(insertLine);
                    w.Close();
                }
                catch
                {
                    throw new ApplicationException();
                }
            }
        }
        public List<string> PrepareInserts(List<string> dataList)
        {
            List<string> inserts = new List<string>();
            foreach(string item in dataList)
            {
                insertedRowsCounter++;
                var insertLine = $"INSERT INTO {database} VALUES ({insertedRowsCounter},\"{item}\")";
                inserts.Add(insertLine);  
            }
            return inserts;
        }
    }
}