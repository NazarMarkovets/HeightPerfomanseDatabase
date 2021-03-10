using System;
using System.IO;

namespace DataLib.Modules
{
    public class DataWriter
    {
        public string database,oneline, path;
        public int counter,insertedRows;
                
        public string Path
        {
            get { return path; }
            set { path = directoryManager.ReturnPath(); }
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



        public void WriteInsert( string lines)
        {
            
            using (StreamWriter w = new StreamWriter(Path,true))
            {
                try
                {
                    insertedRows++;
                    var insertLine = $"INSERT INTO {database} VALUES ({insertedRows},\"{lines}\")";
                    WriteIntoFile(insertLine, w);
                }
                catch
                {
                    throw new ApplicationException();
                }
            }
        }
        internal void WriteIntoFile(string insert, TextWriter w)
        {
            w.WriteLine($"{insert}");
            w.Close();
        }

        internal void WriteFormatedText(string lines)
        {
            using (StreamWriter сWriter = File.AppendText(@"Dat\FormatedText.txt"))
            {
                WriteIntoFile(lines, сWriter);
            }
        }

    }
}